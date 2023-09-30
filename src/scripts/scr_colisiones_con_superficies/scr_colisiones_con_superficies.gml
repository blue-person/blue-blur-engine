function colision_lineal_superficie(superficie_normal, superficie_posterior, superficie_frontal, entidad = self) {
	// Determinar colision con superficie
	var colision_normal = colision_lineal_simple(superficie_normal);
	if (colision_normal) then return true;

	// Determinar colisiones con superficies, ya sea capa frontal o capa posterior
	if (entidad.capa_actual == "frontal") {
        var colision_capa_frontal = colision_lineal_simple(superficie_frontal);
		if (colision_capa_frontal) then return true;
    } else {
        var colision_capa_posterior = colision_lineal_simple(superficie_posterior);
		if (colision_capa_posterior) then return true;
    }
	
	// Retornar comprobacion
	return false;
}

function colision_con_suelo(entidad = self) {
	// Declaracion de valores
	var pos_x = entidad.x + entidad.asin * entidad.mascara_colision;
	var pos_y = entidad.y + entidad.acos * entidad.mascara_colision;
	var radio_circulo = 9;
	
	// Declaracion de requisitos de colision
	var requisitos_colision_riel = entidad.permitir_grinding;
	var requisitos_caminar_sobre_agua = (entidad.caminar_sobre_agua) and (not entidad.sumergido_agua);
	
	// Determinar si se debe mostrar la colision
	if (debug.permitir_depuracion) then draw_circle(pos_x, pos_y, radio_circulo, true);
	
	// Retornar comprobacion
	return colision_circular_general(entidad, pos_x, pos_y, radio_circulo, requisitos_colision_riel, requisitos_caminar_sobre_agua);
}

function colision_con_riel(entidad = self) {
	// Declaracion de valores
	var valor_auxiliar_distancia = 1.25;
	var pos_x_1 = entidad.x;
	var pos_y_1 = entidad.y;
	var pos_x_2 = entidad.x + entidad.asin * (entidad.mascara_colision * valor_auxiliar_distancia);
	var pos_y_2 = entidad.y + entidad.acos * (entidad.mascara_colision * valor_auxiliar_distancia);

	// Determinar si se debe mostrar la colision
	if (debug.permitir_depuracion) then draw_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2);
	
	// Determinar colisiones con obj_superficie
	var colision_normal_riel = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_riel, true, true);
	if (colision_normal_riel) then return true;
		
	// Determinar colisiones con superficies, ya sea capa frontal o capa posterior
	if (entidad.capa_actual == "frontal") {
        var colision_riel_frontal = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_riel_frontal, true, true);
		if (colision_riel_frontal) then return true;
    } else {
        var colision_riel_posterior = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_riel_posterior, true, true);
		if (colision_riel_posterior) then return true;
    }

	// En caso de que ningun caso se cumpla, se regresa falso
	return false;
}