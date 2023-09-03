function configuracion_emerald_valley(){
	// Establecer descripcion del nivel
	nivel.establecer_descripcion(
		"Emerald  Valley",
		"Run  through  the  beauty  of  Green  Hill !"
	);

	// Establecer informacion de la musica
	nivel.establecer_cancion(msc_quartz_quadrant, 14.90, 108);

	// Establecer la estructura del fondo
	var propiedades_fondo = [
	  {
	    capa: layer_get_id("fondo_cielo"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("fondo_oceano_a"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("fondo_oceano_b"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("fondo_oceano_c"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("fondo_oceano_d"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("fondo_nubes_a"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("fondo_nubes_b"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("fondo_nubes_c"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("fondo_nubes_d"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("fondo_montes"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: true,
	  },
	  {
	    capa: layer_get_id("fondo_piedras"),
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

function gestion_fondo_emerald_valley() {
    // Variables
	var ubicacion_camara = obj_camara.obtener_ubicacion();
    var pos_x_camara = ubicacion_camara.pos_x;
    var pos_y_camara = ubicacion_camara.pos_y;

    // Gestion de la velocidad
    nivel.propiedades_fondo[1].velocidad_desplazamiento += 0.44;
    nivel.propiedades_fondo[2].velocidad_desplazamiento += 0.53;
    nivel.propiedades_fondo[3].velocidad_desplazamiento += 0.57;
    nivel.propiedades_fondo[4].velocidad_desplazamiento += 0.59;
    nivel.propiedades_fondo[5].velocidad_desplazamiento += 0.35;
    nivel.propiedades_fondo[6].velocidad_desplazamiento += 0.5;
    nivel.propiedades_fondo[7].velocidad_desplazamiento += 0.5;
    nivel.propiedades_fondo[8].velocidad_desplazamiento += 0.5;
    nivel.propiedades_fondo[9].velocidad_desplazamiento += 0.35;
    nivel.propiedades_fondo[10].velocidad_desplazamiento += 0.5;

    // Gestion del desplazamiento del cielo
    var img_cielo = nivel.propiedades_fondo[0];
    layer_x(img_cielo.capa, pos_x_camara);
    layer_y(img_cielo.capa, pos_y_camara - 152);

    // Gestion del desplazamiento del oceano A
    var img_oceano_a = nivel.propiedades_fondo[1];
    layer_x(img_oceano_a.capa, (pos_x_camara / 1.5 + img_oceano_a.velocidad_desplazamiento) * 0.85);
    layer_y(img_oceano_a.capa, pos_y_camara);

    // Gestion del desplazamiento del oceano B
    var img_oceano_b = nivel.propiedades_fondo[2];
    layer_x(img_oceano_b.capa, (pos_x_camara / 1.5 + img_oceano_b.velocidad_desplazamiento) * 0.85);
    layer_y(img_oceano_b.capa, pos_y_camara);

    // Gestion del desplazamiento del oceano C
    var img_oceano_c = nivel.propiedades_fondo[3];
    layer_x(img_oceano_c.capa, (pos_x_camara / 1.5 + img_oceano_c.velocidad_desplazamiento) * 0.85);
    layer_y(img_oceano_c.capa, pos_y_camara);

    // Gestion del desplazamiento del oceano D
    var img_oceano_d = nivel.propiedades_fondo[4];
    layer_x(img_oceano_d.capa, (pos_x_camara / 1.5 + img_oceano_d.velocidad_desplazamiento) * 0.85);
    layer_y(img_oceano_d.capa, pos_y_camara + 13);

    // Gestion del desplazamiento de las nubes A
    var img_nubes_a = nivel.propiedades_fondo[5];
    layer_x(img_nubes_a.capa, (pos_x_camara / 1.5 + img_nubes_a.velocidad_desplazamiento) * 0.85);
    layer_y(img_nubes_a.capa, pos_y_camara - 22);

    // Gestion del desplazamiento de las nubes B
    var img_nubes_b = nivel.propiedades_fondo[6];
    layer_x(img_nubes_b.capa, (pos_x_camara / 1.25 + img_nubes_b.velocidad_desplazamiento) * 0.85);
    layer_y(img_nubes_b.capa, pos_y_camara - 100);

    // Gestion del desplazamiento de las nubes C
    var img_nubes_c = nivel.propiedades_fondo[7];
    layer_x(img_nubes_c.capa, (pos_x_camara / 1.5 + img_nubes_c.velocidad_desplazamiento) * 0.85);
    layer_y(img_nubes_c.capa, pos_y_camara - 85);

    // Gestion del desplazamiento de las nubes D
    var img_nubes_d = nivel.propiedades_fondo[8];
    layer_x(img_nubes_d.capa, (pos_x_camara / 1.5 + img_nubes_d.velocidad_desplazamiento) * 0.85);
    layer_y(img_nubes_d.capa, pos_y_camara - 60);

    // Gestion del desplazamiento de los montes
    var img_montes = nivel.propiedades_fondo[9];
    layer_x(img_montes.capa, (pos_x_camara / 1.5 + img_montes.velocidad_desplazamiento) * 0.85);
    layer_y(img_montes.capa, pos_y_camara - 38);

    // Gestion del desplazamiento de las piedras
    var img_piedras = nivel.propiedades_fondo[10];
    layer_x(img_piedras.capa, (pos_x_camara / 1.5 + img_piedras.velocidad_desplazamiento) * 0.85);
    layer_y(img_piedras.capa, pos_y_camara + 10);
}