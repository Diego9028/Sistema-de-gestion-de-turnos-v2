package com.pingeso.HUAP.Controller;

import com.pingeso.HUAP.DTO.CrearNotificacionDTO;
import com.pingeso.HUAP.DTO.NotificacionRespuestaDTO;
import com.pingeso.HUAP.Entity.NotificacionEntity;
import com.pingeso.HUAP.Service.NotificacionService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
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

/**
 * Controlador REST para la gestión de las notificaciones del sistema.
 *
 * <p>Permite crear notificaciones asociadas a solicitudes, consultar la bandeja de un
 * funcionario, contar mensajes no leídos y cambiar el estado de una notificación a
 * {@code LEIDO} o {@code ELIMINADO}.</p>
 *
 * <p>La eliminación es lógica: la notificación permanece almacenada, pero su estado se
 * modifica a {@code ELIMINADO}. Las consultas de bandeja excluyen las notificaciones que
 * tengan dicho estado.</p>
 *
 * <p>Ruta base: {@code /api/v2/notificaciones}.</p>
 */
@RestController
@RequestMapping("/api/v2/notificaciones")
@RequiredArgsConstructor
@Tag(name = "Notificaciones",
        description = "Creación, consulta y actualización del estado de las notificaciones del sistema.")
public class NotificacionController {

    private final NotificacionService notificacionService;

    /**
     * Cuenta las notificaciones no leídas asociadas a un funcionario.
     *
     * <p>Se consideran las notificaciones de solicitudes en las que el funcionario participa
     * como emisor o como receptor.</p>
     *
     * @param idFuncionario identificador del funcionario consultado.
     * @return cantidad de notificaciones con estado {@code NO_LEIDO}.
     */
    @Operation(summary = "Contar notificaciones sin leer",
            description = "Cuenta las notificaciones NO_LEIDO de las solicitudes en las que el "
                    + "funcionario participa como emisor o receptor.")
    @ApiResponse(responseCode = "200", description = "Cantidad de notificaciones obtenida correctamente")
    @GetMapping("/sin-leer/{idFuncionario}")
    public ResponseEntity<Long> contarSinLeer(@PathVariable Long idFuncionario) {
        return ResponseEntity.ok(notificacionService.contarNoLeidasPorUsuario(idFuncionario));
    }

    /**
     * Marca una notificación como leída.
     *
     * @param id identificador de la notificación.
     * @return respuesta sin contenido adicional; devuelve 404 si la notificación no existe.
     */
    @Operation(summary = "Marcar una notificación como leída",
            description = "Cambia el estado de la notificación indicada a LEIDO.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Notificación marcada como leída"),
            @ApiResponse(responseCode = "404", description = "Notificación no encontrada")
    })
    @PutMapping("/{id}/leer")
    public ResponseEntity<Void> marcarLeida(@PathVariable Long id) {
        boolean actualizado = notificacionService.marcarLeido(id);
        return actualizado ? ResponseEntity.ok().build() : ResponseEntity.notFound().build();
    }

    /**
     * Elimina lógicamente una notificación.
     *
     * <p>La operación no elimina el registro de la base de datos; cambia su estado a
     * {@code ELIMINADO}, por lo que deja de aparecer en la bandeja del funcionario.</p>
     *
     * @param id identificador de la notificación.
     * @return respuesta sin contenido adicional; devuelve 404 si la notificación no existe.
     */
    @Operation(summary = "Eliminar lógicamente una notificación",
            description = "Cambia el estado de la notificación a ELIMINADO sin borrar físicamente el registro.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Notificación eliminada lógicamente"),
            @ApiResponse(responseCode = "404", description = "Notificación no encontrada")
    })
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        boolean eliminado = notificacionService.marcarComoEliminado(id);
        return eliminado ? ResponseEntity.ok().build() : ResponseEntity.notFound().build();
    }

    /**
     * Crea una notificación asociada a una solicitud existente.
     *
     * <p>La notificación se registra inicialmente con estado {@code NO_LEIDO} y con la
     * fecha y hora actuales.</p>
     *
     * @param dto datos de la notificación: solicitud asociada y mensaje.
     * @return la notificación creada y persistida.
     */
    @Operation(summary = "Crear una notificación",
            description = "Crea una notificación asociada a una solicitud. Se registra con "
                    + "estado NO_LEIDO y con la fecha de envío actual.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Notificación creada correctamente"),
            @ApiResponse(responseCode = "400", description = "La solicitud indicada no existe")
    })
    @PostMapping
    public ResponseEntity<NotificacionEntity> crear(@RequestBody CrearNotificacionDTO dto) {
        return ResponseEntity.ok(notificacionService.crearNotificacion(dto));
    }

    /**
     * Obtiene la bandeja de notificaciones de un funcionario.
     *
     * <p>Devuelve las notificaciones no eliminadas, ordenadas desde la más reciente a la
     * más antigua y convertidas a {@link NotificacionRespuestaDTO}.</p>
     *
     * @param idFuncionario identificador del funcionario.
     * @return lista de notificaciones visibles para el funcionario.
     */
    @Operation(summary = "Obtener la bandeja de un funcionario",
            description = "Lista las notificaciones no eliminadas asociadas al funcionario, "
                    + "ordenadas desde la más reciente a la más antigua.")
    @ApiResponse(responseCode = "200", description = "Bandeja obtenida correctamente")
    @GetMapping("/usuario/{idFuncionario}")
    public ResponseEntity<List<NotificacionRespuestaDTO>> getBandeja(@PathVariable Long idFuncionario) {
        return ResponseEntity.ok(notificacionService.obtenerNotificacionesFuncionario(idFuncionario));
    }

    /**
     * Obtiene una notificación por su identificador.
     *
     * @param id identificador de la notificación.
     * @return la notificación encontrada.
     */
    @Operation(summary = "Obtener una notificación por ID")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Notificación encontrada"),
            @ApiResponse(responseCode = "400", description = "Notificación no encontrada")
    })
    @GetMapping("/{id}")
    public ResponseEntity<NotificacionEntity> getNotificacion(@PathVariable long id) {
        return ResponseEntity.ok(notificacionService.findNotificacionById(id));
    }

    /**
     * Lista todas las notificaciones almacenadas en el sistema.
     *
     * <p>Esta consulta no filtra por funcionario, servicio ni estado.</p>
     *
     * @return lista completa de notificaciones.
     */
    @Operation(summary = "Listar todas las notificaciones",
            description = "Devuelve todas las notificaciones almacenadas, sin filtrar por usuario o estado.")
    @ApiResponse(responseCode = "200", description = "Notificaciones obtenidas correctamente")
    @GetMapping
    public ResponseEntity<List<NotificacionEntity>> getAllNotificacion() {
        return ResponseEntity.ok(notificacionService.findAllNotificacion());
    }

    /**
     * Obtiene la notificación asociada a una solicitud.
     *
     * @param id identificador de la solicitud.
     * @return notificación asociada a la solicitud indicada.
     */
    @Operation(summary = "Obtener la notificación de una solicitud",
            description = "Busca la notificación asociada al identificador de solicitud indicado.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Notificación encontrada"),
            @ApiResponse(responseCode = "400", description = "No existe una notificación para la solicitud")
    })
    @GetMapping("/solicitud/{id}")
    public ResponseEntity<NotificacionEntity> getNotificacionSolicitud(@PathVariable long id) {
        return ResponseEntity.ok(notificacionService.findByIdSolicitud(id));
    }
}
