package com.pingeso.HUAP.Controller;

import com.pingeso.HUAP.DTO.ReglaServicioDTO;
import com.pingeso.HUAP.Service.ReglaServicioService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * Controlador REST para administrar las reglas de ajuste horario de cada servicio.
 *
 * <p>Una regla determina si, durante fines de semana y/o feriados, se deben desplazar
 * determinados minutos la hora de inicio o de término de uno o más tipos de turno.</p>
 *
 * <p>Este controlador expone operaciones para listar las reglas vigentes de un servicio,
 * crear nuevas reglas, actualizar las existentes y eliminarlas lógicamente. La aplicación
 * efectiva de las reglas sobre los turnos es realizada por {@link ReglaServicioService}
 * durante los procesos de generación correspondientes.</p>
 *
 * <p>Ruta base: {@code /api/v2/reglas-servicio}.</p>
 */
@RestController
@RequestMapping("/api/v2/reglas-servicio")
@Tag(name = "Reglas de servicio",
        description = "Configuración de ajustes horarios para turnos en fines de semana y feriados.")
public class ReglaServicioController {

    private final ReglaServicioService reglaServicioService;

    /**
     * Construye el controlador con el servicio de reglas horarias.
     *
     * @param reglaServicioService servicio que contiene la lógica de negocio de las reglas.
     */
    public ReglaServicioController(ReglaServicioService reglaServicioService) {
        this.reglaServicioService = reglaServicioService;
    }

    /**
     * Lista las reglas vigentes asociadas a un servicio.
     *
     * @param idServicio identificador del servicio consultado.
     * @return lista de reglas no eliminadas pertenecientes al servicio.
     */
    @Operation(summary = "Listar reglas de un servicio",
            description = "Devuelve las reglas horarias vigentes asociadas al servicio indicado.")
    @ApiResponse(responseCode = "200", description = "Reglas obtenidas correctamente")
    @GetMapping("/servicio/{idServicio}")
    public ResponseEntity<List<ReglaServicioDTO>> obtenerPorServicio(@PathVariable Long idServicio) {
        return ResponseEntity.ok(reglaServicioService.obtenerPorServicio(idServicio));
    }

    /**
     * Crea una nueva regla de ajuste horario para un servicio.
     *
     * <p>Se valida que el servicio exista, que el nombre de la regla no esté vacío y que
     * los tipos de turno indicados existan, estén vigentes y pertenezcan al servicio.</p>
     *
     * @param dto datos de configuración de la nueva regla.
     * @return regla creada, o una respuesta 400 con el mensaje de validación.
     */
    @Operation(summary = "Crear una regla de servicio",
            description = "Crea una regla de ajuste horario y valida el servicio, el nombre "
                    + "y los tipos de turno de inicio y término.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Regla creada correctamente"),
            @ApiResponse(responseCode = "400", description = "Datos inválidos o referencias inexistentes")
    })
    @PostMapping
    public ResponseEntity<?> crear(@RequestBody ReglaServicioDTO dto) {
        try {
            return ResponseEntity.ok(reglaServicioService.crear(dto));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }

    /**
     * Actualiza una regla de ajuste horario existente.
     *
     * <p>La regla debe existir y no estar eliminada. Los tipos de turno indicados deben
     * pertenecer al mismo servicio de la regla.</p>
     *
     * @param id identificador de la regla que se modificará.
     * @param dto nuevos datos de configuración de la regla.
     * @return regla actualizada, o una respuesta 400 con el mensaje de validación.
     */
    @Operation(summary = "Actualizar una regla de servicio",
            description = "Actualiza la configuración de una regla vigente, conservando el "
                    + "servicio al que pertenece.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Regla actualizada correctamente"),
            @ApiResponse(responseCode = "400", description = "Regla inexistente, eliminada o datos inválidos")
    })
    @PutMapping("/{id}")
    public ResponseEntity<?> actualizar(@PathVariable Long id, @RequestBody ReglaServicioDTO dto) {
        try {
            return ResponseEntity.ok(reglaServicioService.actualizar(id, dto));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }

    /**
     * Elimina lógicamente una regla de servicio.
     *
     * <p>La regla permanece almacenada, pero queda marcada como eliminada y deja de ser
     * considerada en las consultas y procesos de aplicación de reglas.</p>
     *
     * @param id identificador de la regla que se eliminará.
     * @return respuesta HTTP 204 cuando la eliminación se realiza correctamente.
     */
    @Operation(summary = "Eliminar una regla de servicio",
            description = "Realiza una eliminación lógica de la regla para que deje de estar vigente.")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Regla eliminada correctamente"),
            @ApiResponse(responseCode = "400", description = "La regla no existe o ya fue eliminada")
    })
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        reglaServicioService.eliminar(id);
        return ResponseEntity.noContent().build();
    }
}
