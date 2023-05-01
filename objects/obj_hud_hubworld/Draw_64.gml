if (mostrar_en_pantalla) {
	var icono_boton = input_binding_get_icon(input_binding_get("boton_especial"));
	var cantidad_vidas = obj_determinar_texto_vidas.texto_vidas;
	
	// Vidas
	draw_sprite(hud_vidas, 0, pos_x_vidas, pos_y_vidas);
	dibujar_texto_simple(pos_x_vidas + 30, pos_y_vidas + 3, cantidad_vidas, font_numerica, fa_top, fa_top);
	
	// Boton de cambio de personaje
	draw_sprite_ext(icono_boton, 0, pos_x_controles, pos_y_controles + 35, 1, 1, 0, c_white, transparencia);
	
	// Icono de cambio de personaje
	draw_sprite_ext(spr_cambiar_personajes, 0, pos_x_controles + 35, pos_y_controles + 35, 1, 1, 0, c_white, transparencia);
}