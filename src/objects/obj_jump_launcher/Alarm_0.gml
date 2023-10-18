// Reproducir efectos de sonido
audio.reproducir_audio(snd_fourwaycannon_disparo);

// Determinar la direccion del jugador
if ((angulo_disparo <= 90) and (angulo_disparo >= -90)) {
	jugador.direccion_horizontal = 1;
} else {
	jugador.direccion_horizontal = -1;
}
	
// Modificar parametros del jugador
jugador.accion = 35.2;
jugador.velocidad_horizontal = dcos(angulo_disparo) * cantidad_fuerza;
jugador.velocidad_vertical = -dsin(angulo_disparo) * cantidad_fuerza;