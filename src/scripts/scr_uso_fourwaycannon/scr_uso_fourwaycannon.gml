function gestion_uso_fourwaycannon() {
	if (accion == 21) {
        velocidad_vertical = 0;
        velocidad_horizontal = 0;

        if (control.boton_presionado("boton_salto")) {
            var permitir_disparo = false;
			var potencia_disparo = 10;
			
            if (control.boton_mantenido("boton_arriba")) {
                velocidad_vertical = -potencia_disparo;
                accion = 0;
                permitir_disparo = true;
            } else if (control.boton_mantenido("boton_derecha")) {
                alarma_0 = 30;
                gravedad = 0;
                velocidad_horizontal = potencia_disparo;
                accion = 6;
                permitir_disparo = true;
            } else if (control.boton_mantenido("boton_izquierda")) {
                alarma_0 = 30;
                gravedad = 0;
                velocidad_horizontal = -potencia_disparo;
                accion = 6;
                permitir_disparo = true;
            } else if (control.boton_mantenido("boton_abajo")) {
                velocidad_vertical = potencia_disparo;
                accion = 0;
                permitir_disparo = true;
            }

            if (permitir_disparo) {
                audio.reproducir_audio(snd_fourwaycannon_disparo);
                audio.reproducir_audio(snd_rainbowring);
            }
        }
    }
}