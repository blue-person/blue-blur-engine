function colision_lineal_simple(superficie) {
	// Declaracion de valores
	var pos_x_1 = self.x;
	var pos_y_1 = self.y;
	var pos_x_2 = self.x + (self.asin * self.mascara_colision)
	var pos_y_2 = self.y + (self.acos * self.mascara_colision)
	
	// Retornar comprobacion
	return collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, superficie, true, true);
}

function colision_lineal_general(pos_x_1, pos_y_1, pos_x_2, pos_y_2, requisitos_colision_riel = false, requisitos_caminar_sobre_agua = false) {
	// Declaracion de valores
	var valor_auxiliar_ancho = lengthdir_y(8, self.angulo);
	var valor_auxiliar_altura = lengthdir_y(8, self.angulo - 90);
	
	// Determinar colisiones con superficie
	var colision_normal_superficie = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_superficie, true, true);
	if (colision_normal_superficie) then return true;
	
	// Determinar colisiones con rieles
	if (requisitos_colision_riel) {
		var colision_normal_riel = collision_line(pos_x_1 + valor_auxiliar_ancho, pos_y_1 - valor_auxiliar_altura, pos_x_2, pos_y_2, obj_riel, true, true);
		if (colision_normal_riel) then return true;
	}
	
	// Determinar colisiones con superficies, ya sea capa frontal o capa posterior
	if (self.capa_actual == "frontal") {
		// Determinar colisiones con superficie
        var colision_superficie_frontal = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_superficie_frontal, true, true);
		if (colision_superficie_frontal) then return true;
		
		// Determinar colisiones con rieles
		if (requisitos_colision_riel) {
			var colision_riel_frontal = collision_line(pos_x_1 + valor_auxiliar_ancho, pos_y_1 - valor_auxiliar_altura, pos_x_2, pos_y_2, obj_riel_frontal, true, true);
			if (colision_riel_frontal) then return true;
		}
    } else {
		// Determinar colisiones con superficie
        var colision_superficie_posterior = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_superficie_posterior, true, true);
		if (colision_superficie_posterior) then return true;
		
		// Determinar colisiones con rieles
		if (requisitos_colision_riel) {
			var colision_riel_posterior = collision_line(pos_x_1 + valor_auxiliar_ancho, pos_y_1 - valor_auxiliar_altura, pos_x_2, pos_y_2, obj_riel_posterior, true, true);
			if (colision_riel_posterior) then return true;
		}
    }
	
	// Determinar si esta colisionando con la superficie del agua
	if (requisitos_caminar_sobre_agua) {
		var colision_superficie_agua = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_superficie_agua, true, true);
		if (colision_superficie_agua) then return true;
	}
	
	// En caso de que ningun caso se cumpla, se regresa falso
	return false;
}