if (opcion_menu != 0) {
	// Eliminar datos sobre el punto de control
	room_persistent = false;
	nivel.eliminar_punto_control();
	
	// Ejecutar la opcion seleccionada
	if (opcion_menu == 1) {
		transicion.iniciar_efecto_intraniveles("morado", 0.028, room);
	} else if (opcion_menu == 2) {
		if (room == rm_hub_world) {
			nivel.eliminar_aparicion_hubworld();
			transicion.iniciar_efecto_intraniveles("morado", 0.0165, rm_titulo_juego);
		} else {
			transicion.iniciar_efecto_intraniveles("morado", 0.0165, rm_hub_world);
		}
	}
}