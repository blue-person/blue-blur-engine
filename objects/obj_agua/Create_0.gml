// Importar todos los eventos de Platform Water Reflection 
event_inherited();

// Hacer que la profundidad de la capa sea -100,
// esto permite que todos los objetos queden "dentro" del agua
depth = -100;

// Determina que fondos se veran reflejados
back_layers = [];
var propiedades_fondo = nivel.propiedades_fondo;
if (array_length(propiedades_fondo) > 0) {
	for (var i = 0; i < array_length(propiedades_fondo); i++) {
		if (propiedades_fondo[i].permitir_reflexion_agua) {
			array_push(back_layers, propiedades_fondo[i].capa);
		}
	}
}

// Determina que tilesets se veran reflejados
tile_layers = [];
var propiedades_tilesets = nivel.propiedades_tilesets;
if (array_length(propiedades_tilesets) > 0) {
	for (var i = 0; i < array_length(propiedades_tilesets); i++) {
		if (propiedades_tilesets[i].permitir_reflexion_agua) {
			array_push(tile_layers, propiedades_tilesets[i].capa);
		}
	}
}

// Crear superficie y que tenga el mismo largo pero un menor ancho que este objeto
superficie_agua = instance_create_depth(x, y, depth, obj_superficie_agua);
superficie_agua.visible = false;
superficie_agua.image_xscale = sprite_width / superficie_agua.sprite_width;
superficie_agua.image_yscale = sprite_height / (superficie_agua.sprite_height * 16);