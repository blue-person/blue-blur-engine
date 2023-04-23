obj_jugador.rings += 5;
obj_jugador.cantidad_boost += 10;

var efecto_sonido = choose(snd_ring_izquierdo, snd_ring_derecho);
audio_play_sound(efecto_sonido, 1, false);