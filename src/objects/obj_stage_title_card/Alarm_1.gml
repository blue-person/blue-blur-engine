// Cambiar la animacion de la presentacion principal
animacion_presentacion = 3;

// Mostrar el HUD despues de un breve periodo
alarm[2] = graficos.obtener_velocidad_juego() / 2;

// Dar movimiento inicial al jugador
with (obj_jugador) {
	tocando_suelo = true;
	permitir_movimiento = true;
	
    if (not nivel.obtener_permiso_reaparicion()) {
		velocidad_horizontal = 9;
        direccion_horizontal = 1;
    }
}