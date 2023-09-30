function configuracion_hub_world() {
	// Establecer informacion de la musica
	audio.reproducir_cancion_bucle(msc_stardust_speedway, 24.65, 86.01);
	
	// Establecer la estructura del fondo
	var propiedades_fondo = [
	  {
	    capa: layer_get_id("cuadros"),
	    velocidad_desplazamiento: 0,
	    permitir_reflexion_agua: false,
	  },
	];
	nivel.establecer_propiedades_fondo(propiedades_fondo);

	// Establecer la estructura de los tilesets
	var propiedades_tilesets = [
	  {
	    capa: layer_get_id("tilesets_a"),
	    permitir_reflexion_agua: false,
	  },
	  {
	    capa: layer_get_id("tilesets_b"),
	    permitir_reflexion_agua: false,
	  },
	  {
	    capa: layer_get_id("tilesets_c"),
	    permitir_reflexion_agua: false,
	  },
	];
	nivel.establecer_propiedades_tilesets(propiedades_tilesets);
}

function gestion_fondo_hub_world() {
    // Gestion de la velocidad
    nivel.propiedades_fondo[0].velocidad_desplazamiento += 0.5;
	
    // Gestion del desplazamiento del fondo
    var img_cuadros = nivel.propiedades_fondo[0];
    layer_x(img_cuadros.capa, img_cuadros.velocidad_desplazamiento);
    layer_y(img_cuadros.capa, img_cuadros.velocidad_desplazamiento);
}