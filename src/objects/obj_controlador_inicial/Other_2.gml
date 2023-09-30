// Establecer valores
global.personaje_actual = "Sonic";
global.vidas_restantes = 3;

// Cargar los audios del juegos
audio.cargar_audios();

// Configurar la pantalla
pantalla.configuracion_inicial();

// Forzar que todas las capas se dibujen a una profundidad de 0
layer_force_draw_depth(true, 0);