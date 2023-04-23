// Detectar entrada del usuario
if (permitir_uso_controles) {
	var tipo_controles = determinar_tipo_controles();
	if (tipo_controles == "teclado") {
	    for (var i = 0; i < array_length(lista_total_botones); i++) {
	        var boton_actual = lista_total_botones[i];
			determinar_estados_boton_teclado(boton_actual);
	    }
	} else {
		var id_gamepad = gamepad_is_connected(0) ? 0 : 4;
		configurar_gamepad(id_gamepad);
		
		var valor_vertical_stick = gamepad_axis_value(id_gamepad, gp_axislv);
	    var valor_horizontal_stick = gamepad_axis_value(id_gamepad, gp_axislh);
		
		determinar_estados_stick(boton_izquierda, (valor_horizontal_stick < 0));
		determinar_estados_stick(boton_abajo, (valor_vertical_stick > 0));
		determinar_estados_stick(boton_arriba, (valor_vertical_stick < 0));
		determinar_estados_stick(boton_derecha, (valor_horizontal_stick > 0));
		
		for (var i = 0; i < array_length(lista_botones_gamepad); i++) {
	        var boton_actual = lista_botones_gamepad[i];
			determinar_estados_boton_gamepad(id_gamepad, boton_actual);
	    }
	}
} else {
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