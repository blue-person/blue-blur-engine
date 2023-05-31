function colision_circular_inferior() {
	// Declaracion de valores
	var pos_x = self.x + (self.asin * self.mascara_colision);
	var pos_y = self.y + (self.acos * self.mascara_colision);
	var radio_circulo = 8;
	
	// Declaracion de requisitos de colision
	var requisitos_colision_riel = self.permitir_grinding;
	var requisitos_caminar_sobre_agua = (self.caminar_sobre_agua) and (not self.sumergido_agua);
	
	// Determinar si se debe mostrar la colision
	if (global.permitir_modo_debug) then draw_circle(pos_x, pos_y, radio_circulo, true);
	
	// Devolver resultado
	return colision_circular_general(pos_x, pos_y, radio_circulo, requisitos_colision_riel, requisitos_caminar_sobre_agua);
}