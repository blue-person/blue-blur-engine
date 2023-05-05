function colision_circular_principal(radio = 16, entidad = obj_jugador) {
	// Declaracion de valores
	var pos_x = entidad.x;
	var pos_y = entidad.y;
	
	// Determinar si se debe mostrar la colision
	if (global.permitir_modo_debug) then draw_circle(pos_x, pos_y, radio, true);
	
	// Determinar colisiones con obj_superficie
	var colision_normal_superficie = collision_circle(pos_x, pos_y, radio, obj_superficie, true, true);
	var colision_capas_superficie = colision_circular_capas(pos_x, pos_y, radio, obj_superficie_posterior, obj_superficie_frontal);
	if (colision_normal_superficie or colision_capas_superficie) then return true;
	
	// Determinar colisiones con obj_riel
	var colision_normal_riel = collision_circle(pos_x, pos_y, radio, obj_riel, true, true);
	var colision_capas_riel = colision_circular_capas(pos_x, pos_y, radio, obj_riel_posterior, obj_riel_frontal);
	if (entidad.permitir_grinding and (colision_normal_riel or colision_capas_riel)) then return true;
	
	// Determinar colisiones con obj_superficie_agua
	var angulo_requerido = (entidad.angulo <= 45) or (entidad.angulo >= 315);
	var velocidad_requerida = (abs(entidad.velocidad_horizontal) >= 8);
	var colision_normal_agua = collision_circle(pos_x, pos_y, radio, obj_superficie_agua, true, true);
	if (!entidad.sumergido_agua and angulo_requerido and velocidad_requerida and colision_normal_agua) then return true;
	
	// En caso de que ningun caso se cumpla, se regresa falso
	return false;
}

function colision_circular_superior(mascara = 16, radio = 3, entidad = obj_jugador) {
	// Declaracion de valores
	var pos_x = entidad.x - entidad.asin * mascara;
	var pos_y = entidad.y - entidad.acos * mascara;
	
	// Determinar si se debe mostrar la colision
	if (global.permitir_modo_debug) then draw_circle(pos_x, pos_y, radio, true);
	
	// Determinar colisiones con obj_superficie
	var colision_normal_superficie = collision_circle(pos_x, pos_y, radio, obj_superficie, true, true);
	var colision_capas_superficie = colision_circular_capas(pos_x, pos_y, radio, obj_superficie_posterior, obj_superficie_frontal);
	if (colision_normal_superficie or colision_capas_superficie) then return true;
	
	// Determinar colisiones con obj_plataforma
	var colision_normal_plataforma = collision_circle(pos_x, pos_y, radio, obj_plataforma, true, true);
	if (colision_normal_plataforma) then return false;
		
	// En caso de que ningun caso se cumpla, se regresa falso
	return false;
}

function colision_circular_inferior(mascara = 16, radio = 4, entidad = obj_jugador) {
	// Declaracion de valores
	var pos_x = entidad.x + entidad.asin * mascara;
	var pos_y = entidad.y + entidad.acos * mascara;
	
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
	
	// Determinar colisiones con obj_superficie_agua
	var angulo_requerido = (entidad.angulo <= 45) or (entidad.angulo >= 315);
	var velocidad_requerida = (abs(entidad.velocidad_horizontal) >= 8);
	var colision_normal_agua = collision_circle(pos_x, pos_y, radio, obj_superficie_agua, true, true);
	if (!entidad.sumergido_agua and angulo_requerido and velocidad_requerida and colision_normal_agua) then return true;
	
	// En caso de que ningun caso se cumpla, se regresa falso
	return false;
}

function colision_circular_izquierda(mascara = 16, radio = 3, entidad = obj_jugador) {
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

function colision_circular_derecha(mascara = 16, radio = 3, entidad = obj_jugador) {
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