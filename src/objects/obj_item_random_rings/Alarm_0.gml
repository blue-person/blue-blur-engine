// Agregar los rings al contador
var cantidad_rings = choose(1, 5, 10);
jugador.rings += cantidad_rings;
jugador.cantidad_boost += 2 * cantidad_rings;

// Determinar sonido a reproducir
if (cantidad_rings == 10) {
	audio.reproducir_audio(snd_super_ring);
} else {
	audio.reproducir_audio_aleatorio([snd_ring_izquierdo, snd_ring_derecho]);
}