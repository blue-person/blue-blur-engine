if (permitir_cambiar_personaje) {
	if (global.personaje_actual == obj_sonic) {
		global.personaje_actual = obj_shadow;
		instance_create_depth(obj_sonic.x, obj_sonic.y, Profundidades.Jugador, global.personaje_actual);
		jugador.rings = obj_sonic.rings;
		jugador.accion = obj_sonic.accion;
		jugador.direccion_horizontal = obj_sonic.direccion_horizontal;
		jugador.velocidad_horizontal = obj_sonic.velocidad_horizontal;
		jugador.velocidad_vertical = obj_sonic.velocidad_vertical;
		obj_camara.desactivar_enfoque();
		instance_destroy(obj_sonic);
		obj_camara.establecer_enfoque(jugador);
	} else {
		global.personaje_actual = obj_sonic;
		instance_create_depth(obj_shadow.x, obj_shadow.y, Profundidades.Jugador, global.personaje_actual);
		jugador.rings = obj_shadow.rings;
		jugador.accion = obj_shadow.accion;
		jugador.direccion_horizontal = obj_shadow.direccion_horizontal;
		jugador.velocidad_horizontal = obj_shadow.velocidad_horizontal;
		jugador.velocidad_vertical = obj_shadow.velocidad_vertical;
		obj_camara.desactivar_enfoque();
		instance_destroy(obj_shadow);
		obj_camara.establecer_enfoque(jugador);
	}
}