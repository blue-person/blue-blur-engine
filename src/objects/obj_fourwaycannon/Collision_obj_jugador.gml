// Variables
var mantener_parte_vertical = controles.boton_mantenido("boton_arriba") or controles.boton_mantenido("boton_abajo")
var mantener_parte_horizontal = controles.boton_mantenido("boton_derecha") or controles.boton_mantenido("boton_izquierda");

// Gestionar la direccion de apuntado
if ((mantener_parte_vertical or mantener_parte_horizontal) and (other.accion == 21)) {
	if (direccion_apuntado < 6) {
		direccion_apuntado++;
	}
} else {
    if (direccion_apuntado > 0) {
		direccion_apuntado--;
	} else {
        angulo_tubos = 0;
        direccion_apuntado = 0;
    }
}

// Ajustar visibilidad del jugador
other.visible = false;