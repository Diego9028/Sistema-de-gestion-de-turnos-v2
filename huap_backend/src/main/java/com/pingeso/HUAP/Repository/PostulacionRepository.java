package com.pingeso.HUAP.Repository;

import com.pingeso.HUAP.Entity.PostulacionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * Repositorio {@link PostulacionEntity}.
 * <p>
 * Además de las operaciones CRUD básicas heredadas de {@link JpaRepository},
 * proporciona métodos para consultar y verificar las postulaciones realizadas por los funcionarios
 * a las ofertas generales.
 * </p>
 */
@Repository
public interface PostulacionRepository extends JpaRepository<PostulacionEntity, Long> {
    /** Obtiene la lista de todas las postulaciones registradas para una oferta general específica. */
    List<PostulacionEntity> findByOfertaGeneral_IdOfertaGeneral(Long idOfertaGeneral);
    /** Busca la postulación realizada por un funcionario específico dentro de una oferta general determinada. */
    Optional<PostulacionEntity> findByOfertaGeneral_IdOfertaGeneralAndPostulante_IdFuncionario(Long idOfertaGeneral, Long idFuncionario);
    /** Verifica si un funcionario ya se encuentra postulado a una oferta general específica. */
    boolean existsByOfertaGeneral_IdOfertaGeneralAndPostulante_IdFuncionario(Long idOfertaGeneral, Long idFuncionario);
}
