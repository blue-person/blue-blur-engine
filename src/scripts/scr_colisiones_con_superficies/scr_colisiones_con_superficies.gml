function colision_lineal_superficie(superficie_normal, superficie_posterior, superficie_frontal) {
	// Determinar colision con superficie
	var colision_normal = colision_lineal_simple(superficie_normal);
	if (colision_normal) then return true;

	// Determinar colisiones con superficies, ya sea capa frontal o capa posterior
	if (capa_actual == "frontal") {
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
	var valor_auxiliar = 2;
	var pos_x = x + asin * (mascara_colision * valor_auxiliar);
	var pos_y = y + acos * (mascara_colision * valor_auxiliar);
	var radio_circulo = 9;
	
	// Declaracion de requisitos de colision
	var requisitos_colision_riel = permitir_grinding;
	var requisitos_caminar_sobre_agua = caminar_sobre_agua and not sumergido_agua;
	
	// Determinar si se debe mostrar la colision
	if (debug.permitir_depuracion) then draw_circle(pos_x, pos_y, radio_circulo, true);
	
	// Retornar comprobacion
	return colision_circular_general(pos_x, pos_y, radio_circulo, requisitos_colision_riel, requisitos_caminar_sobre_agua);
}

function colision_con_riel() {
	// Declaracion de valores
	var pos_x = x + asin * mascara_colision;
	var pos_y = y + acos * mascara_colision;
	var radio_circulo = 8;

	// Determinar si se debe mostrar la colision
	if (debug.permitir_depuracion) then draw_circle(pos_x, pos_y, radio_circulo, true);
	
	// Determinar colisiones con obj_superficie
	var colision_normal_riel = collision_circle(pos_x, pos_y, radio_circulo, obj_riel, true, true);
	if (colision_normal_riel) then return true;
		
	// Determinar colisiones con superficies, ya sea capa frontal o capa posterior
	if (capa_actual == "frontal") {
        var colision_riel_frontal = collision_circle(pos_x, pos_y, radio_circulo, obj_riel_frontal, true, true);
		if (colision_riel_frontal) then return true;
    } else {
        var colision_riel_posterior = collision_circle(pos_x, pos_y, radio_circulo, obj_riel_posterior, true, true);
		if (colision_riel_posterior) then return true;
    }

	// En caso de que ningun caso se cumpla, se regresa falso
	return false;
}