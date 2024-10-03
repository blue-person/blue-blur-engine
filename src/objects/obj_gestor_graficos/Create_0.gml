// Variables
modo_pantalla = "ventana";
resolucion_horizontal = 456;
resolucion_vertical = 256;
factor_escala = 2;

// Metodos
obtener_ancho = function() {
	return resolucion_horizontal;
}

obtener_altura = function() {
	return resolucion_vertical;
}

obtener_modo_pantalla = function() {
	return modo_pantalla;
}

configuracion_inicial = function() {
	// Variables
	var ancho_ventana = resolucion_horizontal * factor_escala;
	var altura_ventana = resolucion_vertical * factor_escala;
	
	// Configuracion grafica
	display_reset(2, true);
	
	// Configuracion de la GUI
	display_set_gui_size(resolucion_horizontal, resolucion_vertical);
	surface_resize(application_surface, resolucion_horizontal, resolucion_vertical);
	
	// Configuracion de la ventana
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
	var ancho_ventana = resolucion_horizontal * factor_escala;
	var altura_ventana = resolucion_vertical * factor_escala;
	self.cambiar_modo_pantalla("ventana", true, cr_default, ancho_ventana, altura_ventana);
}

iniciar_modo_pantalla_completa = function() {
	var ancho_ventana = display_get_width();
	var altura_ventana = display_get_height();
	self.cambiar_modo_pantalla("pantalla_completa", false, cr_none, ancho_ventana, altura_ventana);
}