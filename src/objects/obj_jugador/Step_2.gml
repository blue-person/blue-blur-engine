// Controlar la cantidad de boost
if (room == rm_hub_world) {
	cantidad_boost = 100;
} else {
	cantidad_boost = clamp(cantidad_boost, 0, 100);
}

// Gestionar la direccion se debe dibujar el aura del boost
if (permitir_uso_boost) {
	direccion_aura_boost = point_direction(x_inicial, y_inicial, x, y);
}