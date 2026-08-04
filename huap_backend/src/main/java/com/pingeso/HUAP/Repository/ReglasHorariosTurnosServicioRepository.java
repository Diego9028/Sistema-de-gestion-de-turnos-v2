package com.pingeso.HUAP.Repository;

import com.pingeso.HUAP.Entity.ReglasHorariosTurnosServicioEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * Repositorio {@link ReglasHorariosTurnosServicioEntity}.
 * <p>
 * Además de las operaciones CRUD básicas heredadas de {@link JpaRepository},
 * proporciona una consulta para obtener las reglas de un servicio activo
 */
@Repository
public interface ReglasHorariosTurnosServicioRepository
        extends JpaRepository<ReglasHorariosTurnosServicioEntity, Long> {
    /** Busca las reglas de un servicio el cual no este eliminado*/
    List<ReglasHorariosTurnosServicioEntity> findByServicio_IdServicioAndEliminadoFalse(Long idServicio);
}
