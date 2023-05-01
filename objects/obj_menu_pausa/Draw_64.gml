if (pausar_juego) {
	var mitad_ancho_resolucion = Pantalla.RESOLUCION_HORIZONTAL / 2;
	var mitad_altura_resolucion = Pantalla.RESOLUCION_VERTICAL  / 2;
	
	// Dibujar el escenario
	draw_sprite_ext(sprite_escenario, 0, 0, 0, 1, 1, 0, c_white, 0.5);

	// Dibujar las opciones del menu
	if (nivel_actual == rm_hub_world) {
		draw_sprite(spr_menu_pausa_bloqueado, opcion_menu, mitad_ancho_resolucion, mitad_altura_resolucion)
	} else {
		draw_sprite(spr_menu_pausa_normal, opcion_menu, mitad_ancho_resolucion, mitad_altura_resolucion);
	}
}