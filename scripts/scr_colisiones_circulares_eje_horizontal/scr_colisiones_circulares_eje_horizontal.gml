function colision_parte_izquierda(mascara = 16, radio = 3, entidad = obj_jugador) {
	// Declaracion de valores
	var pos_x = entidad.x - entidad.acos * mascara - entidad.asin * 2;
	var pos_y = entidad.y + entidad.asin * mascara - entidad.acos * 2;
	
	// Determinar si se debe mostrar la colision
	if (global.permitir_modo_debug) then draw_circle(pos_x, pos_y, radio, true);
	
	// Determinar colisiones con obj_superficie
	var colision_normal_superficie = collision_circle(pos_x, pos_y, radio, obj_superficie, true, true);
	var colision_capas_superficie = colision_circular_capas(pos_x, pos_y, radio, obj_superficie_posterior, obj_superficie_frontal);
	if (colision_normal_superficie or colision_capas_superficie) then return true;
	
	// Determinar colisiones con obj_riel
	var requisitos_colision_riel = entidad.permitir_grinding and (entidad.angulo == 0);
	var colision_normal_riel = collision_circle(pos_x, pos_y, radio, obj_riel, true, true);
	var colision_capas_riel = colision_circular_capas(pos_x, pos_y, radio, obj_riel_posterior, obj_riel_frontal);
	if (requisitos_colision_riel and (colision_normal_riel or colision_capas_riel)) then return true;
	
	// En caso de que ningun caso se cumpla, se regresa falso
	return false;
}

function colision_parte_derecha(mascara = 16, radio = 3, entidad = obj_jugador) {
	// Declaracion de valores
	var pos_x = entidad.x + entidad.acos * mascara - entidad.asin * 2;
	var pos_y = entidad.y - entidad.asin * mascara - entidad.acos * 2;
	
	// Determinar si se debe mostrar la colision
	if (global.permitir_modo_debug) then draw_circle(pos_x, pos_y, radio, true);
	
	// Determinar colisiones con obj_superficie
	var colision_normal_superficie = collision_circle(pos_x, pos_y, radio, obj_superficie, true, true);
	var colision_capas_superficie = colision_circular_capas(pos_x, pos_y, radio, obj_superficie_posterior, obj_superficie_frontal);
	if (colision_normal_superficie or colision_capas_superficie) then return true;
	
	// Determinar colisiones con obj_riel
	var requisitos_colision_riel = entidad.permitir_grinding and (entidad.angulo == 0);
	var colision_normal_riel = collision_circle(pos_x, pos_y, radio, obj_riel, true, true);
	var colision_capas_riel = colision_circular_capas(pos_x, pos_y, radio, obj_riel_posterior, obj_riel_frontal);
	if (requisitos_colision_riel and (colision_normal_riel or colision_capas_riel)) then return true;
	
	// En caso de que ningun caso se cumpla, se regresa falso
	return false;
}