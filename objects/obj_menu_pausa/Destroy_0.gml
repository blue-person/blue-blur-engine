if (opcion_menu != 0) {
	// Eliminar datos sobre el punto de control
	nivel.eliminar_punto_control();
	
	// Ejecutar la opcion seleccionada
	if (opcion_menu == 1) {
		iniciar_transicion_niveles(room, "negro", 0.028);
	} else if (opcion_menu == 2) {
		if (room == rm_hub_world) {
			room_persistent = false;
			iniciar_transicion_niveles(rm_titulo_juego, "negro", 0.0165);
		} else {
			iniciar_transicion_niveles(rm_hub_world, "negro", 0.0165);
		}
	}
}