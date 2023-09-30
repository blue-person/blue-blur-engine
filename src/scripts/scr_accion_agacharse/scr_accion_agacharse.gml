function gestion_accion_agacharse() {
	if (control.boton_mantenido("boton_abajo") and tocando_suelo and ((accion == 0) or (accion == 1))) {
        if (abs(velocidad_horizontal) < 1.03125) {
            velocidad_horizontal = 0;
            accion = -1;
            image_index = 0;
        }

        if (abs(velocidad_horizontal) >= 1.03125) {
            accion = 2;
            audio.reproducir_audio(snd_rodar);
        }	
    }
	
    // Dejar de agacharse
    if ((accion == -1) and !control.boton_mantenido("boton_abajo") and (image_index >= 5)) {
        accion = 0;
    }

    // Dejar de rodar
    if ((accion == 2) and (abs(velocidad_horizontal) < 0.5) and tocando_suelo) {
        accion = 0;
    }

    // Dejar de rodar al ir por el suelo
    if ((accion == 2) and (velocidad_vertical > 0) and !tocando_suelo and colision_con_suelo()) {
        accion = 0;
    }
}