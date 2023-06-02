if (activar_evento and (other.accion != 26)) {
    dibujar_efectos(spr_efecto_velocidad, image_angle, 1, 1, false);
    
    if (other.accion == 4) {
        vspeed = 0;
        hspeed = 0;
        instance_destroy(obj_enfoque_homing);
    }
	
	other.angulo = 0;
    other.accion = 5;
    other.tocando_suelo = false;
    other.indice_sprite = 0;
    other.x = x + 10 * dcos(image_angle);
    other.y = y - 10 * dsin(image_angle);
    other.velocidad_horizontal = dcos(image_angle) * cantidad_fuerza;
    other.velocidad_vertical = -dsin(image_angle) * cantidad_fuerza;
	activar_evento = false;

    if ((image_angle < 90) and (image_angle > 270)) {
        other.direccion_horizontal = 1;
    } else if ((image_angle > 90) and (image_angle < 270)) {
        other.direccion_horizontal = -1;
    }
    image_speed = 0.75;

    audio.detener_audio(snd_trampolin);
    audio.reproducir_audio(snd_trampolin);
	audio_play_sound(snd_trampolin_trampa, 1, false);

    switch (global.personaje_actual) {
        case "Sonic":
            if ((image_angle == 45) or (image_angle == 135)) {
                other.indice_sprite = 0;
                other.sprite_actual = spr_sonic_cinta_moebius;
            } else if (((image_angle > 0) and (image_angle < 45)) or ((image_angle < 180) and (image_angle > 135))) {
                other.sprite_actual = spr_sonic_impulsarse_pared;
            } else {
                other.sprite_actual = spr_sonic_saltando;
            }
            break;
        case "Shadow":
            if ((image_angle == 45) or (image_angle == 135)) {
                other.indice_sprite = 0;
                other.sprite_actual = spr_shadow_cinta_moebius;
            } else if (((image_angle > 0) and (image_angle < 45)) or ((image_angle < 180) and (image_angle > 135))) {
                other.sprite_actual = spr_shadow_impulsarse_pared;
            }
	        else {
                other.sprite_actual = spr_shadow_saltando;
            }
            break;
    }
}