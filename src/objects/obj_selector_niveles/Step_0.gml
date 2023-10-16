// Gestionar interaccion con el jugador
if (place_meeting(x, y, jugador)) {
	// Determinar si se desea interactuar
	var manteniendo_boton = controles.boton_mantenido("boton_especial");
	var velocidad_requerida = abs(jugador.velocidad_horizontal) < 3;
	
    if (manteniendo_boton and velocidad_requerida) {
        if (not permmitir_seleccion_nivel and (nombre_nivel != noone)) {
			// Ajustar los parametros del jugador
            jugador.accion = 0;
            jugador.velocidad_horizontal = 0;
            jugador.permitir_movimiento = false;
			
			if (room_exists(nombre_nivel)) {
				// Ajustar variable
				permmitir_seleccion_nivel = true;
				
				// Guardar la posicion del jugador
				var pos_y = y - jugador.mascara_colision;
				nivel.establecer_aparicion_hubworld(x, pos_y, nombre_nivel);
			}
        }
    }
	
	// Ajustar transparencia del titulo
    if (transparencia_iconos < 1) then transparencia_iconos += 0.2;
} else {
	// Ajustar transparencia del titulo
    if (transparencia_iconos >= 0) then transparencia_iconos -= 0.2;
}

// AJustar efectos
if (permmitir_seleccion_nivel) {
	permmitir_seleccion_nivel = false;
	audio.detener_todo();
	transiciones.iniciar_efecto_intraniveles("morado", 0.05, nombre_nivel);
}