function colision_circular_general(pos_x, pos_y, radio_circulo, requisitos_colision_riel = false, requisitos_caminar_sobre_agua = false){
	// Determinar colisiones con superficie
	var colision_normal_superficie = collision_circle(pos_x, pos_y, radio_circulo, obj_superficie, true, true);
	if (colision_normal_superficie) then return true;
	
	// Determinar colisiones con rieles
	if (requisitos_colision_riel) {
		var colision_normal_riel = collision_circle(pos_x, pos_y, radio_circulo, obj_riel, true, true);
		if (colision_normal_riel) then return true;
	}
	
	// Determinar colisiones con superficies, ya sea capa frontal o capa posterior
	if (capa_actual == "frontal") {
		// Determinar colisiones con superficie
        var colision_superficie_frontal = collision_circle(pos_x, pos_y, radio_circulo, obj_superficie_frontal, true, true);
		if (colision_superficie_frontal) then return true;
		
		// Determinar colisiones con rieles
		if (requisitos_colision_riel) {
			var colision_riel_frontal = collision_circle(pos_x, pos_y, radio_circulo, obj_riel_frontal, true, true);
			if (colision_riel_frontal) then return true;
		}
    } else {
		// Determinar colisiones con superficie
        var colision_superficie_posterior = collision_circle(pos_x, pos_y, radio_circulo, obj_superficie_posterior, true, true);
		if (colision_superficie_posterior) then return true;
		
		// Determinar colisiones con rieles
		if (requisitos_colision_riel) {
	        var colision_riel_posterior = collision_circle(pos_x, pos_y, radio_circulo, obj_riel_posterior, true, true);
			if (colision_riel_posterior) then return true;
		}
    }
	
	// Determinar si esta colisionando con la superficie del agua
	if (requisitos_caminar_sobre_agua) {
		var colision_superficie_agua = collision_circle(pos_x, pos_y, radio_circulo, obj_superficie_agua, true, true);
		if (colision_superficie_agua) then return true;
	}
	
	// En caso de que ningun caso se cumpla, se regresa falso
	return false;
}