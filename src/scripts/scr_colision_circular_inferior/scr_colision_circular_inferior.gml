function colision_circular_inferior() {
	// Declaracion de valores
	var radio_circulo = 8;
	var pos_x = x + (asin * mascara_colision);
	var pos_y = y + (acos * mascara_colision);
	
	// Declaracion de requisitos de colision
	var evaluar_plataforma = permitir_grinding;
	var evaluar_riel = permitir_grinding;
	var evaluar_agua = caminar_sobre_agua and not sumergido_agua;
	
	// Determinar si se debe mostrar la colision
	if (debug.permitir_ver_colisiones) then draw_circle(pos_x, pos_y, radio_circulo, true);

	// Devolver resultado
	return colision_circular_general(pos_x, pos_y, radio_circulo, evaluar_plataforma, evaluar_riel, evaluar_agua);
}