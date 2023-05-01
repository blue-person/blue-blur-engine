var modo_pantalla_actual = window_get_fullscreen();
window_set_fullscreen(!modo_pantalla_actual);
window_set_size(Pantalla.RESOLUCION_HORIZONTAL * zoom, Pantalla.RESOLUCION_VERTICAL  * zoom);