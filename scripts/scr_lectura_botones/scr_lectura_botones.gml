function verificar_boton_mantenido(nombre_boton) {
	if (global.permitir_uso_controles) then return input_check(nombre_boton);
	return false;
}

function verificar_boton_presionado(nombre_boton) {
	if (global.permitir_uso_controles) then return input_check_pressed(nombre_boton);
	return false;
}

function verificar_boton_liberado(nombre_boton) {
	if (global.permitir_uso_controles) then return input_check_released(nombre_boton);
	return false;
}