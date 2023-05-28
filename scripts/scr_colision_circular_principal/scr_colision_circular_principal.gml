function colision_circular_principal() {
	// Declarar variables
	var pos_x = self.x;
	var pos_y = self.y;
	var radio_circulo = self.mascara_colision;
	var requisitos_colision_riel = self.permitir_grinding;

	// Determinar si se debe mostrar la colision
	if (global.permitir_modo_debug) then draw_circle(pos_x, pos_y, radio_circulo, true);
	
	// Determinar si esta tocando la superficie del agua
	var colision_superficie_agua = colision_circular_agua(pos_x, pos_y, radio_circulo);
	if (colision_superficie_agua) then return true;
	
	// Devolver resultado
	return colision_circular_general(pos_x, pos_y, radio_circulo, requisitos_colision_riel);
}