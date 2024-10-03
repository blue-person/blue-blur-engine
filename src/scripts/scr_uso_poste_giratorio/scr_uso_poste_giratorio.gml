function gestion_uso_poste_giratorio() {
	if (accion == 29) {
        if (place_meeting(x, y, obj_poste_giratorio)) {
            velocidad_horizontal = 0;
            velocidad_vertical = 0;

            x = instance_nearest(x, y, obj_poste_giratorio).x;
            y += 2;

            if (controles.boton_presionado("boton_salto")) {
                accion = 1;

                if (controles.boton_mantenido("boton_derecha")) {
                    velocidad_horizontal = 7;
                } else if (controles.boton_mantenido("boton_izquierda")) {
                    velocidad_horizontal = -7;
                } else {
                    velocidad_horizontal = direccion_horizontal * 7;
                }
                audio.reproducir_audio(snd_salto);
            }
        } else {
            accion = 0;
        }
    }
}