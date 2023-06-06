function colision_circular_izquierda(entidad = self) {
	// Declaracion de valores
	var valor_auxiliar_posicion = 2;
	var pos_x = entidad.x - (entidad.acos * entidad.mascara_colision) - (entidad.asin * valor_auxiliar_posicion);
	var pos_y = entidad.y + (entidad.asin * entidad.mascara_colision) - (entidad.acos * valor_auxiliar_posicion);
	var radio_circulo = 3;
	
	// Declaracion de requisitos de colision
	var requisitos_colision_riel = (entidad.permitir_grinding) and (entidad.angulo == 0);
	
	// Determinar si se debe mostrar la colision
	if (debug.permitir_depuracion) then draw_circle(pos_x, pos_y, radio_circulo, true);
	
	// Devolver resultado
	return colision_circular_general(entidad, pos_x, pos_y, radio_circulo, requisitos_colision_riel);
}