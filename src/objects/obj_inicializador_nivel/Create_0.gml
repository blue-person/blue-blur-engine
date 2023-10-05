// Crear jugador
instance_create_depth(x, y, PROFUNDIDAD_JUGADOR, global.personaje_actual);

// Crear camara
instance_create_depth(x, y, PROFUNDIDAD_CONTROLADORES, obj_camara);
camara.establecer_enfoque(jugador);

// Iniciar controladores esenciales
crear_funcionalidad(PROFUNDIDAD_CONTROLADORES, obj_cronometro);

// Ocultar el HUD mientras se realiza la animacion del nivel
crear_funcionalidad(PROFUNDIDAD_INTERFAZ, obj_hud);
hud.establecer_visibilidad_elementos(true, true, true, true);
hud.ocultar();

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

// Mostrar el Stage Title Card
crear_funcionalidad(PROFUNDIDAD_INTERFAZ, obj_escena_presentacion);