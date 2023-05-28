function colision_circular_inferior() {
	// Declarar variables
	var pos_x = self.x + self.asin * self.mascara_colision;
	var pos_y = self.y + self.acos * self.mascara_colision;
	var radio_circulo = 7;
	var requisitos_colision_riel = self.permitir_grinding and (self.angulo == 0);
	
	// Determinar si se debe mostrar la colision
	if (global.permitir_modo_debug) then draw_circle(pos_x, pos_y, radio_circulo, true);

	// Determinar si puede caminar en el agua
	var tocando_superficie_agua = colision_circular_agua(pos_x, pos_y, radio_circulo);
	if (tocando_superficie_agua) then return true;
	
	// Devolver resultado
	return colision_circular_general(pos_x, pos_y, radio_circulo, requisitos_colision_riel);
}