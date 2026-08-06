/**
 * axiosConfig.js
 * Configuración centralizada de Axios con interceptores JWT
 */

import axios from 'axios';
import { getToken, clearAuth, isTokenValid } from './tokenManager';

// Configuración base de Axios
const axiosInstance = axios.create({
    baseURL: import.meta.env.VITE_API_BASE_URL || '/api/v2',
    timeout: 30000,
    headers: {
        'Content-Type': 'application/json',
    }
});

/**
 * Interceptor de REQUEST
 * Agrega automáticamente el token JWT a todas las peticiones
 */
axiosInstance.interceptors.request.use(
    (config) => {
        let token = getToken();

        const publicAuthEndpoints = [
            '/funcionarios/login',
            '/funcionarios/login/select-service'
        ];

        const isPublicAuthRequest = publicAuthEndpoints.some(
            endpoint => config.url?.startsWith(endpoint)
        );

        /*
         * Los endpoints públicos de autenticación no necesitan el JWT final.
         * Si existe un token antiguo o vencido, se elimina, pero no se cancela
         * la petición de inicio de sesión.
         */
        if (isPublicAuthRequest) {
            if (token && !isTokenValid()) {
                console.warn(
                    '[Axios] Se eliminó un token vencido antes de iniciar sesión.'
                );

                clearAuth();
                token = null;
            }

            delete config.headers.Authorization;
            return config;
        }

        /*
         * Para los endpoints protegidos sí se rechaza la petición cuando
         * el token está vencido.
         */
        if (token && !isTokenValid()) {
            console.warn(
                '[Axios] Token expirado. Limpiando sesión antes de la petición.'
            );

            clearAuth();

            if (!window.location.pathname.includes('/login')) {
                window.location.href = '/login';
            }

            return Promise.reject(new Error('La sesión ha expirado'));
        }

        if (token) {
            config.headers.Authorization = `Bearer ${token}`;
        }

        if (import.meta.env.VITE_DEBUG === 'true') {
            console.log(
                `[Axios] ${config.method?.toUpperCase()} ${config.url}`,
                {
                    headers: config.headers,
                    data: config.data
                }
            );
        }

        return config;
    },
    (error) => {
        console.error('[Axios] Request error:', error);
        return Promise.reject(error);
    }
);

/**
 * Interceptor de RESPONSE
 * Maneja errores de autenticación (401) y otros errores globales
 */
axiosInstance.interceptors.response.use(
    (response) => {
        // Log para debugging (activar con VITE_DEBUG=true)
        if (import.meta.env.VITE_DEBUG === 'true') {
            console.log(`[Axios] Response ${response.status}:`, response.data);
        }
        return response;
    },
    (error) => {
        if (import.meta.env.VITE_DEBUG === 'true') {
            console.error('[Axios] Response error:', error);
        }

        if (error.response) {
            const { status, data } = error.response;

            // 401: Token inválido o expirado — ignorar en endpoints de login (credenciales wrongas, no sesión expirada)
            const isLoginEndpoint = error.config?.url?.includes('/login');
            if (status === 401 && !isLoginEndpoint) {
                console.warn('[Axios] Token inválido o expirado. Limpiando autenticación...');
                clearAuth();
                if (!window.location.pathname.includes('/login')) {
                    window.location.href = '/login';
                }
            }

            // 403: Sin permisos
            if (status === 403) {
                console.error('[Axios] Acceso denegado. Sin permisos suficientes.');
                // Podrías mostrar un mensaje o redirigir a una página de error
            }

            // Agregar el mensaje de error al objeto error para fácil acceso
            error.message = data?.error || data?.message || error.message;
        } else if (error.request) {
            // La petición se hizo pero no hubo respuesta
            console.error('[Axios] No se recibió respuesta del servidor');
            error.message = 'No se pudo conectar con el servidor';
        }

        return Promise.reject(error);
    }
);

export default axiosInstance;
