// Importar las caracteristicas del inicializador principal
event_inherited();

// Crear HUD
instance_create_depth(0, 0, -100, obj_hud_hubworld);

// Crear controlador para cambiar de personaje
instance_create_depth(0, 0, -100, obj_cambiar_personaje);