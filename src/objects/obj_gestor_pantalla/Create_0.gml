// Constantes
#macro RESOLUCION_HORIZONTAL 456
#macro RESOLUCION_VERTICAL 256
#macro VELOCIDAD_JUEGO 60
#macro FACTOR_ESCALA 2

// Variables
modo_pantalla = "ventana";

// Metodos
obtener_ancho = function() {
	return RESOLUCION_HORIZONTAL;
}

obtener_altura = function() {
	return RESOLUCION_VERTICAL;
}

obtener_velocidad_juego = function() {
	return VELOCIDAD_JUEGO;
}

obtener_factor_escala = function() {
	return FACTOR_ESCALA;
}

obtener_modo_pantalla = function() {
	return modo_pantalla;
}

configurar_graficos = function(nivel_antialiasing, permitir_vsync) {
	display_reset(nivel_antialiasing, permitir_vsync);
}

configurar_velocidad = function(velocidad_requerida) {
	// Variables
	var velocidad_actual = game_get_speed(gamespeed_fps);
	
	// Configurar FPS
	if (velocidad_actual != velocidad_requerida) {
	    game_set_speed(velocidad_requerida, gamespeed_fps);
	}
}

configuracion_inicial = function() {
	// Variables
	var ancho_ventana = RESOLUCION_HORIZONTAL * FACTOR_ESCALA;
	var altura_ventana = RESOLUCION_VERTICAL * FACTOR_ESCALA;
	
	// Configuracion
	self.configurar_graficos(2, false);
	self.configurar_velocidad(VELOCIDAD_JUEGO);
	display_set_gui_size(RESOLUCION_HORIZONTAL, RESOLUCION_VERTICAL);
	surface_resize(application_surface, RESOLUCION_HORIZONTAL, RESOLUCION_VERTICAL);
	window_set_caption(TITULO_JUEGO);
	window_set_size(ancho_ventana, altura_ventana);
	window_center();
}

cambiar_modo_pantalla = function(modo_pantalla, mostrar_bordes, simbolo_cursor, ancho_ventana, altura_ventana) {
	// Cambio de configuracion
	self.modo_pantalla = modo_pantalla;
	window_set_showborder(mostrar_bordes);
	window_set_cursor(simbolo_cursor);
	
	// Cambio del tamaño
	window_set_size(ancho_ventana, altura_ventana);
	window_center();
}

iniciar_modo_ventana = function() {
	var ancho_ventana = RESOLUCION_HORIZONTAL * FACTOR_ESCALA;
	var altura_ventana = RESOLUCION_VERTICAL * FACTOR_ESCALA;
	self.cambiar_modo_pantalla("ventana", true, cr_default, ancho_ventana, altura_ventana);
}

iniciar_modo_pantalla_completa = function() {
	var ancho_ventana = display_get_width();
	var altura_ventana = display_get_height();
	self.cambiar_modo_pantalla("pantalla_completa", false, cr_none, ancho_ventana, altura_ventana);
}