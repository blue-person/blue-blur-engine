// Ajustar parametros
if ((not activar_evento) and jugador_existe) {
	if (not place_meeting(x, y, jugador)) {
		activar_evento = true
	}
}