// Cambiar la animacion de la presentacion principal
obj_presentacion_nivel.animacion_actual = 3;

// Crear HUD y dar movimiento inicial al jugador
with (obj_jugador) {
	instance_create_depth(0, 0, -100, obj_hud_normal);
	tocando_suelo = true;
	permitir_movimiento = true;
	
    if (!reaparicion.obtener_permiso_reaparicion()) {
		velocidad_horizontal = 9;
        direccion_horizontal = 1;
    }
}