// Gestionar la direccion se debe dibujar el aura del boost
if (usando_boost) {
	direccion_aura_boost = point_direction(x_inicial, y_inicial, x, y);
}

// Gestionar el tiempo en el aire
if (not tocando_suelo) {
	tiempo_aire++;
} else {
	tiempo_aire = 0;
}

// Modificar parametros de los sprites
dibujar_sprites_principal();