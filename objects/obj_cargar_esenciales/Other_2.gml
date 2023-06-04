// Establecer valores y elementos
establecer_variables_jugador();
establecer_variables_niveles();
establecer_particulas();

// Cargar datos esenciales
cargar_gestores();
cargar_fonts();
cargar_constantes();
audio.cargar_audios();
pantalla.configuracion_inicial();

// Crear objetos controladores
instance_create_depth(x, y, 0, obj_debug);
instance_create_depth(x, y, 0, obj_controlador_checkpoint);

// Forzar que todas las capas se dibujen a una profundidad de 0
layer_force_draw_depth(true, 0);