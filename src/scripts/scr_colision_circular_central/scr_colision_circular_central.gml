function colision_circular_central() {
	// Declaracion de valores
	var radio_circulo = mascara_colision;
	var pos_x = x;
	var pos_y = y;
	
	// Declaracion de requisitos de colision
	var evaluar_plataforma = permitir_grinding;
	var evaluar_riel = permitir_grinding;
	var evaluar_agua = caminar_sobre_agua and not sumergido_agua;
	
	// Determinar si se debe mostrar la colision
	if (debug.permitir_ver_colisiones) then draw_circle(pos_x, pos_y, radio_circulo, true);
	
	var colision_normal_superficie = collision_circle(pos_x, pos_y, radio_circulo, obj_plataforma, true, true);
	if (colision_normal_superficie) then return true;
	
	// Devolver resultado
	return colision_circular_general(pos_x, pos_y, radio_circulo, evaluar_plataforma, evaluar_riel, evaluar_agua);
}