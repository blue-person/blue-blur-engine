function dibujar_texto_simple(pos_x, pos_y, mensaje, font = -1, alineacion_hor = fa_left, alineacion_ver = fa_top, transparencia = 1) {
	// Dibujar texto solicitado
	draw_set_font(font);
	draw_set_halign(alineacion_hor);
	draw_set_valign(alineacion_ver);
	draw_text_color(pos_x, pos_y, mensaje, c_white, c_white, c_white, c_white, transparencia);
	
	// Regresar a valores predeterminados
	draw_set_font(-1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}