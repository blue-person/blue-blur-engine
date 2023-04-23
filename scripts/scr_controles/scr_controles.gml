function determinar_tipo_controles() {
	// Se realizan comprobaciones para determianr el tipo de control
	if (keyboard_check(vk_anykey)) then return "teclado";
	if (gamepad_is_connected(0)) then return "gamepad_xbox"; 
	if (gamepad_is_connected(4)) then return "gamepad_playstation";
	
	// Si no se cumplio ninguna condicion anterior, entonces se asume que es teclado
	return "teclado";
}

function determinar_sprites_controles() {
	var tipo_controles = determinar_tipo_controles();
	switch (tipo_controles) {
		case "teclado":
			return spr_controles_teclado;
			break;
		case "gamepad_xbox":
			return spr_controles_xbox;
			break;
		case "gamepad_playstation":
			return spr_controles_playstation;
			break;
	}
}

function configurar_gamepad(id_gamepad, sensibilidad_gamepad = SENSIBILIDAD_GAMEPAD) {
	if (gamepad_get_axis_deadzone(id_gamepad) != sensibilidad_gamepad) {
		gamepad_set_axis_deadzone(id_gamepad, sensibilidad_gamepad);
	}
}

function vibrar_gamepad(tiempo_requerido) {
	var motor_vibracion = instance_create_depth(x, y, 0, obj_vibracion_gamepad);
	with (motor_vibracion) {
		permitir_vibracion = true;
		tiempo_vibracion = tiempo_requerido;
	}
}