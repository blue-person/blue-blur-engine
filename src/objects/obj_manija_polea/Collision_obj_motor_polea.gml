if (activar_evento) {
	// Detener sonidos
    audio.detener_audio(snd_usar_polea);
	
	// Ajustar parametros
    vspeed = 0;
    jugador.accion = 0;
    jugador.velocidad_vertical = -cantidad_fuerza;
}