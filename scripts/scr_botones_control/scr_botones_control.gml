function Boton(_indice_sprite, _accionador_teclado, _accionador_gamepad = undefined) constructor {
	indice_sprite = _indice_sprite;
	accionador_teclado = _accionador_teclado;
	accionador_gamepad = _accionador_gamepad;
	estado_pulsado = false;
	estado_retenido = false;
	estado_liberado = false;
}

function determinar_estados_boton_teclado(boton) {
	boton.estado_pulsado = keyboard_check_pressed(boton.accionador_teclado);
	boton.estado_retenido = keyboard_check(boton.accionador_teclado);
	boton.estado_liberado = keyboard_check_released(boton.accionador_teclado);
}

function determinar_estados_boton_gamepad(puerto_dispositivo, boton) {
	boton.estado_pulsado = gamepad_button_check_pressed(puerto_dispositivo, boton.accionador_gamepad);
	boton.estado_retenido = gamepad_button_check(puerto_dispositivo, boton.accionador_gamepad);
	boton.estado_liberado = gamepad_button_check_released(puerto_dispositivo, boton.accionador_gamepad);
}

function determinar_estados_stick(boton, comprobacion_valor_analogo) {
	var tiempo_espera = room_speed / 30;
	var resetear_boton = time_source_create(time_source_game, tiempo_espera, time_source_units_frames, invalidar_estados_boton, [boton]);

	if (!boton.estado_retenido and comprobacion_valor_analogo) {
		boton.estado_pulsado = true;
		boton.estado_retenido = true;
		boton.estado_liberado = false;
		time_source_start(resetear_boton);
	} else if (boton.estado_retenido and !comprobacion_valor_analogo) {
		boton.estado_pulsado = false;
		boton.estado_retenido = false;
		boton.estado_liberado = true;
		time_source_start(resetear_boton);
	} else {
		time_source_destroy(resetear_boton);
	}
}

function invalidar_estados_boton(boton, invalidar_estado_retenido = false) {
	boton.estado_pulsado = false;
	boton.estado_liberado = false;
	if invalidar_estado_retenido then boton.estado_retenido = false;
}