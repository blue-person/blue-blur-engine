// Configurar variables
fase_evento = 3;

// Establecer efectos
audio.detener_todo();
audio.reproducir_audio(snd_finalizar_nivel);
effect_create_above(ef_ring, x, y, 2, c_white);

// Iniciar transicion a los resultados
transiciones.iniciar_efecto_basico("blanco", 0.05);
crear_funcionalidad(Profundidades.Interfaz, obj_escena_resultados);