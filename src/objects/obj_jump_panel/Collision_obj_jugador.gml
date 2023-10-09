if ((other.accion == 24) and activar_evento) {
	// Modificar valores del jugador
    other.image_angle = image_angle;
    other.accion = 25;
	
	// Gestionar efectos
	activar_evento = false;
	instance_create_depth(x, y, Profundidades.Interfaz, obj_qte_jump_panel);
    audio.reproducir_audio(snd_tocar_jump_panel);
}