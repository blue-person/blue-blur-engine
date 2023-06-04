function cargar_gestores() {
	// Gestor de controles
	global.gestor_pantalla = instance_create_depth(0, 0, PROFUNDIDAD_GESTORES, obj_gestor_pantalla);
	#macro pantalla global.gestor_pantalla
	
	// Gestor de audio
	global.gestor_audio = instance_create_depth(0, 0, PROFUNDIDAD_GESTORES, obj_gestor_audio);
	#macro audio global.gestor_audio
	
	// Gestor de controles
	global.gestor_controles = instance_create_depth(0, 0, PROFUNDIDAD_GESTORES, obj_gestor_controles);
	#macro control global.gestor_controles
}