// Mostrar el selector de niveles
draw_self();

// Mostrar el titulo del nivel encima del selector
var pos_y = y - 48;
texto.graficacion_simple(x, pos_y - 12, titulo_nivel[0], font_requerida, fa_middle, fa_top, transparencia_titulo);
texto.graficacion_simple(x, pos_y, titulo_nivel[1], font_requerida, fa_middle, fa_top, transparencia_titulo);