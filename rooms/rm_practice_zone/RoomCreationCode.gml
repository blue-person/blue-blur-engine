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
    capa: layer_get_id("fondo_cuadros"),
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
  {
    capa: layer_get_id("nivel_tilesets_b"),
    permitir_reflexion_agua: true,
  },
  {
    capa: layer_get_id("nivel_tilesets_c"),
    permitir_reflexion_agua: true,
  },
];

nivel.establecer_propiedades_tilesets(propiedades_tilesets);

// Depurar entorno y reproducir la cancion
nivel.preparar_inicio();