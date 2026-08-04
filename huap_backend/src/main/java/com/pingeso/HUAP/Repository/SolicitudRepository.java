package com.pingeso.HUAP.Repository;

import com.pingeso.HUAP.Entity.SolicitudEntity;
import jakarta.persistence.LockModeType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;


/**
 * Repositorio {@link SolicitudEntity}.
 * <p>
 * Además de las operaciones CRUD básicas heredadas de {@link JpaRepository},
 * proporciona consultas para obtener solicitudes mediante funcionario,
 * receptor, tipo de solicitud, turno ademas de mantener actulizadas estas
 * </p>
 */
@Repository
public interface SolicitudRepository extends JpaRepository<SolicitudEntity, Long>{
    /** Busca y obtiene las solicitudes de un funcionario */
    List<SolicitudEntity> findByFuncionario_IdFuncionario(Long idFuncionario);
    /** Busca y obtiene las solicitudes de un funcionario receptor*/
    List<SolicitudEntity> findByFuncionarioReceptor_IdFuncionario(Long idFuncionario);
    /** Busca y obtiene la solicitudes por cierto tipo */
    List<SolicitudEntity> findByTipoSolicitud_IdTipoSolicitud(Long idTipoSolicitud);
    /** Busca y obtiene las solicitudes de un turno */
    List<SolicitudEntity> findByTurno_IdTurno(Long idTurno);

    /**
     * Lock pesimista (SELECT ... FOR UPDATE) sobre la fila de la solicitud. Se usa en
     * {@code cambiarEstado} para releer su estado con datos frescos (no la foto de antes de
     * esperar el lock del turno) y detectar si otra aprobación concurrente ya la resolvió.
     * Debe invocarse dentro de una transacción.
     */
    @Lock(LockModeType.PESSIMISTIC_WRITE)
    @Query("SELECT s FROM SolicitudEntity s WHERE s.idSolicitud = :id")
    Optional<SolicitudEntity> findByIdForUpdate(@Param("id") Long id);

}
