function configuracion_luminous_bingo() {
	// Establecer descripcion del nivel
	nivel.establecer_descripcion(
		"Luminous  Bingo",
		"Dodge  the  traps  of  Casino  Park !"
	);

	// Establecer informacion de la musica
	nivel.establecer_cancion(msc_luminous_bingo, 8.5, 108.97);

	// Establecer la estructura del fondo
	var propiedades_fondo = [
	  {
	    capa: noone,
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: false,
	  },
	];
	nivel.establecer_propiedades_fondo(propiedades_fondo);

	// Estructura de los tilesets
	var propiedades_tilesets = [
	  {
	    capa: noone,
	    permitir_reflexion_agua: false,
	  },
	];
	nivel.establecer_propiedades_tilesets(propiedades_tilesets);

	// Depurar entorno y reproducir la cancion
	nivel.preparar_inicio();
}

function gestion_fondo_luminous_bingo() {
    // Variables
	var ubicacion_camara = obj_camara.obtener_ubicacion();
    var pos_x_camara = ubicacion_camara.pos_x;
    var pos_y_camara = ubicacion_camara.pos_y;
}