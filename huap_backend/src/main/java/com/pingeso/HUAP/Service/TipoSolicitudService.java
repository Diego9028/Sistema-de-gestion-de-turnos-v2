package com.pingeso.HUAP.Service;

import com.pingeso.HUAP.Repository.TipoSolicitudRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Servicio reservado para la gestión del catálogo de tipos de solicitud.
 *
 * <p>Actualmente la clase solo dispone del {@link TipoSolicitudRepository} y no expone
 * operaciones públicas. Los tipos de solicitud son utilizados por otros flujos del sistema,
 * pero su consulta o administración todavía no se ha implementado en este servicio.</p>
 */
@Service
public class TipoSolicitudService {

    /** Repositorio previsto para consultar y persistir tipos de solicitud. */
    @Autowired
    private TipoSolicitudRepository tipoSolicitudRepository;


}
