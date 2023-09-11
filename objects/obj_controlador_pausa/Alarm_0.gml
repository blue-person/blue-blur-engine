// Eliminar la persistencia del nivel
room_persistent = false;

// Configurar datos en caso de no continuar con el nivel
if (opcion_seleccionada != 0) {
    control.inhabilitar_lectura(50);
    nivel.eliminar_punto_control();
    
    // Realizar acciones basadas en la opción seleccionada
    switch (opcion_seleccionada) {
        case 1:
            transicion.iniciar_efecto_intraniveles("morado", 0.030, room);
            break;
        case 2:
            var nivel_objetivo = (room == rm_hub_world) ? rm_titulo_juego : rm_hub_world;
            nivel.eliminar_aparicion_hubworld();
            transicion.iniciar_efecto_intraniveles("morado", 0.0165, nivel_objetivo);
            break;
    }
}