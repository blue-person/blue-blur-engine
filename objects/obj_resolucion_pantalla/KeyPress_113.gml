var modo_pantalla_actual = window_get_fullscreen();
window_set_fullscreen(!modo_pantalla_actual);
window_set_size(ANCHO_RESOLUCION * zoom, ALTURA_RESOLUCION * zoom);