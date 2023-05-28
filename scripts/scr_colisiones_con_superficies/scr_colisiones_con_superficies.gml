function colision_circular_agua(pos_x, pos_y, radio_circulo) {
	// Determinar si esta tocando la superficie del agua
	if (!self.sumergido_agua) {
		var angulo_requerido = (self.angulo <= 45) or (self.angulo >= 315);
		var velocidad_requerida = (abs(self.velocidad_horizontal) >= 8);
		if (angulo_requerido and velocidad_requerida) {
			var colision_superficie_agua = collision_circle(pos_x, pos_y, radio_circulo, obj_superficie_agua, true, true);
			if (colision_superficie_agua) then return true;
		}
	}
	
	// En caso de que ningun caso se cumpla, se regresa false
	return false;
}

function colision_lineal_agua(pos_x_1, pos_y_1, pos_x_2, pos_y_2) {
	// Determinar si esta tocando la superficie del agua
	if (!self.sumergido_agua) {
		var angulo_requerido = (self.angulo <= 45) or (self.angulo >= 315);
		var velocidad_requerida = (abs(self.velocidad_horizontal) >= 8);
		if (angulo_requerido and velocidad_requerida) {
			var colision_superficie_agua = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_superficie_agua, true, true);
			if (colision_superficie_agua) then return true;
		}
	}
	
	// En caso de que ningun caso se cumpla, se regresa false
	return false;
}

function colision_con_suelo() {
	// Declaracion de valores
	var pos_x = self.x + self.asin * self.mascara_colision;
	var pos_y = self.y + self.acos * self.mascara_colision;
	var radio_circulo = 7;
	var requisitos_colision_riel = self.permitir_grinding;

	// Determinar si se debe mostrar la colision
	if (global.permitir_modo_debug) then draw_circle(pos_x, pos_y, radio_circulo, true);
	
	// Determinar si esta tocando la superficie del agua
	var colision_superficie_agua = colision_circular_agua(pos_x, pos_y, radio_circulo);
	if (colision_superficie_agua) then return true;
	
	// Devolver resultado
	return colision_circular_general(pos_x, pos_y, radio_circulo, requisitos_colision_riel);
}

function colision_con_riel() {
	// Declaracion de valores
	var pos_x_1 = self.x;
	var pos_y_1 = self.y;
	var pos_x_2 = self.x + self.asin * self.mascara_colision;
	var pos_y_2 = self.y + self.acos * self.mascara_colision;
	
	// Determinar si se debe mostrar la colision
	if (global.permitir_modo_debug) then draw_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2);
	
	// Determinar colisiones con obj_superficie
	var colision_normal_riel = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_riel, true, true);
	if (colision_normal_riel) then return true;
		
	// Determinar colisiones con superficies, ya sea capa frontal o capa posterior
	if (self.capa_actual == "frontal") {
        var colision_riel_frontal = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_riel_frontal, true, true);
		if (colision_riel_frontal) then return true;
    } else {
        var colision_riel_posterior = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_riel_posterior, true, true);
		if (colision_riel_posterior) then return true;
    }

	// En caso de que ningun caso se cumpla, se regresa falso
	return false;
}