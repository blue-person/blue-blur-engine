if (pausar_juego) {
	// Dibujar el escenario
	draw_sprite_ext(imagen_fondo, 0, 0, 0, 1, 1, 0, c_white, 0.5);

	// Dibujar el marco del menu
	draw_sprite(spr_menu_pausa_marco, 0, pos_x, pos_y);
	
	// Dibujar las opciones del menu
	for (var i = 0; i < cantidad_opciones; ++i) {
		var opcion_actual = opciones_menu[i];
	    draw_sprite(opcion_actual.sprite, opcion_actual.estado, pos_x, pos_y);
	}
}