if ((fase_animacion == 1) and (other.accion != 26)) {
    // Variables
    image_index = 0;
	fase_animacion = 2;

	// Establecer el punto de controles
	var pos_y = y - other.mascara_colision;
	var tiempo_punto_control = cronometro.obtener_tiempo("numerico");
	nivel.establecer_punto_control(x, pos_y, tiempo_punto_control);
	
	// Crear efectos
	var parametros = other.parametros_checkpoint;
    if (other.sprite_index != parametros.animacion_normal) {
        audio.reproducir_audio(snd_checkpoint);
        crear_elemento_gui(x, y, obj_mensaje_checkpoint);
    }
}