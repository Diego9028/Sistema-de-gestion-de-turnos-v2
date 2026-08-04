package com.pingeso.HUAP.Entity;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

/** Es un historial que conserva las acciones realizadas dentro de un servicio, quien las realizo
 * el turno al cual esta relacionado la accion, la solicitud un posible motivo entre otros detalles
 */

@Builder
@Data
@Table(name = "Bitacora_eventos")
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class BitacoraEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_EVENTO", unique = true, nullable = false)
    private Long idEvento;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ID_FUNCIONARIO")
    private FuncionarioEntity funcionario;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ID_TURNO")
    private TurnoEntity turno;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ID_SOLICITUD")
    private SolicitudEntity solicitud;

    @Column(name = "Tipo_evento")
    private String tipoEvento;

    @Column(name = "Motivo")
    private String motivo;

    @Column(name = "Observaciones")
    private String observaciones;

    @Column(name = "Fecha_inicio_afectada")
    private LocalDateTime fechaInicioAfectada;

    @Column(name = "Fecha_fin_afectada")
    private LocalDateTime fechaFinAfectada;

    @Column(name  = "Fecha_modificacion")
    private LocalDateTime fechaModificacion;

    @Column(name = "Activo")
    private Boolean activo;


}
