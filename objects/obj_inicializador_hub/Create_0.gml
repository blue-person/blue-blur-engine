// Determinar el personaje que se va a usar
var personaje;
switch (global.personaje_actual) {
	case "Sonic":
		personaje = obj_sonic;
		break;
	case "Shadow":
		personaje = obj_shadow;
		break;
}

// Crear jugador
instance_create_depth(x, y, PROFUNDIDAD_JUGADOR, personaje);

// Crear camara
instance_create_depth(x, y, PROFUNDIDAD_CONTROLADORES, obj_camara);
obj_camara.establecer_enfoque(personaje);

// Establecer datos de inicio
var datos_aparicion_hubworld = nivel.obtener_aparicion_hubworld();
var existen_datos_previos = (datos_aparicion_hubworld.nivel_seleccionado != noone);

if (existen_datos_previos) {
	obj_jugador.x = datos_aparicion_hubworld.pos_x;
	obj_jugador.y = datos_aparicion_hubworld.pos_y;
	obj_camara.x = datos_aparicion_hubworld.pos_x;
	obj_camara.y = datos_aparicion_hubworld.pos_y;
}

// Crear HUD
instance_create_depth(0, 0, -100, obj_hud_hubworld);

// Crear controlador para cambiar de personaje
crear_funcionalidad(PROFUNDIDAD_CONTROLADORES, obj_cambiar_personaje);

// Configurar los datos del Hub World
configuracion_hub_world();