function establecer_constantes() {
	enum Pantalla {
		RESOLUCION_HORIZONTAL = 456,
		RESOLUCION_VERTICAL = 256
	}
}

function establecer_variables_generales() {
	global.permitir_modo_debug = false;
	global.permitir_pantalla_completa = true;
	global.intensidad_vibracion_gamepad = 1;
	global.porcentaje_zona_muerta_sticks = 0.45;
}

function establecer_variables_jugador() {
	global.personaje_actual = "Sonic";
	global.vidas_restantes = 3;
}

function establecer_variables_niveles() {
	// Niveles
	global.nombre_nivel = "Nivel generico";
	global.objetivo_nivel = "Objetivo generico";
	
	// Puntaje
	global.puntaje_tiempo = 0;
	global.puntaje_rings = 0;
	global.puntaje_cool = 0;
	global.puntaje_final = 0;
}