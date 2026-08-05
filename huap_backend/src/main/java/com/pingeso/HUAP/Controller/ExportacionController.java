package com.pingeso.HUAP.Controller;

import com.pingeso.HUAP.Service.ExportacionService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Controlador REST encargado de generar y descargar reportes del sistema en formato CSV.
 *
 * <p>Permite exportar los funcionarios asociados a un servicio y los turnos registrados
 * durante un mes determinado. La exportación de turnos puede filtrarse opcionalmente por
 * funcionario y servicio.</p>
 *
 * <p>Los archivos son generados por {@link ExportacionService} y se entregan como arreglos
 * de bytes mediante una respuesta HTTP con encabezado {@code Content-Disposition}, para que
 * el cliente los descargue directamente.</p>
 *
 * <p>Ruta base: {@code /api/v2/exportaciones}.</p>
 */
@RestController
@RequestMapping("/api/v2/exportaciones")
@Tag(name = "Exportaciones",
        description = "Generación y descarga de reportes CSV de funcionarios y turnos.")
public class ExportacionController {

    private final ExportacionService exportacionService;

    /**
     * Construye el controlador con el servicio encargado de generar los archivos CSV.
     *
     * @param exportacionService servicio de exportación utilizado por los endpoints.
     */
    public ExportacionController(ExportacionService exportacionService) {
        this.exportacionService = exportacionService;
    }

    /**
     * Exporta en formato CSV los funcionarios vigentes asociados a un servicio.
     *
     * <p>El archivo contiene los datos identificatorios del funcionario, su profesión,
     * el servicio al que pertenece y su rol dentro de dicho servicio.</p>
     *
     * @param idServicio identificador del servicio cuyos funcionarios serán exportados.
     * @return respuesta HTTP que contiene el archivo CSV como arreglo de bytes.
     */
    @Operation(summary = "Exportar funcionarios de un servicio a CSV",
            description = "Genera un archivo CSV con los funcionarios vigentes asociados al "
                    + "servicio indicado y el rol que desempeñan en él.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Archivo CSV generado correctamente"),
            @ApiResponse(responseCode = "400", description = "El servicio no existe o se encuentra eliminado")
    })
    @GetMapping("/servicios/{idServicio}/funcionarios/csv")
    public ResponseEntity<byte[]> exportarFuncionariosPorServicioCsv(
            @PathVariable Long idServicio
    ) {
        byte[] archivo = exportacionService.exportarFuncionariosPorServicioCsv(idServicio);

        String nombreArchivo = "funcionarios_servicio_" + idServicio + ".csv";

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + nombreArchivo + "\"")
                .contentType(MediaType.parseMediaType("text/csv; charset=UTF-8"))
                .body(archivo);
    }

    /**
     * Exporta los turnos correspondientes a un mes y año en formato CSV.
     *
     * <p>La consulta puede limitarse a un funcionario, a un servicio o a ambos. Cuando
     * no se entregan filtros opcionales, se exportan todos los turnos encontrados durante
     * el período solicitado.</p>
     *
     * @param anio año del período que se desea exportar.
     * @param mes mes del período, con un valor entre 1 y 12.
     * @param idFuncionario identificador opcional del funcionario por el que se filtrará.
     * @param idServicio identificador opcional del servicio por el que se filtrará.
     * @return respuesta HTTP que contiene el archivo CSV generado como arreglo de bytes.
     */
    @Operation(summary = "Exportar turnos mensuales a CSV",
            description = "Genera un archivo CSV con los turnos del año y mes indicados. "
                    + "Opcionalmente filtra los resultados por funcionario y/o servicio.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Archivo CSV generado correctamente"),
            @ApiResponse(responseCode = "400", description = "Año o mes ausente, o mes fuera del rango permitido")
    })
    @GetMapping("/turnos/csv")
    public ResponseEntity<byte[]> exportarTurnosCsv(
            @RequestParam Integer anio,
            @RequestParam Integer mes,
            @RequestParam(required = false) Long idFuncionario,
            @RequestParam(required = false) Long idServicio
    ) {
        byte[] archivo = exportacionService.exportarTurnosCsv(
                anio,
                mes,
                idFuncionario,
                idServicio
        );

        String nombreArchivo = "turnos_" + anio + "_" + mes;

        if (idServicio != null) {
            nombreArchivo += "_servicio_" + idServicio;
        }

        if (idFuncionario != null) {
            nombreArchivo += "_funcionario_" + idFuncionario;
        }

        nombreArchivo += ".csv";

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + nombreArchivo + "\"")
                .contentType(MediaType.parseMediaType("text/csv; charset=UTF-8"))
                .body(archivo);
    }
}
