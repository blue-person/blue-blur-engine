if (jugador_existe and not activar_evento) {
	if (not place_meeting(x, y, jugador)) {
		activar_evento = true;
	}
}