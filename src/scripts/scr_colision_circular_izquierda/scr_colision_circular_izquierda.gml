function colision_circular_izquierda() {
	// Declaracion de valores
	var valor_auxiliar = 2;
	var pos_x = x - (acos * mascara_colision) - (asin * valor_auxiliar);
	var pos_y = y + (asin * mascara_colision) - (acos * valor_auxiliar);
	var radio_circulo = 3;
	
	// Determinar si se debe mostrar la colision
	if (debug.permitir_depuracion) then draw_circle(pos_x, pos_y, radio_circulo, true);
	
	// Devolver resultado
	return colision_circular_general(pos_x, pos_y, radio_circulo);
}