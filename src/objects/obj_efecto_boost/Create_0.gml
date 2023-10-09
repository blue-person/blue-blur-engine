if ((obj_jugador.cantidad_boost <= 0) or (obj_jugador.zona_superada)) {
	instance_destroy();
	exit;
}

// Declaracion de variables
image_speed = 0.4;
depth = Profundidades.Jugador - 1;
image_alpha = 0;
image_angle = point_direction(obj_jugador.x_inicial, obj_jugador.y_inicial, x, y);

tiempo_impulso_aereo = 240;
activar_efecto = true;

// Gestion de la velocidad
obj_jugador.velocidad_horizontal = obj_jugador.limite_velocidad_horizontal * obj_jugador.direccion_horizontal;

// Crear los efectos visuales y de sonido
instance_create_depth(obj_jugador.x, obj_jugador.y, -2, obj_explosion_boost);
audio.reproducir_audio(snd_inicio_boost);
audio.reproducir_audio(snd_bucle_boost);
audio.reproducir_audio(snd_velocidad_sonica, Prioridades.Sonidos, true);
audio.reproducir_audio_aleatorio(obj_jugador.audios_grito_boost, false);

// Gestion de la vibracion
efecto_haptico_colision();