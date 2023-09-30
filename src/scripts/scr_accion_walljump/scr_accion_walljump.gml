function gestion_accion_walljump() {
	// Mantenerse en la pared antes de saltar
    if (accion == 19) {
        velocidad_vertical = 0;
        velocidad_horizontal = 0;

        if (control.boton_presionado("boton_salto")) {
            alarm[2] = 0;
            direccion_horizontal = -direccion_horizontal;
            accion = 20;
            velocidad_vertical = -7;
            velocidad_horizontal = direccion_horizontal * 9;
            audio.reproducir_audio(snd_walljump);
        }
    }

    // Saltar de la pared
    if (accion == 20) {
        if (tocando_suelo or (velocidad_vertical >= 0)) {
            accion = 0;
        }
    }
}