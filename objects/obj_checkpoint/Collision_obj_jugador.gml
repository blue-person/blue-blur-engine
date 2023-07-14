if ((estado_animacion == 1) and (other.accion != 26)) {
    // Cambiar variables
	estado_animacion = 2;
    image_index = 0;
			
	// Establecer el punto de control
	nivel.establecer_punto_control(x, y, obj_cronometro.tiempo_en_numeros);
	
	// Reproducir sonido
    if ((other.sprite_actual != spr_sonic_normal) and (other.sprite_actual != spr_shadow_normal)) {
        audio.reproducir_audio(snd_checkpoint);
        instance_create_depth(x, y, -80, obj_mostrar_info_checkpoint);
    }
}