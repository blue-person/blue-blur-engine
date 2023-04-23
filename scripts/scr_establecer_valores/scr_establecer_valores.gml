function establecer_constantes() {
	// Visuales
	#macro ANCHO_RESOLUCION 456
	#macro ALTURA_RESOLUCION 256
	
	// Controles
	#macro SENSIBILIDAD_GAMEPAD 0.45
}

function establecer_variables_proyecto() {
	global.permitir_modo_debug = false;
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