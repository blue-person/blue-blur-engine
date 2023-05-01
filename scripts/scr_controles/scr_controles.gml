function determinar_parametros_controles() {
	var tecla_siendo_presionada = keyboard_check(vk_anykey);
	var usando_teclado = tecla_siendo_presionada or (!verificar_actividad_gamepad(0) and !verificar_actividad_gamepad(4));
	var usando_gamepad_xbox = gamepad_is_connected(0) and !tecla_siendo_presionada;
	var usando_gamepad_playstation = gamepad_is_connected(4) and !tecla_siendo_presionada;

	if (usando_teclado) then return [undefined, "teclado", spr_iconos_teclado];
	if (usando_gamepad_xbox) then return [0, "gamepad_xbox", spr_iconos_xbox]; 
	if (usando_gamepad_playstation) then return [4, "gamepad_playstation", spr_iconos_playstation];
}

function verificar_actividad_gamepad(puerto_dispositivo = undefined) {
	if (puerto_dispositivo == undefined) {
		var cantidad_disponible_gamepads = gamepad_get_device_count();
		for (var indice_puerto = 0; indice_puerto <= cantidad_disponible_gamepads; indice_puerto++) {
			if (gamepad_is_connected(indice_puerto)) {
				puerto_dispositivo = indice_puerto;
				break;
			}
		}
	}

    for (var indice_boton = gp_face1; indice_boton <= gp_padr; indice_boton++) {
        var botones_siendo_usados = gamepad_button_check(puerto_dispositivo, indice_boton);
        if (botones_siendo_usados) then return true;
    }
	
    for (var indice_stick = gp_axislh; indice_stick <= gp_axisrv; indice_stick++) {
        var valor_stick = gamepad_axis_value(puerto_dispositivo, indice_stick);
        if (abs(valor_stick) > 0) then return true;
    }
    
	return false;
}

function vibrar_gamepad(tiempo_requerido = 10) {
    var motor_vibracion = instance_create_depth(x, y, 0, obj_vibracion_gamepad);
    motor_vibracion.tiempo_vibracion = tiempo_requerido;
}