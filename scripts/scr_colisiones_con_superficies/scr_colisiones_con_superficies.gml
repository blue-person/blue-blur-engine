function colision_con_suelo(mascara = 16, radio = 9, entidad = obj_jugador) {
	// Declaracion de valores
	var valor_referencia = mascara * 2.5;
	var pos_x = entidad.x + entidad.asin * valor_referencia;
	var pos_y = entidad.y + entidad.acos * valor_referencia;
	
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

function colision_con_riel(mascara = 32, entidad = obj_jugador) {
	// Declaracion de valores
	var pos_x_1 = entidad.x;
	var pos_y_1 = entidad.y;
	var pos_x_2 = pos_x_1 + mascara * entidad.asin;
	var pos_y_2 = pos_y_1 + mascara * entidad.acos;
	
	// Determinar si se debe mostrar la colision
	if (global.permitir_modo_debug) then draw_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2);
	
	// Determinar colisiones
	var colision_normal_riel = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_riel, true, true);
	var colision_capas_riel = colision_lineall_capas(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_riel_posterior, obj_riel_frontal);
	
	// Retornar comprobacion
	return (colision_normal_riel or colision_capas_riel);
}
