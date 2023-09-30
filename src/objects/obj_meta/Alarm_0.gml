activar_evento = 2;
effect_create_above(ef_ring, x, y, 2, c_white);

// Desactivar musica del nivel
audio.detener_todo();

// Activar los efectos de sonido y la transicion de pantalla
audio.reproducir_audio(snd_finalizar_nivel);
transicion.iniciar_efecto_basico("blanco", 0.05);
instance_create_depth(0, 0, -100, obj_pantalla_nivel_completado);