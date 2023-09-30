function configuracion_pantalla_titulo() {
	// Establecer informacion de la musica
	audio.reproducir_cancion(msc_south_island);

	// Establecer la estructura del fondo
	var propiedades_fondo = [
	  {
	    capa: layer_get_id("monte_a"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: false,
	  },
	  {
	    capa: layer_get_id("monte_b"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: false,
	  },
	  {
	    capa: layer_get_id("nubes_a"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: false,
	  },
	  {
	    capa: layer_get_id("monte_c"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: false,
	  },
	  {
	    capa: layer_get_id("nubes_b"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: false,
	  },
	  {
	    capa: layer_get_id("nubes_c"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: false,
	  },
	  {
	    capa: layer_get_id("nubes_d"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: false,
	  },
	  {
	    capa: layer_get_id("nubes_e"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: false,
	  }
	];
	nivel.establecer_propiedades_fondo(propiedades_fondo);
}

function gestion_fondo_pantalla_titulo() {
    // Variables
    var pos_x_camara = 0;
    var pos_y_camara = -110;

    // Gestion de la velocidad
	nivel.propiedades_fondo[0].velocidad_desplazamiento += 0.15;
	nivel.propiedades_fondo[1].velocidad_desplazamiento += 0.125;
    nivel.propiedades_fondo[2].velocidad_desplazamiento += 0.1;
    nivel.propiedades_fondo[3].velocidad_desplazamiento += 0.25;
    nivel.propiedades_fondo[4].velocidad_desplazamiento += 0.2;
    nivel.propiedades_fondo[5].velocidad_desplazamiento += 0.25;
    nivel.propiedades_fondo[6].velocidad_desplazamiento += 0.5;
    nivel.propiedades_fondo[7].velocidad_desplazamiento += 0.55;

    // Gestion del desplazamiento del monte A
    var img_monte_a = nivel.propiedades_fondo[0];
    layer_x(img_monte_a.capa, (pos_x_camara + img_monte_a.velocidad_desplazamiento) * 0.99);
    layer_y(img_monte_a.capa, pos_y_camara - 15);

    // Gestion del desplazamiento del monte B
    var img_monte_b = nivel.propiedades_fondo[1];
    layer_x(img_monte_b.capa, (pos_x_camara + img_monte_b.velocidad_desplazamiento) * 0.95);
    layer_y(img_monte_b.capa, pos_y_camara + 260);

    // Gestion del desplazamiento de las nubes A
    var img_nubes_a = nivel.propiedades_fondo[2];
    layer_x(img_nubes_a.capa, (pos_x_camara + img_nubes_a.velocidad_desplazamiento) * 0.94);
    layer_y(img_nubes_a.capa, pos_y_camara + 292);

    // Gestion del desplazamiento del monte C
    var img_monte_c = nivel.propiedades_fondo[3];
    layer_x(img_monte_c.capa, (pos_x_camara + img_monte_c.velocidad_desplazamiento) * 0.92);
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
}