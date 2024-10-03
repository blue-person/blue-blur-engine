function colision_lineal_derecha() {
	// Declaracion de valores
	var valor_auxiliar = floor(mascara_colision * 3.5);
	var mascara_por_acos = acos * mascara_colision;
	var mascara_por_asin = asin * mascara_colision;
	var distancia_por_acos = acos * valor_auxiliar;
	var distancia_por_asin = asin * valor_auxiliar;
	
	var pos_x_1 = x + mascara_por_acos + mascara_por_asin;
	var pos_y_1 = y - mascara_por_asin + mascara_por_acos;
	var pos_x_2 = x + mascara_por_acos + distancia_por_asin;
	var pos_y_2 = y - mascara_por_asin + distancia_por_acos;
	
	// Declaracion de requisitos de colision
	var evaluar_plataforma = permitir_grinding;
	var evaluar_riel = permitir_grinding;
	var evaluar_agua = caminar_sobre_agua and not sumergido_agua;
	
	// Determinar si se debe mostrar la colision
	if (debug.permitir_ver_colisiones) then draw_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2);
	
	// Devolver resultado
	return colision_lineal_general(pos_x_1, pos_y_1, pos_x_2, pos_y_2, evaluar_plataforma, evaluar_riel, evaluar_agua);
}