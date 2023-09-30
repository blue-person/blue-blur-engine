// Estructura con la informacion del nivel
info = {
	descripcion: { nombre: "nivel", objetivo: "objetivo" },
	cancion: { nombre: noone, bucle: {inicio: 0, final: 0 } }
};

// Estructura con la informacion del puntaje
puntaje = { tiempo: 0, rings: 0, cool: 0, final: 0 };

// Estructura con la informacion del checkpoint
checkpoint = {
	permitir_reaparicion: false,
	ubicacion_reaparicion: {pos_x: 0, pos_y: 0},
	tiempo_registrado: [0, 0, 0]
};

// Estructura de las propiedades del fondo
propiedades_fondo = [{
	capa: noone,
	velocidad_desplazamiento: 0,
	permitir_reflexion_agua: false
}];

// Estructura de las propiedades de los tilesets
propiedades_tilesets = [{
	capa: noone,
	permitir_reflexion_agua: false
}];

// Estructura de la aparicion en el Hub World
datos_aparicion_hubworld = {
	pos_x: 0,
	pos_y: 0,
	nivel_seleccionado: noone
};

// Metodos
establecer_descripcion = function(nombre_nivel, objetivo_nivel) {
	self.info.descripcion.nombre = nombre_nivel;
	self.info.descripcion.objetivo = objetivo_nivel;
}

establecer_cancion = function(nombre_audio, inicio_bucle, final_bucle) {
	self.info.cancion.nombre = nombre_audio;
	self.info.cancion.bucle.inicio = inicio_bucle;
	self.info.cancion.bucle.final = final_bucle;
}

establecer_punto_control = function(pos_reaparicion_x, pos_reaparicion_y, tiempo_ha_registrar) {
    self.checkpoint.permitir_reaparicion = true;
	self.checkpoint.ubicacion_reaparicion.pos_x = pos_reaparicion_x;
	self.checkpoint.ubicacion_reaparicion.pos_y = pos_reaparicion_y;
	self.checkpoint.tiempo_registrado = copiar_lista(tiempo_ha_registrar);
}

establecer_puntaje_tiempo = function(valor) {
	self.puntaje.tiempo = valor;
}

establecer_puntaje_rings = function(valor) {
	self.puntaje.rings = valor;
}

aumentar_puntaje_cool = function(valor) {
	self.puntaje.cool += valor;
}

establecer_propiedades_fondo = function(estructura) {
	self.propiedades_fondo = copiar_lista(estructura);
}

establecer_propiedades_tilesets = function(estructura) {
	self.propiedades_tilesets = copiar_lista(estructura);
}

establecer_aparicion_hubworld = function(pos_x_aparicion, pos_y_aparicion, nombre_nivel) {
	self.datos_aparicion_hubworld.pos_x = pos_x_aparicion;
	self.datos_aparicion_hubworld.pos_y = pos_y_aparicion;
	self.datos_aparicion_hubworld.nivel_seleccionado = nombre_nivel;
}

obtener_descripcion = function() {
	return info.descripcion;
}

obtener_puntaje_final = function() {
	return puntaje.final;
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

obtener_aparicion_hubworld = function() {
	return datos_aparicion_hubworld;
}

obtener_propiedades_fondo = function() {
	return copiar_lista(propiedades_fondo);
}

obtener_propiedades_tilesets = function() {
	return copiar_lista(propiedades_tilesets);
}

calcular_puntaje_final = function(metodo, valor_incremento = 100) {
	if (metodo == "automatico") {
		self.puntaje.final += puntaje.tiempo + puntaje.rings + puntaje.cool;
		self.puntaje.tiempo = 0;
		self.puntaje.rings = 0;
		self.puntaje.cool = 0;
	} else if (metodo == "incremental") {
		var decremento_tiempo = min(valor_incremento, puntaje.tiempo);
	    var decremento_rings = min(valor_incremento, puntaje.rings);
	    var decremento_cool = min(valor_incremento, puntaje.cool);
	
	    self.puntaje.tiempo -= decremento_tiempo;
	    self.puntaje.final += decremento_tiempo;

	    self.puntaje.rings -= decremento_rings;
	    self.puntaje.final += decremento_rings;

	    self.puntaje.cool -= decremento_cool;
	    self.puntaje.final += decremento_cool;
	}
}

comprobar_puntaje_vacio = function() {
	return ((puntaje.tiempo == 0) and (puntaje.rings == 0) and (puntaje.cool == 0));
}

eliminar_punto_control = function() {
	self.checkpoint.permitir_reaparicion = false;
	self.checkpoint.ubicacion_reaparicion.pos_x = 0;
	self.checkpoint.ubicacion_reaparicion.pos_y = 0;
	self.checkpoint.tiempo_registrado = [0, 0, 0];
}

eliminar_puntaje = function() {
	self.puntaje.tiempo = 0;
	self.puntaje.rings = 0;
	self.puntaje.cool = 0;
	self.puntaje.final = 0;
}

eliminar_propiedades_fondo = function() {
	self.propiedades_fondo = [{
		capa: noone,
		velocidad_desplazamiento: 0,
		permitir_reflexion_agua: false
	}];
}

eliminar_propiedades_tilesets = function() {
	self.propiedades_tilesets = [{
		capa: noone,
		permitir_reflexion_agua: false
	}];
}

eliminar_aparicion_hubworld = function() {
	self.datos_aparicion_hubworld.nivel_seleccionado = noone;
	self.datos_aparicion_hubworld.pos_x = 0;
	self.datos_aparicion_hubworld.pos_y = 0;
}

depurar_entorno = function() {
	self.eliminar_punto_control();
	self.eliminar_puntaje();
	self.eliminar_propiedades_fondo();
	self.eliminar_propiedades_tilesets();
	audio.detener_todo();
}

preparar_inicio = function() {
	// Realizar limpieza de valores y elementos
	self.eliminar_punto_control();
	self.eliminar_puntaje();
	audio.detener_todo();
	
	// Reproducir cancion del nivel
	audio.reproducir_cancion_bucle(
		info.cancion.nombre,
		info.cancion.bucle.inicio,
		info.cancion.bucle.final
	);
}