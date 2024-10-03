function gestion_uso_ventilador() {
	if ((accion != 26) and (accion != 37) and place_meeting(x, y, obj_ventilador_gigante)) {
        accion = 37;
        image_index = 0;
    }

    if (accion == 37) {
        if (tocando_suelo) then accion = 0;

        if (place_meeting(x, y, obj_ventilador_gigante)) {
            if (velocidad_vertical > -2) {
                velocidad_vertical += -2;
            } else {
                velocidad_vertical = -2;
            }
        }

        if (controles.boton_mantenido("boton_derecha")) {
            if (velocidad_horizontal > 0) {
                if (velocidad_horizontal < limite_velocidad_actual) {
                    velocidad_horizontal += aceleracion;
                }
            } else {
                velocidad_horizontal += desaceleracion;
            }
        }

        if (controles.boton_mantenido("boton_izquierda")) {
            if (velocidad_horizontal < 0) {
                if (velocidad_horizontal > -limite_velocidad_actual) {
                    velocidad_horizontal -= aceleracion;
                }
            } else {
                velocidad_horizontal -= desaceleracion;
            }
        }

        if (!controles.boton_mantenido("boton_derecha") and !controles.boton_mantenido("boton_izquierda")) {
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

        if (controles.boton_mantenido("boton_derecha") and controles.boton_mantenido("boton_izquierda")) {
            if (abs(velocidad_horizontal) <= desaceleracion) then velocidad_horizontal = 0;
        }

        if (controles.boton_mantenido("boton_izquierda") and !controles.boton_mantenido("boton_derecha")) {
            direccion_horizontal = -1;
        } else if (controles.boton_mantenido("boton_derecha") and !controles.boton_mantenido("boton_izquierda")) {
            direccion_horizontal = 1;
        }
    }
}