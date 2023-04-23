function colision_parte_principal(radio = 16, entidad = obj_jugador) {
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