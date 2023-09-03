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