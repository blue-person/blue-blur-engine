iniciar_efecto_basico = function(color, velocidad) {
	var efecto_transicion = crear_funcionalidad(Profundidades.Transiciones, obj_transicion_basica);
	efecto_transicion.establecer_color(color);
	efecto_transicion.establecer_velocidad(velocidad);
}

iniciar_efecto_intraniveles = function(color, velocidad, nivel_objetivo) {
	var efecto_transicion = crear_funcionalidad(Profundidades.Transiciones, obj_transicion_intraniveles);
	efecto_transicion.establecer_color(color);
	efecto_transicion.establecer_velocidad(velocidad);
	efecto_transicion.establecer_nivel_objetivo(nivel_objetivo);
}