function gestion_accion_sonic_deslizarse() {
    if (tocando_suelo and (accion == 0) and (abs(velocidad_horizontal) >= 3) and control.boton_mantenido("boton_ataque")) {
        sprite_index = spr_sonic_trotando;
        accion = 9;
        audio.reproducir_audio(snd_ataque_sonic_c);
    }

    if (accion == 9) {
        if (velocidad_horizontal > 0) {
            direccion_horizontal = 1;
        } else if (velocidad_horizontal < 0) {
            direccion_horizontal = -1;
        }

        if (direccion_horizontal == 1 and control.boton_mantenido("boton_izquierda")) {
            velocidad_horizontal -= desaceleracion;
        } else if (direccion_horizontal == -1 and control.boton_mantenido("boton_derecha")) {
            velocidad_horizontal += desaceleracion;
        }

        if (velocidad_horizontal > 0) {
            velocidad_horizontal -= friccion;
        }

        if (velocidad_horizontal < 0) {
            velocidad_horizontal += friccion;
        }

        if ((abs(velocidad_horizontal) < 1) or!tocando_suelo) {
            accion = 0;
        }

        if (!control.boton_mantenido("boton_ataque")) {
            accion = 2;
        }
    }
}