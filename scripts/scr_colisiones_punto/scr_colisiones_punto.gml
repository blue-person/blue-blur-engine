function colision_punto(pos_x, pos_y){
	// Declarar variables
	var requisitos_colision_riel = self.permitir_grinding;
	
	// Determinar colisiones con superficie
	var colision_normal_superficie = collision_point(pos_x, pos_y, obj_superficie, true, true);
	if (colision_normal_superficie) then return true;
	
	// Determinar colisiones con rieles
	var colision_normal_riel = collision_point(pos_x, pos_y, obj_riel, true, true);
	if (requisitos_colision_riel and colision_normal_riel) then return true;
	
	// Determinar colisiones con superficies, ya sea capa frontal o capa posterior
	if (self.capa_actual == "frontal") {
		// Determinar colisiones con superficie
        var colision_superficie_frontal = collision_point(pos_x, pos_y, obj_superficie_frontal, true, true);
		if (colision_superficie_frontal) then return true;
		
		// Determinar colisiones con rieles
        var colision_riel_frontal = collision_point(pos_x, pos_y, obj_riel_frontal, true, true);
		if (requisitos_colision_riel and colision_riel_frontal) then return true;
    } else {
		// Determinar colisiones con superficie
        var colision_superficie_posterior = collision_point(pos_x, pos_y, obj_superficie_posterior, true, true);
		if (colision_superficie_posterior) then return true;
		
		// Determinar colisiones con rieles
        var colision_riel_posterior = collision_point(pos_x, pos_y, obj_riel_posterior, true, true);
		if (requisitos_colision_riel and colision_riel_posterior) then return true;
    }
	
	// Determinar si puede caminar en el agua
	if (!self.sumergido_agua) {
		var angulo_requerido = (self.angulo <= 45) or (self.angulo >= 315);
		var velocidad_requerida = (abs(self.velocidad_horizontal) >= 8);
		if (angulo_requerido and velocidad_requerida) {
			var colision_superficie_agua = collision_point(pos_x, pos_y, obj_superficie_agua, true, true);
			if (colision_superficie_agua) then return true;
		}
	}
	
	// En caso de que ningun caso se cumpla, se regresa falso
	return false;
}