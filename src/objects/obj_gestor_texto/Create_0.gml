// Constantes
#macro MAPEO_CARACTERES "abcdefghijklmnopqrstuvwxyz1234567890:."

// Variables
font_azul = font_add_sprite_ext(spr_font_azul, MAPEO_CARACTERES, true, 0);
font_gris = font_add_sprite_ext(spr_font_gris, MAPEO_CARACTERES, true, 0);
font_negro = font_add_sprite_ext(spr_font_negro, MAPEO_CARACTERES, true, 0);
font_dorado = font_add_sprite_ext(spr_font_dorado, MAPEO_CARACTERES, true, 0);

// Metodos
obtener_font_azul = function() {
	return font_azul;
}

obtener_font_gris = function() {
	return font_gris;
}

obtener_font_negro = function() {
	return font_negro;
}

obtener_font_dorado = function() {
	return font_dorado;
}

graficacion_simple = function(pos_x, pos_y, mensaje, font = -1, alineacion_hor = fa_left, alineacion_ver = fa_top, transparencia = 1) {
	// Graficar el texto solicitado
	draw_set_font(font);
	draw_set_halign(alineacion_hor);
	draw_set_valign(alineacion_ver);
	draw_text_color(pos_x, pos_y, mensaje, c_white, c_white, c_white, c_white, transparencia);
	
	// Reestablecer valores predeterminados
	draw_set_font(-1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

graficacion_avanzada = function(pos_x_1, pos_y_1, mensaje, magnitud_mensaje, color_bordes, color_texto, escala_x, escala_y) {
	// Variables
	var color_inicial_dibujo = draw_get_color();
	var pos_x_2 = -magnitud_mensaje;
	var pos_y_2 = -magnitud_mensaje;
	
	// Ajustar color
	draw_set_color(color_bordes);
	
	// Realizar calculos
	repeat (1 + (magnitud_mensaje * 2)) {
	  repeat (1 + (magnitud_mensaje * 2)) {
        if (pos_x_2 == 0) and (pos_y_2 == 0) {
            pos_x_2++;
            continue;
        } else {
		    draw_text_transformed(pos_x_1 + pos_x_2, pos_y_1 + pos_y_2, string_hash_to_newline(mensaje), escala_x, escala_y, 0);
	        pos_x_2++;
		}
	  }
	  pos_x_2 = -magnitud_mensaje;
      pos_y_2++;
	}
	
	// Graficar el texto
	draw_set_color(color_inicial_dibujo);
	draw_text_transformed_color(pos_x_1, pos_y_1, string_hash_to_newline(mensaje), escala_x, escala_y, 0, color_texto, color_texto, color_texto, color_texto, 1);
}

graficacion_sombreada = function(pos_x, pos_y, mensaje, magnitud_sombreado = 1, color_bordes = c_white, color_texto = c_white, escala_x = 1, escala_y = 1) {
	// Graficar la sombra del texto
	self.graficacion_avanzada(pos_x + 2,  pos_y + 2, mensaje, magnitud_sombreado, c_black, c_black, escala_x, escala_y);
	
	// Graficar el texto
	self.graficacion_avanzada(pos_x,  pos_y, mensaje, magnitud_sombreado, color_bordes, color_texto, escala_x, escala_y);
}