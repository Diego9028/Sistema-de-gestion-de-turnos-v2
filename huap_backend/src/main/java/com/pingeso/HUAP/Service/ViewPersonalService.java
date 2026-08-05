package com.pingeso.HUAP.Service;

import com.pingeso.HUAP.DTO.ViewPersonalSummaryDTO;
import com.pingeso.HUAP.hospital.ViewPersonalEntity;
import com.pingeso.HUAP.hospital.ViewPersonalRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Servicio de consulta del personal proveniente de la vista del sistema hospitalario.
 *
 * <p>Recupera los registros de {@link ViewPersonalEntity}, conserva únicamente al personal
 * cuyo estado es activo ({@code 1}) y expone una representación resumida mediante
 * {@link ViewPersonalSummaryDTO}.</p>
 */
@Service
@RequiredArgsConstructor
public class ViewPersonalService {

    private final ViewPersonalRepository viewPersonalRepository;


    /**
     * Convierte un registro de la vista de personal a su DTO resumido.
     *
     * @param p registro de personal que se convertirá.
     * @return DTO con RUT y nombre del funcionario, o {@code null} si el registro es nulo.
     */
    private ViewPersonalSummaryDTO mapToDTOPersonal(ViewPersonalEntity p){
        if (p == null) return null;

        ViewPersonalSummaryDTO dto = new ViewPersonalSummaryDTO();

        dto.setRut(p.getRut());
        dto.setNombre(p.getNombre());
        dto.setApellidoMaterno(p.getApel_mat());
        dto.setApellidoPaterno(p.getApel_pat());
        dto.setRutCompleto((p.getDv() != null) ? (p.getRut() + "-"+ p.getDv()):p.getRut());

        return dto;
    }

    /**
     * Obtiene todo el personal activo disponible en la vista hospitalaria.
     *
     * @return lista de registros activos convertidos a DTO resumido.
     */
    public List<ViewPersonalSummaryDTO> getAllPersonal(){
        List<ViewPersonalEntity> Personal = viewPersonalRepository.findAll();

        Personal = Personal.stream()
                .filter(p -> p.getEstado() == 1)
                .collect(Collectors.toList());

        return  Personal.stream()
                .map(this::mapToDTOPersonal)
                .collect(Collectors.toList());
    }
}
