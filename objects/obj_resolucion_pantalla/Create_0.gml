// Declarar variables
zoom = 1;

// Ajustar la resolucion y el tamaño
display_set_gui_size(Pantalla.RESOLUCION_HORIZONTAL, Pantalla.RESOLUCION_VERTICAL );
surface_resize(application_surface, Pantalla.RESOLUCION_HORIZONTAL, Pantalla.RESOLUCION_VERTICAL );
window_set_size(Pantalla.RESOLUCION_HORIZONTAL, Pantalla.RESOLUCION_VERTICAL );
window_center();