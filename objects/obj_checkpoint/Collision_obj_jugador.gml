if ((estado_animacion == 1) and (other.accion != 26)) {
    estado_animacion = 2;
    image_index = 0;
	
    if ((other.sprite_actual != spr_sonic_normal) and (other.sprite_actual != spr_shadow_normal)) {
        audio.reproducir_audio(snd_checkpoint);
        instance_create_depth(x, y, -80, obj_mostrar_info_checkpoint);
    }

	// Determinar el punto de control
    var tiempo = [obj_controlador_tiempo.milisegundos, obj_controlador_tiempo.segundos, obj_controlador_tiempo.minutos];
    reaparicion.establecer_punto_control(x, y, tiempo);
}