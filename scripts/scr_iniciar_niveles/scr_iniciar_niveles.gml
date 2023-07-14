function presentar_nivel(nombre = "Nivel generico", objetivo = "Objetivo generico") {
	global.nombre_nivel = nombre;
	global.objetivo_nivel = objetivo;
}

function reiniciar_checkpoints() {
	nivel.reestablecer_datos_jugador();
}

function reiniciar_puntaje() {
	nivel.establecer_puntaje_tiempo(0);
	nivel.establecer_puntaje_rings(0;
	nivel.puntaje.cool = 0);
	nivel.obtener_puntaje_final() = 0);
}