// Determinar direccion
var direccion = cambiar_direccion ? -1 : 1;

// Gestionar alarma
if (alarm[0] == -1) {
	alarm[0] = tiempo_movimiento;
}

// Gestionar movimiento
if (tipo_movimiento == "horizontal") {
	// Ajustar la velocidad horizontal
	var velocidad_horizontal = hspeed + (0.1 * direccion);
	hspeed = clamp(velocidad_horizontal, -velocidad_movimiento, velocidad_movimiento);
	
	// Hacer que el jugador se mantenga encima de la plataforma
	var jugador_colisionando = place_meeting(x, y - 1, jugador);
	if (jugador_colisionando and jugador.tocando_suelo) {
	    jugador.angulo = 0;
	    jugador.x += hspeed;
	}
} else if (tipo_movimiento == "vertical") {
	// Ajustar la velocidad vertical
	var velocidad_vertical = vspeed + (0.1 * direccion);
	vspeed = clamp(velocidad_vertical, -velocidad_movimiento, velocidad_movimiento);

	// Hacer que el jugador se mantenga encima de la plataforma
	var jugador_colisionando = place_meeting(x, y - 1, jugador);
	if (jugador_colisionando and jugador.tocando_suelo) {
	    jugador.angulo = 0;
	    jugador.y += vspeed;
	}
}