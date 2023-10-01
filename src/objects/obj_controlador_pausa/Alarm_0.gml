// Eliminar la persistencia del nivel
room_persistent = false;

// Configurar datos en caso de no continuar con el nivel
if (opcion_seleccionada != 0) {
    controles.inhabilitar_lectura(50);
    nivel.eliminar_punto_control();
    
    // Realizar acciones basadas en la opción seleccionada
    switch (opcion_seleccionada) {
        case 1:
            transiciones.iniciar_efecto_intraniveles("morado", 0.030, room);
            break;
        case 2:
			if (room == rm_hub_world) {
				nivel.eliminar_aparicion_hubworld();
				transiciones.iniciar_efecto_intraniveles("morado", 0.0170, rm_titulo_juego);
			} else {
				transiciones.iniciar_efecto_intraniveles("morado", 0.0165, rm_hub_world);
			}
            break;
    }
}