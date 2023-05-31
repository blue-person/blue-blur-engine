// Importar todos los eventos de Platform Water Reflection 
event_inherited();

// Hacer que la profundidad de la capa sea -100,
// esto permite que todos los objetos queden "dentro" del agua
depth = -100;

// Determina que fondos se veran reflejados
var estructura_fondos = obj_fondo_escenario.estructura_fondos;
if (array_length(estructura_fondos) > 0) {
	back_layers = [];
	for (var n = 0; n < array_length(estructura_fondos); n++) {
		if (estructura_fondos[n].permitir_reflexion_agua) {
			array_push(back_layers, estructura_fondos[n].capa);
		}
	}
}

// Determina que tilesets se veran reflejados
var estructura_tilesets = obj_fondo_escenario.estructura_tilesets;
if (array_length(estructura_tilesets) > 0) {
	tile_layers = [];
	for (var n = 0; n < array_length(estructura_tilesets); n++) {
		if (estructura_tilesets[n].permitir_reflexion_agua) {
			array_push(tile_layers, estructura_tilesets[n].capa);
		}
	}
}

// Crear superficie y que tenga el mismo largo pero un menor ancho que este objeto
superficie_agua = instance_create_depth(x, y, depth, obj_superficie_agua);
superficie_agua.visible = false;
superficie_agua.image_xscale = sprite_width / superficie_agua.sprite_width;
superficie_agua.image_yscale = sprite_height / (superficie_agua.sprite_height * 16);