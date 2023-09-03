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
    capa: layer_get_id("fondo_nubes"),
    velocidad_desplazamiento: 0,
    permitir_reflexion_agua: true,
  },
  {
    capa: layer_get_id("fondo_arboles"),
    velocidad_desplazamiento: 0,
    permitir_reflexion_agua: true,
  },
  {
    capa: layer_get_id("fondo_montes"),
    velocidad_desplazamiento: 0,
    permitir_reflexion_agua: true,
  },
  {
    capa: layer_get_id("fondo_escenario"),
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
  {
    capa: layer_get_id("nivel_tilesets_d"),
    permitir_reflexion_agua: true,
  },
  {
    capa: layer_get_id("nivel_tilesets_e"),
    permitir_reflexion_agua: true,
  },
  {
    capa: layer_get_id("nivel_tilesets_f"),
    permitir_reflexion_agua: true,
  },
];

nivel.establecer_propiedades_tilesets(propiedades_tilesets);

// Depurar entorno y reproducir la cancion
nivel.preparar_inicio();