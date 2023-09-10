function configuracion_practice_zone() {
	// Establecer descripcion del nivel
	nivel.establecer_descripcion(
		"Practice  Zone",
		"Test  your  skills !"
	);

	// Establecer informacion de la musica
	nivel.establecer_cancion(msc_tidal_tempest, 56.56, 188.36);

	// Establecer la estructura del fondo
	var propiedades_fondo = [
	  {
	    capa: layer_get_id("cuadros"),
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
	];
	nivel.establecer_propiedades_tilesets(propiedades_tilesets);

	// Depurar entorno y reproducir la cancion
	nivel.preparar_inicio();
}

function gestion_fondo_practice_zone() {
    // Gestion de la velocidad
    nivel.propiedades_fondo[0].velocidad_desplazamiento += 0.5;
	
    // Gestion del desplazamiento del fondo
    var img_cuadros = nivel.propiedades_fondo[0];
    layer_x(img_cuadros.capa, img_cuadros.velocidad_desplazamiento);
    layer_y(img_cuadros.capa, img_cuadros.velocidad_desplazamiento);
}