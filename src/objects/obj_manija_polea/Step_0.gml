if (!place_meeting(x, y, obj_jugador)) {
	activar_evento = false;
}
    
if (activar_evento and (obj_jugador.accion == 27)) {
    if (vspeed >= -8) {
		vspeed -= 0.25;
	}
} else if (!activar_evento and (y < ubicacion_predeterminada)) {
    y += 4;
}