if (!place_meeting(x, y, obj_motor_polea) and (other.accion != 26)) {
    if (!activar_evento) {
        audio.reproducir_audio(snd_agarrar_objeto);
        audio.reproducir_audio(snd_usar_polea);
    }
	
    activar_evento = true;
    other.accion = 27;
    other.direccion_horizontal = image_xscale;
	
    if (instance_exists(obj_enfoque_homing)) {
        instance_destroy(obj_enfoque_homing);
    }
	
	if (instance_exists(obj_efecto_boost)) {
		instance_destroy(obj_efecto_boost);
	}
}