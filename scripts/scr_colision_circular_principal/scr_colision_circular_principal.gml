function colision_circular_principal(entidad = self) {
	// Declaracion de valores
	var pos_x = entidad.x;
	var pos_y = entidad.y;
	var radio_circulo = entidad.mascara_colision;
	
	// Declaracion de requisitos de colision
	var requisitos_colision_riel = entidad.permitir_grinding;
	var requisitos_caminar_sobre_agua = (entidad.caminar_sobre_agua) and (not entidad.sumergido_agua);
	
	// Determinar si se debe mostrar la colision
	if (debug.permitir_depuracion) then draw_circle(pos_x, pos_y, radio_circulo, true);
	
	// Devolver resultado
	return colision_circular_general(entidad, pos_x, pos_y, radio_circulo, requisitos_colision_riel, requisitos_caminar_sobre_agua);
}