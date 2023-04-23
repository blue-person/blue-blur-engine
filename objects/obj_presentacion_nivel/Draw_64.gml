var mitad_ancho_resolucion = ANCHO_RESOLUCION / 2;
var mitad_altura_resolucion = ALTURA_RESOLUCION / 2;

draw_sprite_ext(spr_pantalla_gris, 0, mitad_ancho_resolucion, mitad_altura_resolucion, 1, 1, 0, c_white, transparencia_transicion_gris);
draw_sprite_ext(spr_transicion_barra_diagonal, indice, x, y, 1, 1, angulo_salida, c_white, 1);

draw_sprite_ext(spr_marco_titulo, 0, x, pos_y_nombre - 5, 1, 1, 0, c_white, transparencia_barra);
draw_set_font(font_titulo);
dibujar_texto_sombreado(pos_x_nombre, pos_y_nombre, global.nombre_nivel, 2, color);

draw_set_font(font_subtitulo);
draw_sprite_ext(spr_marco_subtitulo, 0, x, pos_y_mision, 1.5, 1, 0, c_white, transparencia_barra);
dibujar_texto_sombreado(pos_x_mision, pos_y_mision + 1, global.objetivo_nivel, 2, color);

draw_sprite_ext(spr_pantalla_negra, 0, mitad_ancho_resolucion, mitad_altura_resolucion, 1, 1, 0, c_white, transparencia_transicion_negra);
draw_sprite_ext(spr_pantalla_gris, 0, mitad_ancho_resolucion, mitad_altura_resolucion, 1, 1, 0, c_white, trasnparencia_invisible);