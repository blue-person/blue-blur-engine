// Establecer valores y elementos
establecer_variables_jugador();
establecer_variables_niveles();
establecer_particulas();

// Cargar los audios del juegos
audio.cargar_audios();

// Configurar la pantalla
pantalla.configuracion_inicial();

// Forzar que todas las capas se dibujen a una profundidad de 0
layer_force_draw_depth(true, 0);