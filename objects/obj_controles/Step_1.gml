if (permitir_uso_controles) {
	// Detectar parametros de la entrada del usuario
	var parametros_controles = determinar_parametros_controles();
	puerto_dispositivo = parametros_controles[0];
	tipo_entrada = parametros_controles[1];
	tipo_iconos = parametros_controles[2];
	
	// Determinar el estado de los botones
	if (tipo_entrada == "teclado") {
	    for (var i = 0; i < array_length(lista_total_botones); i++) {
	        var boton_actual = lista_total_botones[i];
			determinar_estados_boton_teclado(boton_actual);
	    }
	} else {
		gamepad_set_axis_deadzone(puerto_dispositivo, global.porcentaje_zona_muerta_sticks);
		
	    var valor_horizontal_stick = gamepad_axis_value(puerto_dispositivo, gp_axislh);
		var valor_vertical_stick = gamepad_axis_value(puerto_dispositivo, gp_axislv);
		
		determinar_estados_stick(boton_izquierda, (valor_horizontal_stick < 0));
		determinar_estados_stick(boton_abajo, (valor_vertical_stick > 0));
		determinar_estados_stick(boton_arriba, (valor_vertical_stick < 0));
		determinar_estados_stick(boton_derecha, (valor_horizontal_stick > 0));
		
		for (var i = 0; i < array_length(lista_botones_gamepad); i++) {
	        var boton_actual = lista_botones_gamepad[i];
			determinar_estados_boton_gamepad(puerto_dispositivo, boton_actual);
	    }
	}
} else {
	// Invalidar el estado de los botones
	for (var i = 0; i < array_length(lista_total_botones); i++) {
		var boton_actual = lista_total_botones[i];
		invalidar_estados_boton(boton_actual, true);
	}
	
	permitir_uso_controles = true;
}

// Bloquear entrada doble
var doble_movimiento_vertical = (boton_abajo.estado_retenido and boton_arriba.estado_retenido) or (boton_abajo.estado_pulsado and boton_arriba.estado_pulsado);
var doble_movimiento_horizontal = (boton_izquierda.estado_retenido and boton_derecha.estado_retenido) or (boton_izquierda.estado_pulsado and boton_derecha.estado_pulsado);

if (doble_movimiento_vertical or doble_movimiento_horizontal) then permitir_uso_controles = false;