// Determinar a que direccion se debe dibujar el aura del boost
direccion_aura_boost = point_direction(x_inicial, y_inicial, x, y);

// Determinar que sprites se deben dibujar
dibujar_sprites_principal();
switch (global.personaje_actual) {
	case "Sonic":
		dibujar_sprites_sonic();
		break;
	case "Shadow":
		dibujar_sprites_shadow();
		break;
}

// Determinar tiempo en el aire
if (!tocando_suelo) {
	tiempo_aire++;
} else {
	tiempo_aire = 0;
}