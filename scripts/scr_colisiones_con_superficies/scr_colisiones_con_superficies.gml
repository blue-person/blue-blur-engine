function colision_lineal_superficie(superficie_normal, superficie_posterior, superficie_frontal) {
	// Determinar colision con superficie
	var colision_normal = colision_lineal_simple(superficie_normal);
	if (colision_normal) then return true;

	// Determinar colisiones con superficies, ya sea capa frontal o capa posterior
	if (self.capa_actual == "frontal") {
        var colision_capa_frontal = colision_lineal_simple(superficie_frontal);
		if (colision_capa_frontal) then return true;
    } else {
        var colision_capa_posterior = colision_lineal_simple(superficie_posterior);
		if (colision_capa_posterior) then return true;
    }
	
	// Retornar comprobacion
	return false;
}

function colision_con_suelo() {
	// Declaracion de valores
	var valor_auxiliar_posicion = 2.5;
	var pos_x = self.x + self.asin * (self.mascara_colision * valor_auxiliar_posicion);
	var pos_y = self.y + self.acos * (self.mascara_colision * valor_auxiliar_posicion);
	var radio_circulo = 9;
	
	// Declaracion de requisitos de colision
	var requisitos_colision_riel = self.permitir_grinding;
	var requisitos_caminar_sobre_agua = (self.caminar_sobre_agua) and (not self.sumergido_agua);
	
	// Determinar si se debe mostrar la colision
	if (global.permitir_modo_debug) then draw_circle(pos_x, pos_y, radio_circulo, true);
	
	// Retornar comprobacion
	return colision_circular_general(pos_x, pos_y, radio_circulo, requisitos_colision_riel, requisitos_caminar_sobre_agua);
}

function colision_con_riel() {
	// Declaracion de valores
	var valor_auxiliar_posicion = 1.25;
	var pos_x_1 = self.x;
	var pos_y_1 = self.y;
	var pos_x_2 = self.x + self.asin * (self.mascara_colision * valor_auxiliar_posicion);
	var pos_y_2 = self.y + self.acos * (self.mascara_colision * valor_auxiliar_posicion);

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