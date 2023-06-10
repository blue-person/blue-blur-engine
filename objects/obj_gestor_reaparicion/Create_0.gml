// Variables
permitir_reaparicion = false;
pos_reaparicion_x = 0;
pos_reaparicion_y = 0;
tiempo_registrado = [0, 0, 0];

// Metodos
obtener_permiso_reaparicion = function() {
	return permitir_reaparicion;
}

obtener_pos_x = function() {
	return pos_reaparicion_x;
}

obtener_pos_y = function() {
	return pos_reaparicion_y;
}

obtener_tiempo_registrado = function() {
	return tiempo_registrado;
}

habilitar_reaparicion = function() {
	permitir_reaparicion = true;
}

inhabilitar_reaparicion = function() {
	permitir_reaparicion = false;
}

registrar_posicion = function(pos_x, pos_y) {
	pos_reaparicion_x = pos_x;
	pos_reaparicion_y = pos_y;
}

registrar_tiempo = function(tiempo) {
	tiempo_registrado = tiempo;
}

establecer_punto_control = function(pos_x, pos_y, tiempo) {
    self.habilitar_reaparicion();
    self.registrar_posicion(pos_x, pos_y);
	self.registrar_tiempo(tiempo);
}

reestablecer_datos = function() {
	self.inhabilitar_reaparicion();
	self.registrar_posicion(0, 0);
	self.registrar_tiempo([0, 0, 0]);
}