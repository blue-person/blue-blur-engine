function gestion_boost() {
	// Variables
	var boton_presionado = controles.boton_presionado("boton_boost");
	var boton_liberado = controles.boton_liberado("boton_boost");
	var energia_disponible = cantidad_boost > 0;
	var efecto_boost = instance_find(obj_efecto_boost, 0);
	
	// Determinar valor de la bandera
	if (boton_presionado and energia_disponible) {
		var accion_valida_suelo = tocando_suelo and ((accion == 0) or (accion == 11));
		var accion_valida_aire = (accion == 1) or (accion == 16);
		
		if (accion_valida_suelo or accion_valida_aire) {
			permitir_uso_boost = true;
		}
    } else if (boton_liberado or not energia_disponible) {
        permitir_uso_boost = false;
    }
	
	// Gestionar comportamiento
	if (permitir_uso_boost) {
		// Ajustar parametros
        aceleracion = (tocando_suelo) ? 1 : 0.0625;
        limite_velocidad_actual = limite_velocidad_maxima;
		
		// Crear efecto visual
		if (efecto_boost == noone) {
			instance_create_depth(x, y, Profundidades.Efectos, obj_efecto_boost);
		}
    } else {
		// Ajustar parametros
        aceleracion = 0.0625;
        limite_velocidad_actual = limite_velocidad_normal;
		
		// Ajustar parametros en base a la accion
        if (accion == 2) {
			velocidad_horizontal = clamp(velocidad_horizontal, -limite_velocidad_maxima, limite_velocidad_maxima);
        } else {
            velocidad_horizontal = clamp(velocidad_horizontal, -limite_velocidad_normal, limite_velocidad_normal);
        }
		
		// Eliminar efecto visual
		if (efecto_boost != noone) {
			instance_destroy(efecto_boost);
		}
    }
}