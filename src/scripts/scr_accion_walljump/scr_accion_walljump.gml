function gestion_accion_walljump() {
    if (accion == 19) {
		// Mantenerse en la pared antes de saltar
        velocidad_vertical = 0;
        velocidad_horizontal = 0;
		
		// Impulsarse de la pared
        if (controles.boton_presionado("boton_salto")) {
			// Reproducir efecto de sonido
            audio.reproducir_audio(snd_walljump);
			
			// Anular alarma
            alarm[2] = -1;
			
			// Modificar variables
            direccion_horizontal = -direccion_horizontal;
            accion = 20;
            velocidad_vertical = -7;
            velocidad_horizontal = direccion_horizontal * 9;
        }
    } else if (accion == 20) {
		// Anular accion
        if (tocando_suelo or (velocidad_vertical >= 0)) {
            accion = 0;
        }
    }
}