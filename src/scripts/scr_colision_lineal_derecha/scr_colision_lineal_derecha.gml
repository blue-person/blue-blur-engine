function colision_lineal_derecha(entidad = self) {
	// Declaracion de valores
	var valor_auxiliar_distancia = floor(entidad.mascara_colision * 3.5);
	var mascara_por_acos = entidad.acos * entidad.mascara_colision;
	var mascara_por_asin = entidad.asin * entidad.mascara_colision;
	var distancia_por_acos = entidad.acos * valor_auxiliar_distancia;
	var distancia_por_asin = entidad.asin * valor_auxiliar_distancia;
	
	var pos_x_1 = entidad.x + mascara_por_acos + mascara_por_asin;
	var pos_y_1 = entidad.y - mascara_por_asin + mascara_por_acos;
	var pos_x_2 = entidad.x + mascara_por_acos + distancia_por_asin;
	var pos_y_2 = entidad.y - mascara_por_asin + distancia_por_acos;
	
	// Declaracion de requisitos de colision
	var requisitos_colision_riel = entidad.permitir_grinding;
	var requisitos_caminar_sobre_agua = (entidad.caminar_sobre_agua) and (not entidad.sumergido_agua);
	
	// Determinar si se debe mostrar la colision
	if (debug.permitir_depuracion) then draw_line(pos_x_1, pos_y_1, pos_x_2, pos_y_2);
	
	// Devolver resultado
	return colision_lineal_general(entidad, pos_x_1, pos_y_1, pos_x_2, pos_y_2, requisitos_colision_riel, requisitos_caminar_sobre_agua);
}