function configuracion_mining_mayhem() {
	// Establecer descripcion del nivel
	nivel.establecer_descripcion(
		"Mining  Mayhem",
		"Take  down  everything  in  your  path !"
	);

	// Establecer informacion de la musica
	nivel.establecer_cancion(msc_planet_wisp, 14.6, 160.5);

	// Establecer la estructura del fondo
	var propiedades_fondo = [
	  {
	    capa: layer_get_id("nubes"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("arboles"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("montes"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("escenario"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	];
	nivel.establecer_propiedades_fondo(propiedades_fondo);

	// Establecer la estructura de los tilesets
	var propiedades_tilesets = [
	  {
	    capa: layer_get_id("tilesets_a"),
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("tilesets_b"),
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("tilesets_c"),
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("tilesets_d"),
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("tilesets_e"),
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("tilesets_f"),
	    permitir_reflexion_agua: true,
	  },
	];
	nivel.establecer_propiedades_tilesets(propiedades_tilesets);

	// Depurar entorno y reproducir la cancion
	nivel.preparar_inicio();
}

function gestion_fondo_mining_mayhem() {
    // Variables
	var ubicacion_camara = obj_camara.obtener_ubicacion();
    var pos_x_camara = ubicacion_camara.pos_x;
    var pos_y_camara = ubicacion_camara.pos_y;

    // Gestion de la velocidad
    nivel.propiedades_fondo[0].velocidad_desplazamiento += 0.5;

    // Gestion del desplazamiento de las nubes
    var img_nubes = nivel.propiedades_fondo[0];
    layer_x(img_nubes.capa, (pos_x_camara / 1.5 + img_nubes.velocidad_desplazamiento) * 0.85);
    layer_y(img_nubes.capa, pos_y_camara - 250);

    // Gestion del desplazamiento de los arboles
    var img_arboles = nivel.propiedades_fondo[1];
    layer_x(img_arboles.capa, pos_x_camara / 2);
    layer_y(img_arboles.capa, pos_y_camara - 10);

    // Gestion del desplazamiento de los montes
    var img_montes = nivel.propiedades_fondo[2];
    layer_x(img_montes.capa, pos_x_camara / 1.25);
    layer_y(img_montes.capa, pos_y_camara - 80);

    // Gestion del desplazamiento del escenario
    var img_escenario = nivel.propiedades_fondo[3];
    layer_x(img_escenario.capa, pos_x_camara / 1.0225);
    layer_y(img_escenario.capa, pos_y_camara - 181);
}