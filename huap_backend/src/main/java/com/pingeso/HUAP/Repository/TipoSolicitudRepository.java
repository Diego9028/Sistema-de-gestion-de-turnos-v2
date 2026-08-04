package com.pingeso.HUAP.Repository;

import com.pingeso.HUAP.Entity.TipoSolicitudEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


/**
 * Repositorio {@link TipoSolicitudEntity}.
 * <p>
 * Propociona las operaciones CRUD básicas heredadas de {@link JpaRepository},
 */
@Repository
public interface TipoSolicitudRepository extends JpaRepository<TipoSolicitudEntity, Long> {

}
