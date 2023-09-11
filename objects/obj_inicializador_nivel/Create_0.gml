// Crear jugador
instance_create_depth(x, y, PROFUNDIDAD_JUGADOR, obj_jugador);

// Crear camara
instance_create_depth(x, y, PROFUNDIDAD_CONTROLADORES, obj_camara);
obj_camara.establecer_enfoque(obj_jugador);

// Pantalla de presentacion del nivel
if (room != rm_hub_world) {
	instance_create_depth(0, 0, -100, obj_presentacion_nivel);
	// La HUD normal se crea al momento de finalizar la presentacion del nivel.
	// Especificamente, se hace en obj_animacion_personaje
}

// Iniciar controladores esenciales
crear_funcionalidad(PROFUNDIDAD_CONTROLADORES, obj_cronometro);

// Configurar el nivel actual
switch (room) {
	case rm_practice_zone:
		configuracion_practice_zone();
		break;
	case rm_emerald_valley:
		configuracion_emerald_valley();
		break;
	case rm_groovy_badlands:
		configuracion_groovy_badlands();
        break;
	case rm_luminous_bingo:
		configuracion_luminous_bingo();
		break;
	case rm_mining_mayhem:
		configuracion_mining_mayhem();
		break;
}