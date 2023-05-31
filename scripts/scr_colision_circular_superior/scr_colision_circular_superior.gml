function colision_circular_superior() {
	// Declaracion de valores
	var pos_x = self.x - (self.asin * self.mascara_colision);
	var pos_y = self.y - (self.acos * self.mascara_colision);
	var radio_circulo = 3;
	
	// Determinar si se debe mostrar la colision
	if (global.permitir_modo_debug) then draw_circle(pos_x, pos_y, radio_circulo, true);
	
	// Devolver resultado
	return colision_circular_general(pos_x, pos_y, radio_circulo);
}