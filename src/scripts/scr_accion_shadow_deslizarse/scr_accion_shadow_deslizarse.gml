function gestion_accion_shadow_deslizarse() {
    if (tocando_suelo and (accion == 0) and controles.boton_presionado("boton_ataque")) {
        image_index = 0;

        if (abs(velocidad_horizontal) < 10) {
            velocidad_horizontal = 10 * direccion_horizontal;
        }

        accion = 9;
        audio.reproducir_audio(snd_ataque_shadow_b);
        audio.reproducir_audio(snd_teletransportacion);
    }

    if (accion == 9) {
        if (velocidad_horizontal > 0) {
            velocidad_horizontal -= friccion;
        }

        if (velocidad_horizontal < 0) {
            velocidad_horizontal += friccion;
        }

        if ((image_index >= 23) or not tocando_suelo) {
            accion = 0;
        }
    }
}