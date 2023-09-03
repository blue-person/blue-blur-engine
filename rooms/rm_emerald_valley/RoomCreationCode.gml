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