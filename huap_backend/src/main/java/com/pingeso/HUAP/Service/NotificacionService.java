package com.pingeso.HUAP.Service;


import com.pingeso.HUAP.DTO.CrearNotificacionDTO;
import com.pingeso.HUAP.DTO.NotificacionRespuestaDTO;
import com.pingeso.HUAP.Entity.NotificacionEntity;
import com.pingeso.HUAP.Entity.SolicitudEntity;
import com.pingeso.HUAP.Repository.NotificacionRepository;
import com.pingeso.HUAP.Repository.SolicitudRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Servicio de gestión de notificaciones del sistema.
 *
 * <p>Permite crear notificaciones vinculadas a solicitudes, consultar las notificaciones
 * visibles para un funcionario, contar las pendientes de lectura y modificar su estado a
 * leído o eliminado.</p>
 *
 * <p>Los estados utilizados actualmente son {@code NO_LEIDO}, {@code LEIDO} y
 * {@code ELIMINADO}.</p>
 */
@Service
@RequiredArgsConstructor
public class NotificacionService {

    private final NotificacionRepository notificacionRepository;
    private final SolicitudRepository solicitudRepository;

    /**
     * Crea una notificación asociada a una solicitud existente.
     *
     * @param dto datos de la notificación, incluyendo el id de la solicitud y el mensaje.
     * @return notificación persistida con estado {@code NO_LEIDO} y la fecha actual.
     * @throws RuntimeException si la solicitud indicada no existe.
     */
    @Transactional
    public NotificacionEntity crearNotificacion(CrearNotificacionDTO dto) {
        SolicitudEntity solicitud = solicitudRepository.findById(dto.getIdSolicitud())
                .orElseThrow(() -> new RuntimeException("Solicitud no existe"));

        NotificacionEntity notificacion = NotificacionEntity.builder()
                .estado("NO_LEIDO")
                .fechaEnvio(LocalDateTime.now())
                .mensaje(dto.getMensaje())
                .solicitud(solicitud)
                .build();

        return notificacionRepository.save(notificacion);
    }

    /**
     * Marca una notificación como leída.
     *
     * @param idNotificacion identificador de la notificación.
     * @return {@code true} si la notificación existía y fue actualizada; {@code false} si no existe.
     */
    @Transactional
    public boolean marcarLeido(Long idNotificacion) {
        return notificacionRepository.findById(idNotificacion).map(notificacion -> {
            notificacion.setEstado("LEIDO");
            notificacionRepository.save(notificacion);
            return true;
        }).orElse(false);
    }

    /**
     * Realiza la eliminación lógica de una notificación cambiando su estado a
     * {@code ELIMINADO}.
     *
     * @param idNotificacion identificador de la notificación.
     * @return {@code true} si la notificación existía y fue actualizada; {@code false} si no existe.
     */
    @Transactional
    public boolean marcarComoEliminado(Long idNotificacion) {
        return notificacionRepository.findById(idNotificacion).map(notificacion -> {
            notificacion.setEstado("ELIMINADO"); // O "ARCHIVADO"
            notificacionRepository.save(notificacion);
            return true;
        }).orElse(false);
    }


    /*
        Modificadores y utilidades
    */

    /**
     * Obtiene las notificaciones vinculadas a solicitudes en las que participa un funcionario.
     *
     * <p>La consulta del repositorio excluye las notificaciones con estado
     * {@code ELIMINADO} y las ordena desde la más reciente.</p>
     *
     * @param idFuncionario identificador del funcionario consultado.
     * @return lista de notificaciones convertidas a DTO de respuesta.
     */
    public List<NotificacionRespuestaDTO> obtenerNotificacionesFuncionario(Long idFuncionario) {
        List<NotificacionEntity> entidades = notificacionRepository.findByFuncionarioId(idFuncionario);

        return entidades.stream()
                .map(this::mapToDTO)
                .collect(Collectors.toList());
    }

    /**
     * Cuenta las notificaciones no leídas de un funcionario.
     *
     * @param idFuncionario identificador del funcionario consultado.
     * @return cantidad de notificaciones con estado {@code NO_LEIDO}.
     */
    public long contarNoLeidasPorUsuario(Long idFuncionario) {
    return notificacionRepository.countNoLeidasByFuncionario(idFuncionario);
    }

    /**
     * Busca una notificación por su identificador.
     *
     * @param id identificador de la notificación.
     * @return notificación encontrada.
     * @throws RuntimeException si la notificación no existe.
     */
    public NotificacionEntity findNotificacionById(Long id) {
        return notificacionRepository.findById(id).orElseThrow(() -> new RuntimeException("Notificacion no encontrada"));
    }


    /**
     * Obtiene todas las notificaciones almacenadas, sin filtrar por funcionario, servicio
     * ni estado.
     *
     * @return lista completa de notificaciones.
     */
    public List<NotificacionEntity> findAllNotificacion(){
        return notificacionRepository.findAll();
    }

    /**
     * Busca la notificación asociada a una solicitud.
     *
     * @param idSolicitud identificador de la solicitud.
     * @return notificación vinculada a la solicitud.
     * @throws RuntimeException si no existe una notificación para la solicitud indicada.
     */
    public NotificacionEntity findByIdSolicitud(Long idSolicitud) {
        return notificacionRepository
                .findBySolicitud_IdSolicitud(idSolicitud)
                .orElseThrow(() -> new RuntimeException(
                        "No existe notificación para la solicitud con ID: " + idSolicitud
                ));
    }

    /**
     * Crea una notificación de sistema sin una solicitud asociada.
     *
     * @param receptor funcionario al que conceptualmente se dirige la notificación.
     * @param mensaje contenido de la notificación.
     * @return notificación persistida con estado {@code NO_LEIDO} y solicitud nula.
     * @implNote La entidad actual no contiene una relación directa con el receptor, por lo
     *           que este parámetro todavía no se persiste. La notificación creada tampoco
     *           será recuperada por las consultas basadas en solicitudes de un funcionario.
     */
    @Transactional
    public NotificacionEntity crearNotificacionSistema(com.pingeso.HUAP.Entity.FuncionarioEntity receptor, String mensaje) {
        NotificacionEntity notificacion = NotificacionEntity.builder()
                .estado("NO_LEIDO")
                .fechaEnvio(LocalDateTime.now())
                .mensaje(mensaje)
                .solicitud(null)
                .build();
        return notificacionRepository.save(notificacion);
    }

    /**
     * Convierte una entidad de notificación al DTO utilizado por la API.
     *
     * @param entity entidad que se convertirá.
     * @return DTO con los datos de la notificación y, cuando existe, el id de su solicitud.
     */
    private NotificacionRespuestaDTO mapToDTO(NotificacionEntity entity) {
        return NotificacionRespuestaDTO.builder()
                .idNotificacion(entity.getIdNotificacion())
                .mensaje(entity.getMensaje())
                .estado(entity.getEstado())
                .fechaEnvio(entity.getFechaEnvio())
                .idSolicitud(entity.getSolicitud() != null ? entity.getSolicitud().getIdSolicitud() : null)
                .build();
    }
}
