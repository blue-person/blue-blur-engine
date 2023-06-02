// Mostrar banda superior
draw_sprite_ext(spr_banda_superior, indice, 0, pos_y_barra_superior, 1, 1, 0, c_white, 1);;

// Mostrar banda inferior
draw_sprite_ext(spr_banda_inferior, indice, 0, pos_y_barra_inferior, 1, 1, 0, c_white, 1);;

// Mostrar el marco de Stage Clear
draw_sprite_ext(spr_marco_titulo, 0, 0, pos_y_titulo + 7, 1, 0.6, 0, c_white, transparencia_barra);

// Mostrar el texto de Stage Clear
draw_set_font(font_principal_cursiva);
dibujar_texto_sombreado(pos_x_titulo, pos_y_titulo + 3.5, "Stage  Clear", 2, color);

// Estipular el font para todos los demas textos
draw_set_font(font_principal_normal);

// Mostrar el 
dibujar_texto_sombreado(pos_x_texto_tiempo, pos_y_texto_tiempo, "Time Bonus", 1, color);
dibujar_texto_sombreado(pos_x_puntaje_tiempo, pos_y_texto_tiempo, global.puntaje_tiempo, 1, color);

dibujar_texto_sombreado(pos_x_texto_rings, pos_y_texto_rings, "Ring Bonus", 1, color);
dibujar_texto_sombreado(pos_x_puntaje_rings, pos_y_texto_rings, global.puntaje_rings, 1, color);

dibujar_texto_sombreado(pos_x_texto_cool, pos_y_texto_cool, "Cool Bonus", 1, color);
dibujar_texto_sombreado(pos_x_puntaje_cool, pos_y_texto_cool, global.puntaje_cool, 1, color);

// Mostrar el puntaje final
if (global.puntaje_final < puntaje_maximo) {
	texto_puntaje_final = string(global.puntaje_final);
} else {
	texto_puntaje_final = string(puntaje_maximo);
}
dibujar_texto_sombreado(pos_x_puntaje_final, pos_y_puntaje_final, ("Score   " + texto_puntaje_final), 1, color);

// Mostrar el boton para terminar la pantalla de nivel completado
if (fase_animacion == 11) {
	var icono_boton = control.obtener_icono_boton("boton_salto");
	draw_sprite_ext(icono_boton, 0, 428, 222, 1, 1, 0, c_white, transparencia_boton_continuar);
}