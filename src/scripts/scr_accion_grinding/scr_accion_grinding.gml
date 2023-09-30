function gestion_grinding() {
	if (velocidad_vertical >= 0) {
        permitir_grinding = true;
    } else {
        permitir_grinding = false;
    }

    if (permitir_grinding and tocando_suelo and colision_con_riel()) {
        if (accion == 2) {
            accion = 0;
        }

        if ((accion != 11) and (accion != 16.5)) {
            audio.reproducir_audio(snd_usar_riel);

            if (!instance_exists(obj_efecto_grinding)) {
                instance_create_depth(x, y, 0, obj_efecto_grinding);
            }
        }
        accion = 11;
    }

    if (accion == 11) {
        if (velocidad_horizontal > 0) {
            direccion_horizontal = 1;
        } else if (velocidad_horizontal < 0) {
            direccion_horizontal = -1;
        }

        if (abs(velocidad_horizontal) < velocidad_horizontal_normal) {
            velocidad_horizontal += aceleracion * direccion_horizontal;
        }

        if (instance_exists(obj_efecto_boost)) {
            velocidad_horizontal = limite_velocidad_horizontal * direccion_horizontal;
        }

        velocidad_horizontal += -asin * (desaceleracion / 6);
        if (!tocando_suelo or !colision_con_riel()) {
            accion = 0;
        }
    }

    if ((accion == 11) or (accion == 16.5)) {
        audio.reproducir_audio_aislado(snd_grinding, true);
    }

    if ((accion != 11) and (accion != 16.5) and (accion != 32) and (accion != 32.5)) {
        audio.detener_audio(snd_grinding);
    }
}