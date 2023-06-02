// Establecer valores y elementos
establecer_variables_generales();
establecer_variables_jugador();
establecer_variables_niveles();
establecer_constantes();
establecer_particulas();

// Cargar datos esenciales
cargar_fonts();
cargar_gestores();
cargar_constantes();
cargar_grupos_sonido();

// Crear objetos controladores
instance_create_depth(x, y, 0, obj_resolucion_pantalla);
instance_create_depth(x, y, 0, obj_controlador_checkpoint);

// Forzar que todas las capas se dibujen a una profundidad de 0
layer_force_draw_depth(true, 0);