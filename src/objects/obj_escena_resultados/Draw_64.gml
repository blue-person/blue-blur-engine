// Banda superior
var banda_superior = parametros_bandas.superior;
draw_sprite_ext(banda_superior.sprite, 0, banda_superior.pos_x, banda_superior.pos_y, 1, 1, 0, c_white, 1);

// Banda inferior
var banda_inferior = parametros_bandas.inferior;
draw_sprite_ext(banda_inferior.sprite, 0, banda_inferior.pos_x, banda_inferior.pos_y, 1, 1, 0, c_white, 1);

// Titulo
var marco_titulo = parametros_titulo.marco;
var texto_titulo = parametros_titulo.texto;
draw_sprite_ext(marco_titulo.sprite, 0, marco_titulo.pos_x, marco_titulo.pos_y, 1, 0.6, 0, c_white, marco_titulo.transparencia);
draw_set_font(font_titulos);
textos.escritura_sombreada(texto_titulo.pos_x, texto_titulo.pos_y, texto_titulo.contenido, 2, texto_titulo.color);

// Definir la font para los subtitulos
draw_set_font(font_subtitulos);

// Tiempo
var subtitulo_tiempo = parametros_tiempo.titulo;
var texto_tiempo = parametros_tiempo.texto;
textos.escritura_sombreada(subtitulo_tiempo.pos_x, subtitulo_tiempo.pos_y, subtitulo_tiempo.contenido, 1, subtitulo_tiempo.color);
textos.escritura_sombreada(texto_tiempo.pos_x, texto_tiempo.pos_y, texto_tiempo.contenido, 1, texto_tiempo.color);

// Rings
var subtitulo_rings = parametros_rings.titulo;
var texto_rings = parametros_rings.texto;
textos.escritura_sombreada(subtitulo_rings.pos_x, subtitulo_rings.pos_y, subtitulo_rings.contenido, 1, subtitulo_rings.color);
textos.escritura_sombreada(texto_rings.pos_x, texto_rings.pos_y, texto_rings.contenido, 1, texto_rings.color);

// Cool
var subtitulo_cool = parametros_cool.titulo;
var texto_cool = parametros_cool.texto;
textos.escritura_sombreada(subtitulo_cool.pos_x, subtitulo_cool.pos_y, subtitulo_cool.contenido, 1, subtitulo_cool.color);
textos.escritura_sombreada(texto_cool.pos_x, texto_cool.pos_y, texto_cool.contenido, 1, texto_cool.color);

// Puntaje final
var subtitulo_final = parametros_final.titulo;
var texto_final = parametros_final.texto;
textos.escritura_sombreada(subtitulo_final.pos_x, subtitulo_final.pos_y, subtitulo_final.contenido, 1, subtitulo_final.color);

var puntaje_final = clamp(texto_final.contenido, texto_final.puntaje_min, texto_final.puntaje_max);
if (puntaje_final > 0) {
	var contenido_texto_final = string(puntaje_final);
	textos.escritura_sombreada(texto_final.pos_x, texto_final.pos_y, contenido_texto_final, 1, texto_final.color);
}

// Calificacion
var calificacion = parametros_calificacion;
draw_sprite_ext(calificacion.sprite, 0, calificacion.pos_x, calificacion.pos_y, calificacion.escala_x, calificacion.escala_y, 0, c_white, calificacion.transparencia);

// Boton para continuar
var icono_boton = controles.obtener_icono_boton("boton_salto");
draw_sprite_ext(icono_boton, 0, parametros_boton.pos_x, parametros_boton.pos_y, 1, 1, 0, c_white, parametros_boton.transparencia);