package com.pingeso.HUAP.Repository;
import com.pingeso.HUAP.Entity.FeriadoEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

/**
 * Repositorio {@link FeriadoEntity}.
 * <p>
 * Además de las operaciones CRUD básicas heredadas de {@link JpaRepository},
 * proporciona métodos de consulta para hayar feriados entre cierta fecha o todos de forma ascendente
 * </p>
 */

@Repository
public interface FeriadoRepository extends JpaRepository<FeriadoEntity, Long> {

    /** Busca y obtiene los dias feriados en un marco de tiempo especifico de forma ascendente */
    List<FeriadoEntity> findByFechaBetweenOrderByFechaAsc(LocalDate desde, LocalDate hasta);
    /** Busca y obtiene todos los dias feriados ordenados de forma ascendente */
    List<FeriadoEntity> findAllByOrderByFechaAsc();
}
