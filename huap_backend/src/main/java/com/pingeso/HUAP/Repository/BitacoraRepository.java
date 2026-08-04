package com.pingeso.HUAP.Repository;

import com.pingeso.HUAP.Entity.BitacoraEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Repositorio {@link BitacoraEntity}.
 * <p>
 * Además de las operaciones CRUD básicas heredadas de {@link JpaRepository},
 * proporciona métodos de consulta derivados y personalizados para filtrar registros
 * por tipo de evento, funcionario, turno, solicitud y estado activo.
 * </p>
 */
@Repository
public interface BitacoraRepository extends JpaRepository<BitacoraEntity, Long> {
    /** Busca y obtiene una lista de registros de bitácora filtrados por el tipo de evento. */
    List<BitacoraEntity> findByTipoEvento(String tipoEvento);
    /** Busca los registros de bitácora asociados a un funcionario en específico. */
    List<BitacoraEntity> findByFuncionario_IdFuncionario(Long idFuncionario);
    /** Busca los registros de bitácora vinculados a un turno en específico. */
    List<BitacoraEntity> findByTurno_IdTurno(Long idTurno);
    /** Busca los registros de bitácora asociados a una solicitud en específico. */
    List<BitacoraEntity> findBySolicitud_IdSolicitud(Long idSolicitud);
    /** Obtiene únicamente los registros de bitácora que están marcados como activos. */
    List<BitacoraEntity> findByActivoTrue();
    /**
     * Obtiene una lista única de eventos de bitácora activos relacionados a una lista de turnos,
     * realizando la carga anticipada ({@code FETCH}) de sus relaciones principales para evitar el problema de N+1 queries.
     * <p>
     * Filtra los eventos donde el turno coincida directamente con el turno del evento,
     * o indirectamente a través del turno emisor/receptor de la solicitud asociada.
     *  Los resultados se devuelven ordenados por la fecha de modificación más reciente.
     *  </p>
     */
    @Query("""
        SELECT DISTINCT e
        FROM BitacoraEntity e
        LEFT JOIN FETCH e.turno t
        LEFT JOIN FETCH e.solicitud s
        LEFT JOIN FETCH s.tipoSolicitud ts
        LEFT JOIN FETCH s.turno st
        LEFT JOIN FETCH s.turnoReceptor tr
        WHERE e.activo = true
        AND (
                t.idTurno IN :idsTurnos
            OR st.idTurno IN :idsTurnos
            OR tr.idTurno IN :idsTurnos
        )
        ORDER BY e.fechaModificacion DESC
    """)

    List<BitacoraEntity> findEventosOrigenByTurnos(@Param("idsTurnos") List<Long> idsTurnos);
}
