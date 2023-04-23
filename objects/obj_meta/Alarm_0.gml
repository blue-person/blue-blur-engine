activar_evento = 2;
effect_create_above(ef_ring, x, y, 2, c_white);

// Desactivar musica del nivel
if (instance_exists(obj_reproductor_musica)) {
    instance_destroy(obj_reproductor_musica);
}
audio_stop_all();

// Activar los efectos de sonido y la transicion de pantalla
audio_play_sound(snd_finalizar_nivel, 1, false);
iniciar_transicion_simple("blanco", 0.05);
instance_create_depth(0, 0, -100, obj_pantalla_nivel_completado);