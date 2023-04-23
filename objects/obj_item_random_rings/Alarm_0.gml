var cantidad_rings = choose(1, 5, 10);
obj_jugador.rings += cantidad_rings;
obj_jugador.cantidad_boost += 2 * cantidad_rings;

if (cantidad_rings == 10) {
	audio_play_sound(snd_super_ring, 1, false);
} else {
	var efecto_sonido = choose(snd_ring_izquierdo, snd_ring_derecho);
    audio_play_sound(efecto_sonido, 1, false);
}