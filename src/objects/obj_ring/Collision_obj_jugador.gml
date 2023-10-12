if (other.accion != 26) {
	// Acticar efectos
	crear_efecto(x, y, efecto_visual);
	audio.reproducir_audio_aislado(efecto_sonido, false);

	// Aumentar contador de rings
	if (jugador.rings < 100) {
		jugador.rings += valor_aumento_rings;
		if (jugador.rings >= 100) then aumentar_vidas();
	} else {
		jugador.rings += valor_aumento_rings;
	}
	
	// Destruir el objeto
	instance_destroy();
}