// Variables
permitir_lectura = true;

// Metodos
habilitar_lectura = function() {
	self.permitir_lectura = true;
}

inhabilitar_lectura = function(duracion = noone) {
	self.permitir_lectura = false;
	if (duracion != noone) then alarm[0] = duracion;
}

obtener_estado_lectura = function() {
	return self.permitir_lectura;
}

obtener_tipo_controles = function() {
	if (input_source_using(INPUT_GAMEPAD)) {
		return "gamepad";
	} else {
		return "teclado";
	}
}

obtener_icono_boton = function(nombre_boton) {
	var informacion_boton = input_binding_get(nombre_boton)
	return input_binding_get_icon(informacion_boton);
}

boton_mantenido = function(nombre_boton) {
	var lectura_permitida = self.obtener_estado_lectura();
	if (lectura_permitida) then return input_check(nombre_boton);
	return false;
}

boton_presionado = function(nombre_boton) {
	var lectura_permitida = self.obtener_estado_lectura();
	if (lectura_permitida) then return input_check_pressed(nombre_boton);
	return false;
}

boton_liberado = function(nombre_boton) {
	var lectura_permitida = self.obtener_estado_lectura();
	if (lectura_permitida) then return input_check_released(nombre_boton);
	return false;
}