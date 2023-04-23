function presentar_nivel(nombre = "Nivel generico", objetivo = "Objetivo generico") {
	global.nombre_nivel = nombre;
	global.objetivo_nivel = objetivo;
}

function reiniciar_checkpoints() {
	if (instance_exists(obj_controlador_checkpoint)) then obj_controlador_checkpoint.checkpoint = false;
}

function reiniciar_puntaje() {
	global.puntaje_tiempo = 0;
	global.puntaje_rings = 0;
	global.puntaje_cool = 0;
	global.puntaje_final = 0;
}