package com.pingeso.HUAP.Repository;

import com.pingeso.HUAP.Entity.PlanificacionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Repositorio {@link PlanificacionEntity}.
 * <p>
 * Además de las operaciones CRUD básicas heredadas de {@link JpaRepository},
 * proporciona consultas para obtener las planificaciones de un servicio y verificar
 * la existencia de nombres duplicados tanto en la creación como en la edición.
 * </p>
 */
@Repository
public interface PlanificacionRepository extends JpaRepository<PlanificacionEntity, Long> {
    /** Busca y obtiene todas las planificaciones asociadas a un servicio específico. */
    List<PlanificacionEntity> findByServicio_IdServicio(Long idServicio);
    /** Verifica si ya existe una planificación registrada con un nombre específico dentro de un servicio.
     */
    boolean existsByServicio_IdServicioAndNombre(Long idServicio, String nombre);
    /** * Verifica si existe otra planificación registrada con el mismo nombre en un servicio,
     * excluyendo el registro especificado.
     */
    boolean existsByServicio_IdServicioAndNombreAndIdPlanificacionNot(Long idServicio, String nombre, Long idPlanificacion);
}
