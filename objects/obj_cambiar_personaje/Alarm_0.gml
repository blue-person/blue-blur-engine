if (instance_exists(obj_sonic)) {
	global.personaje_actual = "Shadow";
	instance_create_depth(obj_sonic.x, obj_sonic.y, PROFUNDIDAD_JUGADOR, obj_shadow);
	instance_destroy(obj_sonic);
} else {
	global.personaje_actual = "Sonic";
	instance_create_depth(obj_shadow.x, obj_shadow.y, PROFUNDIDAD_JUGADOR, obj_sonic);
	instance_destroy(obj_shadow);
}

control.inhabilitar_lectura(25);