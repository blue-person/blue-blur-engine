function gestion_uso_fourwaycannon() {
	if (accion == 21) {
        // Ajustar la velocidad de movimiento
        velocidad_vertical = 0;
        velocidad_horizontal = 0;
		permitir_pisoton = true;

        // Determinar si se ha pulsado el boton de disparo
        if (controles.boton_presionado("boton_salto")) {
            var permitir_disparo = false;
			var potencia_disparo = 10;
			
            // Determinar la direccion del disparo
            if (controles.boton_mantenido("boton_arriba")) {
                permitir_disparo = true;
                alarm[1] = 1;
                velocidad_vertical = -potencia_disparo;
            } else if (controles.boton_mantenido("boton_abajo")) {
                permitir_disparo = true;
                alarm[1] = 1;
                velocidad_vertical = potencia_disparo;
            } else if (controles.boton_mantenido("boton_derecha")) {
                permitir_disparo = true;
                alarm[0] = 30;
                accion = 6;
                gravedad = 0;
                direccion_horizontal = 1;
                velocidad_horizontal = potencia_disparo;
            } else if (controles.boton_mantenido("boton_izquierda")) {
				permitir_disparo = true;
                alarm[0] = 30;
                accion = 6;
                gravedad = 0;
                direccion_horizontal = -1;
                velocidad_horizontal = -potencia_disparo;
            }

            // Disparar
            if (permitir_disparo) {
                audio.reproducir_audio(snd_fourwaycannon_disparo);
                audio.reproducir_audio(snd_rainbowring);
            }
        }

    // Salir del evento
    exit;
    }
}