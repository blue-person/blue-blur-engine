function dibujar_sprites_principal() {
	// Manejar la imagen y fotograma actual
	if (indice_sprite > 998) {
	    indice_sprite = 0;
	}

	if (fotograma >= 1) {
	    ++indice_sprite;
	    fotograma = 0;
	}
	
	// Dibujar el rastro que deja el personaje al usar el boost
	var particula_requerida;
	switch (global.personaje_actual) {
		case "Sonic":
			particula_requerida = global.prt_rastro_azul;
			break;
		case "Shadow":
			particula_requerida = global.prt_rastro_naranja;
			break;
	}
	
	var angulo_rastro = rodear_angulo(floor(direccion_aura_boost));
	part_type_direction(particula_requerida, angulo_rastro, angulo_rastro, 0, 0);
	
	if ((accion == 4) or (accion == 4.5) or (accion == 18) or (instance_exists(obj_efecto_boost))) {
	     part_particles_create(global.sistema_particulas, x, y, particula_requerida, 2);
	}

	// Manejar el angulo de la imagen
	if ((velocidad_horizontal == 0) and (accion <= 0) and tocando_suelo) {
	    angulo_imagen = 0;
	} else if ((angulo_imagen != 0) and (accion == 0) and !tocando_suelo) {
		var modulo_angulo = angulo_imagen % 360;

		if (modulo_angulo < 180) {
			angulo_imagen -= 7;
		} else if (modulo_angulo > 180) {
			angulo_imagen += 7;
		} else if (modulo_angulo == 180) {
			if (direccion_horizontal == 1) {
				angulo_imagen += 10;
			}
			else {
				angulo_imagen -= 10;
			}
		}

		if (modulo_angulo < 10) {
			angulo_imagen = 0;
		}
	} else if (tocando_suelo and collision_line(x, y, x, y + 20, obj_superficie_agua, true, true)) {
		// Si esta corriendo por encima del agua, el angulo sera 0
	    angulo_imagen = 0;
	} else {
	    angulo_imagen = angulo;
	}

	// Si se encuentra en un jump panel, el angulo sera el del jump panel
	if (accion == 25) {
	    angulo_imagen = instance_nearest(x, y, obj_jumppanel).image_angle;
	}
    
	// Dar invencibilidad al ser herido
	if ((tiempo_invencibilidad > 0) and (tiempo_invencibilidad % 2 == 0) and (accion != 22)) {
		image_alpha = !image_alpha;
	} else {
	    image_alpha = 1;
	}
}