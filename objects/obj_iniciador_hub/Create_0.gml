// Importar las caracteristicas del inicializador principal
event_inherited();

// Establecer datos de inicio
var datos_aparicion_hubworld = nivel.obtener_aparicion_hubworld();
var existen_datos_previos = (datos_aparicion_hubworld.nivel_seleccionado != noone);

if (existen_datos_previos) {
	obj_camara.x = datos_aparicion_hubworld.pos_x;
	obj_camara.y = datos_aparicion_hubworld.pos_y;
	obj_jugador.x = datos_aparicion_hubworld.pos_x;
	obj_jugador.y = datos_aparicion_hubworld.pos_y;
} else {
	nivel.establecer_aparicion_hubworld(rm_hub_world, x, y);
}

// Crear HUD
instance_create_depth(0, 0, -100, obj_hud_hubworld);

// Crear controlador para cambiar de personaje
instance_create_depth(0, 0, -100, obj_cambiar_personaje);