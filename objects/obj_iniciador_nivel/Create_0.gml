// Crear jugador
instance_create_depth(x, y, -1, obj_jugador);

// Crear camara
instance_create_depth(x, x, 0, obj_camara);
obj_camara.establecer_enfoque(obj_jugador);

// Pantalla de presentacion del nivel
if (room != rm_hub_world) {
	instance_create_depth(0, 0, -100, obj_presentacion_nivel);
	// La HUD normal se crea al momento de finalizar la presentacion del nivel.
	// Especificamente, se hace en obj_animacion_personaje
}

// Iniciar controladores esenciales
instance_create_depth(0, 0, 0, obj_cronometro);
instance_create_depth(0, 0, 0, obj_determinar_texto_rings);
instance_create_depth(0, 0, 0, obj_determinar_texto_vidas);

// Crear controladores de elementos decorativos
instance_create_depth(0, 0, 0, obj_fondo_escenario);