package com.pingeso.HUAP.Repository;

import com.pingeso.HUAP.Entity.OfertaGeneralEntity;
import jakarta.persistence.LockModeType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

/**
 * Repositorio {@link OfertaGeneralEntity}.
 * <p>
 * Además de las operaciones CRUD básicas heredadas de {@link JpaRepository},
 * proporciona consultas para filtrar ofertas por ofertor, servicio o lista de turnos (con sus postulaciones cargadas),
 * así como mecanismos de bloqueo pesimista para concurrencia.
 * </p>
 */
@Repository
public interface OfertaGeneralRepository extends JpaRepository<OfertaGeneralEntity, Long> {

    /** Busca y obtiene una lista de ofertas generales publicadas por un funcionario ofertor específico. */
    List<OfertaGeneralEntity> findByOfertor_IdFuncionario(Long idFuncionario);
    /** Obtiene una lista de ofertas generales asociadas a un servicio específico, navegando a través del turno. */
    List<OfertaGeneralEntity> findByTurno_Servicio_IdServicio(Long idServicio);

    /**
     * Obtiene una lista única de ofertas generales pertenecientes a un conjunto de turnos,
     * realizando la carga anticipada ({@code FETCH}) de sus postulaciones y postulantes para evitar consultas N+1.
     * <p>
     * Los resultados se devuelven ordenados por fecha de creación descendentemente (las más recientes primero).
     * </p>
     */
    @Query("""
        SELECT DISTINCT o
        FROM OfertaGeneralEntity o
        LEFT JOIN FETCH o.postulaciones p
        LEFT JOIN FETCH p.postulante
        WHERE o.turno.idTurno IN :idsTurnos
        ORDER BY o.fechaCreacion DESC
    """)
    List<OfertaGeneralEntity> findByTurnoIdInWithPostulaciones(@Param("idsTurnos") List<Long> idsTurnos);

    /**
     * Lock pesimista (SELECT ... FOR UPDATE) sobre la fila de la oferta. Se usa en
     * {@code seleccionarPostulante} para serializar dos jefaturas seleccionando postulantes
     * distintos para la misma oferta al mismo tiempo, y releer su estado con datos frescos
     * (no la foto de antes de esperar el lock). Debe invocarse dentro de una transacción.
     */
    @Lock(LockModeType.PESSIMISTIC_WRITE)
    @Query("SELECT o FROM OfertaGeneralEntity o WHERE o.idOfertaGeneral = :id")
    Optional<OfertaGeneralEntity> findByIdForUpdate(@Param("id") Long id);
}
