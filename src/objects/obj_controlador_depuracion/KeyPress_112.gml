if (permitir_depuracion) {
	transiciones.iniciar_efecto_basico("morado", 0.05);
	
	if (global.personaje_actual == obj_sonic) {
		global.personaje_actual = obj_shadow;
		instance_create_depth(obj_sonic.x, obj_sonic.y, PROFUNDIDAD_JUGADOR, global.personaje_actual);
		jugador.rings = obj_sonic.rings;
		obj_camara.desactivar_enfoque();
		instance_destroy(obj_sonic);
		obj_camara.establecer_enfoque(jugador);
	} else {
		global.personaje_actual = obj_sonic;
		instance_create_depth(obj_shadow.x, obj_shadow.y, PROFUNDIDAD_JUGADOR, global.personaje_actual);
		jugador.rings = obj_shadow.rings;
		obj_camara.desactivar_enfoque();
		instance_destroy(obj_shadow);
		obj_camara.establecer_enfoque(jugador);
	}
}