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

establecer_punto_control = function(pos_x, pos_y, tiempo_ha_registrar) {
    permitir_reaparicion = true;
	pos_reaparicion_x = pos_x;
	pos_reaparicion_y = pos_y;
    copiar_lista(tiempo_ha_registrar, tiempo_registrado);
}

reestablecer_datos = function() {
	permitir_reaparicion = false;
	pos_reaparicion_x = 0;
	pos_reaparicion_y = 0;
	tiempo_registrado = [0, 0, 0];
}