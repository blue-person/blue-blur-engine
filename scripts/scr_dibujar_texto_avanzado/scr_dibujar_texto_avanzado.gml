function transformar_texto(pos_x_1, pos_y_1, texto, magnitud_texto, color_bordes, color_texto, escala_x, escala_y) {
	var color_inicial_dibujo = draw_get_color();
	var pos_x_2 = -magnitud_texto;
	var pos_y_2 = -magnitud_texto;
	
	draw_set_color(color_bordes);

	repeat (1 + (magnitud_texto * 2)) {
	  repeat (1 + (magnitud_texto * 2)) {
        if (pos_x_2 == 0) and (pos_y_2 == 0) {
            pos_x_2++;
            continue;
        }
   
	    draw_text_transformed(pos_x_1 + pos_x_2, pos_y_1 + pos_y_2, string_hash_to_newline(texto), escala_x, escala_y, 0);
        pos_x_2++;
	  }
      pos_y_2++;
	  pos_x_2 = -magnitud_texto;
	}
	draw_set_color(color_inicial_dibujo);
	draw_text_transformed_color(pos_x_1, pos_y_1, string_hash_to_newline(texto), escala_x, escala_y, 0, color_texto, color_texto, color_texto, color_texto, 1);
}

function dibujar_texto_sombreado(pos_x, pos_y, texto, magnitud_sombreado = 1, color_bordes = c_white, color_texto = c_white, escala_x = 1, escala_y = 1) {
	// Dibujar la sombra del texto
	transformar_texto(pos_x + 2,  pos_y + 2, texto, magnitud_sombreado, c_black, c_black, escala_x, escala_y);
	
	// Dibujar el texto
	transformar_texto(pos_x,  pos_y, texto, magnitud_sombreado, color_bordes, color_texto, escala_x, escala_y);
}