function configuracion_groovy_badlands() {
	// Establecer descripcion del nivel
	nivel.establecer_descripcion(
		"Groovy  Badlands",
		"Escape  from  Rail  Canyon !"
	);

	// Establecer informacion de la musica
	nivel.establecer_cancion(msc_wild_groovy, 75, 138.03);

	// Establecer la estructura del fondo
	var propiedades_fondo = [
	  {
	    capa: layer_get_id("Monte_A"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("Monte_B"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("Nubes_A"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("Monte_C"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("Nubes_B"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("Nubes_C"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("Nubes_D"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("Nubes_E"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("Nubes_F"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	];
	nivel.establecer_propiedades_fondo(propiedades_fondo);

	// Establecer la estructura de los tilesets
	var propiedades_tilesets = [
	  {
	    capa: layer_get_id("nivel_tilesets_a"),
	    permitir_reflexion_agua: true,
	  },
	];
	nivel.establecer_propiedades_tilesets(propiedades_tilesets);

	// Depurar entorno y reproducir la cancion
	nivel.preparar_inicio();
}

function gestion_fondo_groovy_badlands() {
    // Variables
	var ubicacion_camara = obj_camara.obtener_ubicacion();
    var pos_x_camara = ubicacion_camara.pos_x / 2;
    var pos_y_camara = ubicacion_camara.pos_y - 304;

    // Gestion de la velocidad
    nivel.propiedades_fondo[2].velocidad_desplazamiento += 0.1;
    nivel.propiedades_fondo[4].velocidad_desplazamiento += 0.2;
    nivel.propiedades_fondo[5].velocidad_desplazamiento += 0.25;
    nivel.propiedades_fondo[6].velocidad_desplazamiento += 0.5;
    nivel.propiedades_fondo[7].velocidad_desplazamiento += 0.55;
    nivel.propiedades_fondo[8].velocidad_desplazamiento += 0.65;

    // Gestion del desplazamiento del monte A
    var img_monte_a = nivel.propiedades_fondo[0];
    layer_x(img_monte_a.capa, pos_x_camara * 0.99);
    layer_y(img_monte_a.capa, pos_y_camara - 15);

    // Gestion del desplazamiento del monte B
    var img_monte_b = nivel.propiedades_fondo[1];
    layer_x(img_monte_b.capa, pos_x_camara * 0.95);
    layer_y(img_monte_b.capa, pos_y_camara + 260);

    // Gestion del desplazamiento de las nubes A
    var img_nubes_a = nivel.propiedades_fondo[2];
    layer_x(img_nubes_a.capa, (pos_x_camara + img_nubes_a.velocidad_desplazamiento) * 0.94);
    layer_y(img_nubes_a.capa, pos_y_camara + 292);

    // Gestion del desplazamiento del monte C
    var img_monte_c = nivel.propiedades_fondo[3];
    layer_x(img_monte_c.capa, pos_x_camara * 0.92);
    layer_y(img_monte_c.capa, pos_y_camara + 187);

    // Gestion del desplazamiento de las nubes B
    var img_nubes_b = nivel.propiedades_fondo[4];
    layer_x(img_nubes_b.capa, (pos_x_camara + img_nubes_b.velocidad_desplazamiento) * 0.9);
    layer_y(img_nubes_b.capa, pos_y_camara + 308);

    // Gestion del desplazamiento de las nubes C
    var img_nubes_c = nivel.propiedades_fondo[5];
    layer_x(img_nubes_c.capa, (pos_x_camara + img_nubes_c.velocidad_desplazamiento) * 0.88);
    layer_y(img_nubes_c.capa, pos_y_camara + 332);

    // Gestion del desplazamiento de las nubes D
    var img_nubes_d = nivel.propiedades_fondo[6];
    layer_x(img_nubes_d.capa, (pos_x_camara + img_nubes_d.velocidad_desplazamiento) * 0.86);
    layer_y(img_nubes_d.capa, pos_y_camara + 348);

    // Gestion del desplazamiento de las nubes E
    var img_nubes_e = nivel.propiedades_fondo[7];
    layer_x(img_nubes_e.capa, (pos_x_camara + img_nubes_e.velocidad_desplazamiento) * 0.85);
    layer_y(img_nubes_e.capa, pos_y_camara + 364);

    // Gestion del desplazamiento de las nubes F
    var img_nubes_f = nivel.propiedades_fondo[8];
    layer_x(img_nubes_f.capa, (pos_x_camara + img_nubes_f.velocidad_desplazamiento) * 0.85);
    layer_y(img_nubes_f.capa, pos_y_camara + 385);
}