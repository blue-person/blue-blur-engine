if (jugador_existe) {
	if (activar_evento) {
		// Ajustar la bandera
		if (not place_meeting(x, y, jugador)) {
			activar_evento = false;
		}
		
		// Ajustar velocidad vertical
		if (jugador.accion == 27) {
			if (vspeed >= -8) then vspeed -= 0.25;
		}
	} else if (posicion_inicial > y) {
		// Regresar a la posicion inicial
		y += 4;
	}
}