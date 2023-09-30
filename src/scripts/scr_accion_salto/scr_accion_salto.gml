function gestion_accion_salto() {
	if (control.boton_presionado("boton_salto") and tocando_suelo and ((accion == -4) or (accion == 0) or (accion == 2) or (accion == 9) or (accion == 11))) {
        accion = 1;
		tocando_suelo = false;
        velocidad_vertical = acos * altura_salto + (-asin * velocidad_horizontal) / 1.5;
        velocidad_horizontal = velocidad_horizontal * acos + asin * altura_salto;

        angulo = 0;
        acos = 1;
        asin = 0;
		
		audio.reproducir_audio(snd_salto);
        if (!instance_exists(obj_efecto_salto)) {
            instance_create_depth(x, y, 0, obj_efecto_salto);
        }
    }

    // Manejo de la altura minima del salto
    if (control.boton_liberado("boton_salto") and (velocidad_vertical < altura_salto_minima) and (accion == 1)) {
        velocidad_vertical = altura_salto_minima;
    }

    if ((accion == 1) and !tocando_suelo) {
        if (control.boton_mantenido("boton_derecha")) {
            if (velocidad_horizontal >= 0) {
                if (velocidad_horizontal < limite_velocidad_actual) {
                    velocidad_horizontal += aceleracion / 2;
                }
            } else {
                velocidad_horizontal += desaceleracion / 2;
            }
        }

        if (control.boton_mantenido("boton_izquierda")) {
            if (velocidad_horizontal <= 0) {
                if (velocidad_horizontal > -limite_velocidad_actual) {
                    velocidad_horizontal -= aceleracion / 2;
                } else {
                    velocidad_horizontal -= desaceleracion / 2;
                }
            }

            if (!control.boton_mantenido("boton_derecha") and !control.boton_mantenido("boton_izquierda")) {
                if (velocidad_horizontal > 0) {
                    velocidad_horizontal -= friccion;
                }

                if (velocidad_horizontal < 0) {
                    velocidad_horizontal += friccion;
                }

                if ((velocidad_horizontal <= friccion) and (velocidad_horizontal >= -friccion)) {
                    velocidad_horizontal = 0;
                }
            }
        }
    }
}