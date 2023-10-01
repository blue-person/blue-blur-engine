// Crear jugador
instance_create_depth(x, y, PROFUNDIDAD_JUGADOR, global.personaje_actual);

// Crear camara
instance_create_depth(x, y, PROFUNDIDAD_CONTROLADORES, obj_camara);
camara.establecer_enfoque(jugador);

// Mostrar el Stage Title Card
instance_create_depth(0, 0, PROFUNDIDAD_INTERFAZ, obj_presentacion_nivel);

// Iniciar controladores esenciales
crear_funcionalidad(PROFUNDIDAD_CONTROLADORES, obj_cronometro);

// Ocultar el HUD mientras se realiza la animacion del nivel
instance_create_depth(0, 0, PROFUNDIDAD_INTERFAZ, obj_hud);
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