function crear_funcionalidad(profundidad, funcionalidad) {
	return instance_create_depth(OFFSCREEN, OFFSCREEN, profundidad, funcionalidad);
}

function crear_efecto(pos_x, pos_y, efecto) {
	return instance_create_depth(pos_x, pos_y, Profundidades.Efectos, efecto);
}

function crear_elemento_gui(pos_x, pos_y, efecto) {
	return instance_create_depth(pos_x, pos_y, Profundidades.Interfaz, efecto);
}

function crear_sistema_particulas_basico() {
	var sistema_particulas = part_system_create_layer(layer, true);
	part_system_depth(sistema_particulas, Profundidades.Particulas);
	return sistema_particulas;
}