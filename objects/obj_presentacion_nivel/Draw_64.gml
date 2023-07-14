var mitad_ancho_resolucion = pantalla.obtener_ancho() / 2;
var mitad_altura_resolucion =  pantalla.obtener_altura() / 2;
var descripcion_nivel = nivel.obtener_descripcion();

draw_sprite_ext(spr_pantalla_gris, 0, mitad_ancho_resolucion, mitad_altura_resolucion, 1, 1, 0, c_white, transparencia_transicion_gris);
draw_sprite_ext(spr_transicion_barra_diagonal, indice, x, y, 1, 1, angulo_salida, c_white, 1);

draw_sprite_ext(spr_marco_titulo, 0, x, pos_y_nombre - 5, 1, 1, 0, c_white, transparencia_barra);
draw_set_font(font_principal_cursiva);
texto.graficacion_sombreada(pos_x_nombre, pos_y_nombre + 5, descripcion_nivel.nombre, 2, color, c_white, 1, 1);

draw_sprite_ext(spr_marco_subtitulo, 0, x, pos_y_mision, 1.5, 1, 0, c_white, transparencia_barra);
draw_set_font(font_principal_cursiva);
texto.graficacion_sombreada(pos_x_mision, pos_y_mision + 2, descripcion_nivel.objetivo, 2, color, c_white, 0.5, 0.5);

draw_sprite_ext(spr_pantalla_negra, 0, mitad_ancho_resolucion, mitad_altura_resolucion, 1, 1, 0, c_white, transparencia_transicion_negra);
draw_sprite_ext(spr_pantalla_gris, 0, mitad_ancho_resolucion, mitad_altura_resolucion, 1, 1, 0, c_white, trasnparencia_invisible);