function colision_circular_general(pos_x, pos_y, radio_circulo, requisitos_colision_riel){
	// Determinar colisiones con superficie
	var colision_normal_superficie = collision_circle(pos_x, pos_y, radio_circulo, obj_superficie, true, true);
	if (colision_normal_superficie) then return true;
	
	// Determinar colisiones con rieles
	var colision_normal_riel = collision_circle(pos_x, pos_y, radio_circulo, obj_riel, true, true);
	if (requisitos_colision_riel and colision_normal_riel) then return true;
	
	// Determinar colisiones con superficies, ya sea capa frontal o capa posterior
	if (self.capa_actual == "frontal") {
		// Determinar colisiones con superficie
        var colision_superficie_frontal = collision_circle(pos_x, pos_y, radio_circulo, obj_superficie_frontal, true, true);
		if (colision_superficie_frontal) then return true;
		
		// Determinar colisiones con rieles
        var colision_riel_frontal = collision_circle(pos_x, pos_y, radio_circulo, obj_riel_frontal, true, true);
		if (requisitos_colision_riel and colision_riel_frontal) then return true;
    } else {
		// Determinar colisiones con superficie
        var colision_superficie_posterior = collision_circle(pos_x, pos_y, radio_circulo, obj_superficie_posterior, true, true);
		if (colision_superficie_posterior) then return true;
		
		// Determinar colisiones con rieles
        var colision_riel_posterior = collision_circle(pos_x, pos_y, radio_circulo, obj_riel_posterior, true, true);
		if (requisitos_colision_riel and colision_riel_posterior) then return true;
    }
	
	// En caso de que ningun caso se cumpla, se regresa falso
	return false;
}