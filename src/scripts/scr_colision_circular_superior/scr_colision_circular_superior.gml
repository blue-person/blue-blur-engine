function colision_circular_superior() {
	// Declaracion de valores
	var pos_x = x - (asin * mascara_colision);
	var pos_y = y - (acos * mascara_colision);
	var radio_circulo = 3;
	
	// Determinar si se debe mostrar la colision
	if (debug.permitir_ver_colisiones) then draw_circle(pos_x, pos_y, radio_circulo, true);
	
	// Devolver resultado
	return colision_circular_general(pos_x, pos_y, radio_circulo);
}