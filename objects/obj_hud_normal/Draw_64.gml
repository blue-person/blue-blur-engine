if (mostrar_en_pantalla) {
	var cantidad_tiempo = obj_controlador_tiempo.texto_tiempo;
	var cantidad_rings = obj_determinar_texto_rings.texto_rings;
	var cantidad_vidas = obj_determinar_texto_vidas.texto_vidas;
	var cantidad_boost = obj_jugador.cantidad_boost;
	
	// Tiempo
	draw_sprite(spr_contador_tiempo, 0, pos_x_tiempo, pos_y_tiempo);
	dibujar_texto_simple(pos_x_tiempo + 30, pos_y_tiempo + 5, cantidad_tiempo, font_numerica, fa_top, fa_top, transparencia);
	
	// Rings
	draw_sprite(spr_contador_rings, 0, pos_x_rings, pos_y_rings);
	dibujar_texto_simple(pos_x_rings + 30, pos_y_rings + 3, cantidad_rings, font_numerica, fa_top, fa_top, transparencia);
	
	// Vidas
    draw_sprite(hud_vidas, 0, pos_x_vidas, pos_y_vidas);
	dibujar_texto_simple(pos_x_vidas + 30, pos_y_vidas + 3, cantidad_vidas, font_numerica, fa_top, fa_top, transparencia);
	
	// Boost
	draw_sprite(spr_barra_boost, 0, pos_x_boost, pos_y_boost);
    if (cantidad_boost > 0) {
		draw_line_width_colour(pos_x_boost + 7, pos_y_boost + 7.5, pos_x_boost + 7 + (1.4 * cantidad_boost), pos_y_boost + 7.5, 1, color_boost_a, color_boost_b);
        draw_line_width_colour(pos_x_boost + 8, pos_y_boost + 8.5, pos_x_boost + 8 + (1.4 * cantidad_boost), pos_y_boost + 8.5, 1, color_boost_a, color_boost_b);
    }
}