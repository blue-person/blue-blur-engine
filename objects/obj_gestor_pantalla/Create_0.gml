// Constantes
#macro RESOLUCION_HORIZONTAL 456
#macro RESOLUCION_VERTICAL 256
#macro ZOOM 2

// Variables
modo_pantalla = "pantalla_completa";

// Metodos
obtener_ancho = function() {
	return RESOLUCION_HORIZONTAL;
}

obtener_altura = function() {
	return RESOLUCION_VERTICAL;
}

obtener_zoom = function() {
	return ZOOM;
}

establecer_modo_pantalla = function(modo_pantalla) {
	self.modo_pantalla = modo_pantalla;
}

obtener_modo_pantalla = function() {
	return modo_pantalla;
}

configuracion_inicial = function() {
	// Variables
	var ancho_ventana = self.obtener_ancho() * self.obtener_zoom();
	var altura_ventana = self.obtener_altura() * self.obtener_zoom();
	
	// Configuracion
	display_set_gui_size(self.obtener_ancho(), self.obtener_altura());
	surface_resize(application_surface, ancho_ventana, altura_ventana);
	window_set_size(ancho_ventana, altura_ventana);
	window_center();
}

cambiar_modo_pantalla = function(modo_pantalla, mostrar_bordes, ancho_ventana, altura_ventana) {
	if (self.obtener_modo_pantalla() != modo_pantalla) {
        // Cambio de configuracion
		self.establecer_modo_pantalla(modo_pantalla);
	
		// Cambio del tamaño
		window_set_showborder(mostrar_bordes);
		window_set_size(ancho_ventana, altura_ventana);
		window_center();
    }
}

iniciar_modo_ventana = function() {
	var ancho_ventana = self.obtener_ancho() * self.obtener_zoom();
	var altura_ventana = self.obtener_altura() * self.obtener_zoom();
	cambiar_modo_pantalla("ventana", true, ancho_ventana, altura_ventana);
}

iniciar_modo_pantalla_completa = function() {
	var ancho_ventana = display_get_width();
	var altura_ventana = display_get_height();
	cambiar_modo_pantalla("pantalla_completa", false, ancho_ventana, altura_ventana);
}