function crear_particulas_jugador() {
	var particula_requerida = particula_boost;	
	var angulo_rastro = rodear_angulo(floor(direccion_aura_boost));
	part_type_direction(particula_requerida, angulo_rastro, angulo_rastro, 0, 0);
	
	if ((accion == 4) or (accion == 4.5) or (accion == 18) or (instance_exists(obj_efecto_boost))) {
	     part_particles_create(global.sistema_particulas, x, y, particula_requerida, 2);
	}
}

function gestionar_indice_sprites_jugador() {
	if (image_index > 998) {
	    image_index = 0;
	}

	if (fotograma >= 1) {
	    image_index++;
	    fotograma = 0;
	}
}

function gestionar_angulo_sprites_jugador() {
	// Manejar el angulo de la imagen
	if ((velocidad_horizontal == 0) and (accion <= 0) and tocando_suelo) {
	    image_angle = 0;
	    image_angle = angulo;
	} else if ((image_angle != 0) and (accion == 0) and !tocando_suelo) {
		var modulo_angulo = image_angle % 360;

		if (modulo_angulo < 180) {
			image_angle -= 7;
		} else if (modulo_angulo > 180) {
			image_angle += 7;
		} else if (modulo_angulo == 180) {
			if (direccion_horizontal == 1) {
				image_angle += 10;
			}
			else {
				image_angle -= 10;
			}
		}

		if (modulo_angulo < 10) {
			image_angle = 0;
		}
	} else if (tocando_suelo and collision_line(x, y, x, y + 20, obj_superficie_agua, true, true)) {
		// Si esta corriendo por encima del agua, el angulo sera 0
	    image_angle = 0;
	} else {
	    image_angle = angulo;
	}

	// Si se encuentra en un jump panel, el angulo sera el del jump panel
	if (accion == 25) {
	    image_angle = instance_nearest(x, y, obj_jump_panel).image_angle;
	}
    
	// Dar invencibilidad al ser herido
	if ((tiempo_invencibilidad > 0) and (tiempo_invencibilidad % 2 == 0) and (accion != 22)) {
		image_alpha = !image_alpha;
	} else {
	    image_alpha = 1;
	}
}