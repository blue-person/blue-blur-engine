// Estructura con la informacion del nivel
info = {
	descripcion: {nombre: "nivel", objetivo: "objetivo"},
	cancion: {nombre: noone, bucle: {inicio: 0, final: 0} }
};

// Estructura con la informacion del puntaje
puntaje = {
	tiempo: 0, rings: 0, cool: 0, final: 0
};

// Estructura con la informacion del checkpoint
checkpoint = {
	permitir_reaparicion: false,
	ubicacion_reaparicion: {pos_x: 0, pos_y: 0},
	tiempo_registrado: [0, 0, 0]
};

// Metodos
establecer_descripcion = function(nombre_nivel, objetivo_nivel) {
	info.descripcion.nombre = nombre_nivel;
	info.descripcion.objetivo = objetivo_nivel;
}

establecer_cancion = function(nombre_audio, inicio_bucle, final_bucle) {
	info.cancion.nombre = nombre_audio;
	info.cancion.bucle.inicio = inicio_bucle;
	info.cancion.bucle.final = final_bucle;
}

establecer_punto_control = function(pos_reaparicion_x, pos_reaparicion_y, tiempo_ha_registrar) {
    checkpoint.permitir_reaparicion = true;
	checkpoint.ubicacion_reaparicion.pos_x = pos_reaparicion_x;
	checkpoint.ubicacion_reaparicion.pos_y = pos_reaparicion_y;
	checkpoint.tiempo_registrado = copiar_lista(tiempo_ha_registrar);
}

establecer_puntaje_tiempo = function(valor) {
	puntaje.tiempo = valor;
}

establecer_puntaje_rings = function(valor) {
	puntaje.rings = valor;
}

aumentar_puntaje_cool = function(valor) {
	puntaje.cool += valor;
}

calcular_puntaje_final = function(metodo, valor_incremento = 100) {
	if (metodo == "automatico") {
		puntaje.final += puntaje.tiempo + puntaje.rings + puntaje.cool;
		puntaje.tiempo = 0;
		puntaje.rings = 0;
		puntaje.cool = 0;
	} else if (metodo == "incremental") {
		var decremento_tiempo = min(valor_incremento, puntaje.tiempo);
	    var decremento_rings = min(valor_incremento, puntaje.rings);
	    var decremento_cool = min(valor_incremento, puntaje.cool);
	
	    puntaje.tiempo -= decremento_tiempo;
	    puntaje.final += decremento_tiempo;

	    puntaje.rings -= decremento_rings;
	    puntaje.final += decremento_rings;

	    puntaje.cool -= decremento_cool;
	    puntaje.final += decremento_cool;
	}
}

comprobar_puntaje_vacio = function() {
	return ((puntaje.tiempo == 0) and (puntaje.rings == 0) and (puntaje.cool == 0));
}

obtener_descripcion = function() {
	return info.descripcion;
}

obtener_permiso_reaparicion = function() {
	return checkpoint.permitir_reaparicion;
}

obtener_ubicacion_reaparicion = function() {
	return checkpoint.ubicacion_reaparicion;
} 

obtener_tiempo_checkpoint = function() {
	return checkpoint.tiempo_registrado;
}

obtener_puntaje_final = function() {
	return puntaje.final;
}

eliminar_punto_control = function() {
	checkpoint.permitir_reaparicion = false;
	checkpoint.ubicacion_reaparicion.pos_x = 0;
	checkpoint.ubicacion_reaparicion.pos_y = 0;
	checkpoint.tiempo_registrado = [0, 0, 0];
}

eliminar_puntaje = function() {
	puntaje.tiempo = 0;
	puntaje.rings = 0;
	puntaje.cool = 0;
	puntaje.final = 0;
}

depurar_entorno = function() {
	self.eliminar_punto_control();
	self.eliminar_puntaje();
	audio.detener_todo();
}

preparar_inicio = function() {
	// Realizar limpieza de valores y elementos
	self.depurar_entorno();
	
	// Reproducir cancion del nivel
	audio.reproducir_cancion_bucle(
		info.cancion.nombre,
		info.cancion.bucle.inicio,
		info.cancion.bucle.final
	);
}