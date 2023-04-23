// Ajustar las posiciones de las capas
capa_frontal.x = x;
capa_frontal.y = y + 16;

capa_posterior.x = x;
capa_posterior.y = y - 35;

// Determinar movimiento
if (mover_hacia_derecha) {
	if (hspeed < velocidad_movimiento) {
		hspeed += 0.1;
	}
} else {
	if (hspeed > -velocidad_movimiento) {
		hspeed -= 0.1;
	}
}

// Hacer que el jugador se mantenga encima de la plataforma
if (place_meeting(x, y - 1, obj_jugador) and obj_jugador.tocando_suelo) {
    obj_jugador.angulo = 0;
    obj_jugador.x += hspeed;
}

// Determinar direccion
--valor_alarma_actual;
if (valor_alarma_actual <= 0) {
    if (mover_hacia_derecha) {
		mover_hacia_derecha = false;
	} else {
		mover_hacia_derecha = true;
	}
    valor_alarma_actual = alarma_movimiento;
}