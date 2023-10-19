if (activar_evento and (other.accion == 24)) {
	// Modificar valores del objeto
	activar_evento = false;
	
	// Gestionar efectos
    audio.reproducir_audio(snd_tocar_jump_panel);
	crear_elemento_gui(x, y, obj_qte_jump_panel);
	
	// Modificar valores del jugador
    other.accion = 25;
    other.angulo = image_angle;
}