function iniciar_transicion_simple(color, velocidad_transicion) {
	var objeto_requerido
	switch (color) {
	    case "negro":
	        objeto_requerido = obj_transicion_negro;
	        break;
		case "blanco":
	        objeto_requerido = obj_transicion_blanco;
	        break;
	    default:
	        objeto_requerido = obj_transicion;
	        break;
	}
	
	var transicion = instance_create_depth(0, 0, -9999, objeto_requerido);
	transicion.velocidad_transicion = velocidad_transicion;
}

function iniciar_transicion_niveles(nivel_objetivo, color, velocidad_transicion) {
	var objeto_requerido
	switch (color) {
	    case "negro":
	        objeto_requerido = obj_transicion_niveles_negro;
	        break;
		case "blanco":
	        objeto_requerido = obj_transicion_niveles_blanco;
	        break;
	    default:
	        objeto_requerido = obj_transicion_niveles;
	        break;
	}
	
	var transicion = instance_create_depth(0, 0, -9999, objeto_requerido);
	transicion.nivel_objetivo = nivel_objetivo;
	transicion.velocidad_transicion = velocidad_transicion;
}