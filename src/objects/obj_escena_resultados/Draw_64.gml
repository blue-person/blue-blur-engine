// Mostrar banda superior
draw_sprite_ext(sprite.superior, 0, 0, pos_y_barra_superior, 1, 1, 0, c_white, 1);

// Mostrar banda inferior
draw_sprite_ext(sprite.inferior, 0, 0, pos_y_barra_inferior, 1, 1, 0, c_white, 1);

// Mostrar el marco de Stage Clear
draw_sprite_ext(spr_marco_titulo, 0, 0, pos_y_titulo + 7, 1, 0.6, 0, c_white, parametros_bandas.transparencia);

// Mostrar el textos de Stage Clear
draw_set_font(font_principal_cursiva);
textos.escritura_sombreada(pos_x_titulo, pos_y_titulo + 3.5, "Stage  Clear", 2, color_font);

// Estipular el font para todos los demas textos
draw_set_font(font_principal_normal);

// Mostrar el 
textos.escritura_sombreada(pos_x_texto_tiempo, pos_y_texto_tiempo, "Time Bonus", 1, color_font);
textos.escritura_sombreada(pos_x_puntaje_tiempo, pos_y_texto_tiempo, nivel.puntaje.tiempo, 1, color_font);

textos.escritura_sombreada(pos_x_texto_rings, pos_y_texto_rings, "Ring Bonus", 1, color_font);
textos.escritura_sombreada(pos_x_puntaje_rings, pos_y_texto_rings, nivel.puntaje.rings, 1, color_font);

textos.escritura_sombreada(pos_x_texto_cool, pos_y_texto_cool, "Cool Bonus", 1, color_font);
textos.escritura_sombreada(pos_x_puntaje_cool, pos_y_texto_cool, nivel.puntaje.cool, 1, color_font);

// Mostrar el puntaje final
var texto_puntaje_final = "";
if (nivel.obtener_puntaje_final() < puntaje_maximo) {
	texto_puntaje_final = string(nivel.obtener_puntaje_final());
} else {
	texto_puntaje_final = string(puntaje_maximo);
}
textos.escritura_sombreada(pos_x_puntaje_final, pos_y_puntaje_final, ("Score   " + texto_puntaje_final), 1, color_font);

// Mostrar el boton para terminar la pantalla de nivel completado
if (fase_animacion == 11) {
	var icono_boton = controles.obtener_icono_boton("boton_salto");
	draw_sprite_ext(icono_boton, 0, 428, 222, 1, 1, 0, c_white, transparencia_boton_continuar);
}