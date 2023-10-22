function gestion_boost() {
	// Variables
	var efecto_boost = instance_find(obj_efecto_boost, 0);
	var energia_disponible = cantidad_boost > 0;
	
	// Determinar valor de la bandera
	if (energia_disponible and controles.boton_presionado("boton_boost")) {
		// Variables
		var accion_valida_suelo = tocando_suelo and ((accion == 0) or (accion == 8) or (accion == 11));
		var accion_valida_aire = (accion == 1) or (accion == 16);
		
		// Ajustar bandera
		if (accion_valida_suelo or accion_valida_aire) then permitir_uso_boost = true;
    } else if (not energia_disponible or controles.boton_liberado("boton_boost")) {
		// Ajustar bandera
		permitir_uso_boost = false;
    }
	
	if (permitir_uso_boost) {
		// Ajustar variables
		aceleracion = (tocando_suelo) ? 1 : 0.0625;
		limite_velocidad_actual = limite_velocidad_maxima;

		// Gestionar el efecto visual
		if (efecto_boost == noone) {
			// Crear efecto visual
			crear_efecto(x, y, obj_efecto_boost);
		} else {
			// Determinar direccion horizontal
			if (velocidad_horizontal > 0) {
				direccion_horizontal = 1;
			} else if (velocidad_horizontal < 0) {
				direccion_horizontal = -1;
			}
		}
	} else {
        aceleracion = 0.0625;
        limite_velocidad_actual = limite_velocidad_normal;
		
		// Eliminar efecto visual
		if (efecto_boost != noone) {
			instance_destroy(efecto_boost);
		}
		
		// Ajustar variables en base a la accion
        if (accion == 2) {
			velocidad_horizontal = clamp(velocidad_horizontal, -limite_velocidad_maxima, limite_velocidad_maxima);
        } else {
            velocidad_horizontal = clamp(velocidad_horizontal, -limite_velocidad_normal, limite_velocidad_normal);
        }
	}
}