if (instance_exists(obj_sonic)) {
	global.personaje_actual = "Shadow";
	instance_create_depth(obj_sonic.x, obj_sonic.y, PROFUNDIDAD_JUGADOR, obj_shadow);
	obj_camara.desactivar_enfoque();
	instance_destroy(obj_sonic);
	obj_camara.establecer_enfoque(obj_shadow);
} else {
	global.personaje_actual = "Sonic";
	instance_create_depth(obj_shadow.x, obj_shadow.y, PROFUNDIDAD_JUGADOR, obj_sonic);
	obj_camara.desactivar_enfoque();
	instance_destroy(obj_shadow);
	obj_camara.establecer_enfoque(obj_sonic);
}

control.inhabilitar_lectura(25);