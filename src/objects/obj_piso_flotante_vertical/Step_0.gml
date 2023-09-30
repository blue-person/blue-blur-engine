// Ajustar las posiciones de las capas
capa_frontal.x = x;
capa_frontal.y = y + 18;

capa_posterior.x = x;
capa_posterior.y = y - 35;

// Determinar movimiento
if (mover_hacia_abajo) {
    if (vspeed < velocidad_movimiento) {
		vspeed += 0.1;
	}
} else {
    if (vspeed > -velocidad_movimiento) {
		vspeed -= 0.1;
	}
}

// Hacer que el jugador se mantenga encima de la plataforma
if (place_meeting(x, y - 1, obj_jugador) and obj_jugador.tocando_suelo) {
    obj_jugador.angulo = 0;
    obj_jugador.y += floor(vspeed);
}

// Determinar direccion
valor_alarma_actual--;
if (valor_alarma_actual <= 0) {
    if (mover_hacia_abajo) {
		mover_hacia_abajo = false;
	} else {
		mover_hacia_abajo = true;
	}
    valor_alarma_actual = alarma_movimiento;
}