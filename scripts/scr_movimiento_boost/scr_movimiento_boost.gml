function manejo_movimiento_boost() {
	if (obj_controles.boton_boost.estado_pulsado) {
        usando_boost = true;
    } else if (obj_controles.boton_boost.estado_liberado) {
        usando_boost = false;
    }
	
    if (usando_boost and ((((accion == 0) or (accion == 11)) and tocando_suelo) or (accion == 1) or (accion == 16))) {
		manejo_creacion_efecto_boost();
    }

    if (instance_exists(obj_efecto_boost) and (cantidad_boost > 0)) {
        if (tocando_suelo) {
            aceleracion = 1;
        } else {
            aceleracion = 0.0625;
        }

        limite_velocidad_actual = limite_velocidad_horizontal;
    } else {
        aceleracion = 0.0625;
        limite_velocidad_actual = velocidad_horizontal_normal;

        if (accion != 2) {
            if (velocidad_horizontal > velocidad_horizontal_normal) {
                velocidad_horizontal = velocidad_horizontal_normal;
            } else if (velocidad_horizontal < -velocidad_horizontal_normal) {
                velocidad_horizontal = -velocidad_horizontal_normal;
            }
        } else {
            if (velocidad_horizontal > limite_velocidad_horizontal) {
                velocidad_horizontal = limite_velocidad_horizontal;
            } else if (velocidad_horizontal < -limite_velocidad_horizontal) {
                velocidad_horizontal = -limite_velocidad_horizontal;
            }
        }
    }

    if (instance_exists(obj_efecto_boost)) {
		if (velocidad_horizontal != 0) then direccion_horizontal = sign(velocidad_horizontal);
    }
}

function manejo_creacion_efecto_boost() {
	if (!instance_exists(obj_efecto_boost) and (cantidad_boost > 0)) {
		instance_create_depth(x, y, 0, obj_efecto_boost);
	}
}