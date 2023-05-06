function colision_lineal_izquierda(mascara = 16, entidad = self) {
	// Declaracion de valores
	var valor_referencia_coseno = mascara * entidad.acos;
	var valor_referencia_seno = mascara * entidad.asin;
	var longitud_linea = mascara * 3;

	// Declaracion de puntos
	var pos_x = entidad.x;
	var pos_y = entidad.y;
	
	var pos_x_1 = pos_x - valor_referencia_coseno + valor_referencia_seno;
	var pos_y_1 = pos_y + valor_referencia_seno + valor_referencia_coseno;
	var pos_x_2 = pos_x - valor_referencia_coseno + (entidad.asin * longitud_linea);
	var pos_y_2 = pos_y + valor_referencia_seno + (entidad.acos * longitud_linea);
	
	// Determinar si se debe mostrar la colision
	if (global.permitir_modo_debug) then draw_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2);

	// Determinar colisiones con obj_superficie
	var colision_normal_superficie = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_superficie, true, true);
	var colision_capas_superficie = colision_lineal_capas(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_superficie_posterior, obj_superficie_frontal);
	if (colision_normal_superficie or colision_capas_superficie) then return true;

	// Determinar colisiones con obj_riel
	var colision_normal_riel = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_riel, true, true);
	var colision_capas_riel = colision_lineal_capas(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_riel_posterior, obj_riel_frontal);
	if (permitir_grinding and (colision_normal_riel or colision_capas_riel)) then return true;
	
	// Determinar colisiones con obj_superficie_agua
	var angulo_requerido = (entidad.angulo <= 45) or (entidad.angulo >= 315);
	var velocidad_requerida = (abs(entidad.velocidad_horizontal) >= 8);
	var colision_normal_agua = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_superficie_agua, true, true);
	if (!entidad.sumergido_agua and angulo_requerido and velocidad_requerida and colision_normal_agua) then return true;
	
	// En caso de que ningun caso se cumpla, se regresa falso
	return false;
}

function colision_lineal_derecha(mascara = 16, entidad = self) {
	// Declaracion de valores
	var valor_referencia_coseno = mascara * entidad.acos;
	var valor_referencia_seno = mascara * entidad.asin;
	var longitud_linea = mascara * 3;

	// Declaracion de puntos
	var pos_x = entidad.x;
	var pos_y = entidad.y;
	
	var pos_x_1 = pos_x + valor_referencia_coseno + valor_referencia_seno;
	var pos_y_1 = pos_y - valor_referencia_seno + valor_referencia_coseno;
	var pos_x_2 = pos_x + valor_referencia_coseno + (entidad.asin * longitud_linea);
	var pos_y_2 = pos_y - valor_referencia_seno + (entidad.acos * longitud_linea);
	
	// Determinar si se debe mostrar la colision
	if (global.permitir_modo_debug) then draw_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2);

	// Determinar colisiones con obj_superficie
	var colision_normal_superficie = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_superficie, true, true);
	var colision_capas_superficie = colision_lineal_capas(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_superficie_posterior, obj_superficie_frontal);
	if (colision_normal_superficie or colision_capas_superficie) then return true;

	// Determinar colisiones con obj_riel
	var colision_normal_riel = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_riel, true, true);
	var colision_capas_riel = colision_lineal_capas(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_riel_posterior, obj_riel_frontal);
	if (permitir_grinding and (colision_normal_riel or colision_capas_riel)) then return true;
	
	// Determinar colisiones con obj_superficie_agua
	var angulo_requerido = (entidad.angulo <= 45) or (entidad.angulo >= 315);
	var velocidad_requerida = (abs(entidad.velocidad_horizontal) >= 8);
	var colision_normal_agua = collision_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2, obj_superficie_agua, true, true);
	if (!entidad.sumergido_agua and angulo_requerido and velocidad_requerida and colision_normal_agua) then return true;

	// En caso de que ningun caso se cumpla, se regresa falso
	return false;
}