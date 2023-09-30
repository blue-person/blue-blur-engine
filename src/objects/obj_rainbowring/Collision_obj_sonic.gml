if (activar_evento and (other.accion != 26)) {
    other.angulo = 0;

    if ((image_angle == 0) or (image_angle == 180)) {
        other.gravedad = 0;
        other.alarma_0 = tiempo_alarma;
        other.accion = 6;
    } else {
        other.accion = 5;
        if ((image_angle == 45) or (image_angle == 135)) {
            other.image_index = 0;
            other.sprite_index = spr_sonic_cinta_moebius;
        } else if (((image_angle > 0) and (image_angle < 45)) or ((image_angle < 180) and (image_angle > 135))) {
            other.sprite_index = spr_sonic_impulsarse_pared;
        } else {
            other.sprite_index = spr_sonic_saltando;
        }
    }

    other.tocando_suelo = false;
    other.image_index = 0;
    other.x = x;
    other.y = y;
    other.velocidad_horizontal = dcos(image_angle) * cantidad_fuerza;
    other.velocidad_vertical = -dsin(image_angle) * cantidad_fuerza;
    other.cantidad_boost += 25;
    activar_evento = false;

    if ((image_angle < 90) and ((image_angle > 270) or (image_angle > -90))) {
        other.direccion_horizontal = 1;
    } else if ((image_angle > 90) and ((image_angle < 270) or (image_angle < -90))) {
        other.direccion_horizontal = -1;
    }

    efecto = instance_create_depth(x, y, 0, obj_efecto_rainbowring);
    efecto.image_angle = image_angle;

    nivel.aumentar_puntaje_cool(1000);
    dibujar_efectos(spr_efecto_rainbowring);

    audio.reproducir_audio_aislado(snd_rainbowring, false);
}