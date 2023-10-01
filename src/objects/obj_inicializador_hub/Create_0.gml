// Crear jugador
instance_create_depth(x, y, PROFUNDIDAD_JUGADOR, global.personaje_actual);

// Crear camara
instance_create_depth(x, y, PROFUNDIDAD_CONTROLADORES, obj_camara);
camara.establecer_enfoque(jugador);

// Crear HUD
instance_create_depth(0, 0, PROFUNDIDAD_INTERFAZ, obj_hud);
hud.establecer_visibilidad_elementos(false, false, true, false);

// Establecer datos de inicio
var datos_aparicion_hubworld = nivel.obtener_aparicion_hubworld();
var existen_datos_previos = (datos_aparicion_hubworld.nivel_seleccionado != noone);

if (existen_datos_previos) {
	jugador.x = datos_aparicion_hubworld.pos_x;
	jugador.y = datos_aparicion_hubworld.pos_y;
	
	camara.x = datos_aparicion_hubworld.pos_x;
	camara.y = datos_aparicion_hubworld.pos_y;
}

// Configurar los datos del Hub World
configuracion_hub_world();