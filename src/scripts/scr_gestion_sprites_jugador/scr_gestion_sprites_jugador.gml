function crear_particulas_jugador() {
	if (permitir_uso_boost or (accion == 4) or (accion == 4.5) or (accion == 18)) {
		// Ajustar la direccion de las particulas
		var direccion_jugador = floor(point_direction(x_inicial, y_inicial, x, y));
		var angulo_rastro = normalizar_angulo(direccion_jugador);
		part_type_direction(particulas_rastro, angulo_rastro, angulo_rastro, 0, 0);
		
		// Crear las particulas
	    part_particles_create(particulas, x, y, particulas_rastro, 2);
	}
}

function gestion_indice_sprites_jugador() {
	if (image_index > 998) {
	    image_index = 0;
	}

	if (fotograma >= 1) {
	    image_index++;
	    fotograma = 0;
	}
}

function gestion_angulo_sprites_jugador() {
	// Manejar el angulo de la imagen
	if ((velocidad_horizontal == 0) and (accion <= 0) and tocando_suelo) {
	    image_angle = angulo;
	} else if ((image_angle != 0) and (accion == 0) and not tocando_suelo) {
		var modulo_angulo = image_angle % 360;
		if (modulo_angulo < 180) {
			image_angle -= 7;
		} else if (modulo_angulo > 180) {
			image_angle += 7;
		} else if (modulo_angulo == 180) {
			if (direccion_horizontal == 1) {
				image_angle += 10;
			} else {
				image_angle -= 10;
			}
		}
		
		if ((image_angle % 360) < 10) {
			image_angle = 0;
		}
	} else if (tocando_suelo and collision_line(x, y, x, y + 20, obj_superficie_agua, true, true)) {
		// Si esta corriendo por encima del agua, el angulo sera 0
	    image_angle = 0;
	} else {
	    image_angle = angulo;
	}
}

function ajustes_comunes_sprites_jugador() {
	// Dar el efecto transparente al ser herido
	if ((tiempo_invencibilidad > 0) and ((tiempo_invencibilidad % 2) == 0) and (accion != 22)) {
		image_alpha = not image_alpha;
	} else {
	    image_alpha = 1;
	}

	// Si se encuentra en un jump panel, el angulo sera el del jump panel
	if (accion == 25) {
		var panel_mas_cercano = instance_nearest(x, y, obj_jump_panel);
	    image_angle = panel_mas_cercano.image_angle;
	}

	// Ajustar la escala de la imagen en base a la direccion horizontal
	image_xscale = direccion_horizontal;
}