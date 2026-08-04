package com.pingeso.HUAP.Repository;

import com.pingeso.HUAP.Entity.NotificacionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * Repositorio {@link NotificacionEntity}.
 * <p>
 * Además de las operaciones CRUD básicas heredadas de {@link JpaRepository},
 * proporciona consultas para obtener y contar notificaciones asociadas a solicitudes
 * y funcionarios específicos.
 * </p>
 */

@Repository
public interface NotificacionRepository extends JpaRepository<NotificacionEntity, Long> {

    /** Obtiene la lista de notificaciones asociadas a un funcionario (ya sea como emisor o receptor de la solicitud),
     * excluyendo aquellas cuyo estado sea {@code 'ELIMINADO'}.
     * <p>
     * Los resultados se devuelven ordenados descendentemente por la fecha de envío (de la más reciente a la más antigua).
     * </p>
     */
    Optional<NotificacionEntity> findBySolicitud_IdSolicitud(Long idSolicitud);
    @Query("SELECT n FROM NotificacionEntity n JOIN n.solicitud s " +
            "WHERE (s.funcionario.idFuncionario = :idFuncionario " +
            "OR s.funcionarioReceptor.idFuncionario = :idFuncionario) " +
            "AND n.estado != 'ELIMINADO' " +
            "ORDER BY n.fechaEnvio DESC")

    /** Cuenta el total de notificaciones con estado {@code 'NO_LEIDO'} pertenecientes a un funcionario,
     * considerando si es el emisor o el receptor de la solicitud asociada.
     */
    List<NotificacionEntity> findByFuncionarioId(@Param("idFuncionario") Long idFuncionario);
    @Query("SELECT COUNT(n) FROM NotificacionEntity n JOIN n.solicitud s " +
       "WHERE (s.funcionario.idFuncionario = :idFuncionario OR s.funcionarioReceptor.idFuncionario = :idFuncionario) " +
       "AND n.estado = 'NO_LEIDO'")
    long countNoLeidasByFuncionario(@Param("idFuncionario") Long idFuncionario);

}
