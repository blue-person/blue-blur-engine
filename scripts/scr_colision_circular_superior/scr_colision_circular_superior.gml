function colision_circular_superior(entidad = self) {
	// Declaracion de valores
	var pos_x = entidad.x - (entidad.asin * entidad.mascara_colision);
	var pos_y = entidad.y - (entidad.acos * entidad.mascara_colision);
	var radio_circulo = 3;
	
	// Determinar si se debe mostrar la colision
	if (debug.permitir_depuracion) then draw_circle(pos_x, pos_y, radio_circulo, true);
	
	// Devolver resultado
	return colision_circular_general(entidad, pos_x, pos_y, radio_circulo);
}