// Transicion morada
var transicion_morada = parametros_transiciones.morada;
draw_sprite_ext(transicion_morada.sprite, 0, parametros_transiciones.pos_x, parametros_transiciones.pos_y, 1, 1, 0, c_white, transicion_morada.transparencia);

// Barra diagonal
var barra = parametros_barra_diagonal;
draw_sprite_ext(barra.sprite, 0, barra.pos_x, barra.pos_y, 1, 1, barra.angulo, c_white, 1);

// Marco del nombre del nivel
var marco_nombre = parametros_nombre_nivel.marco;
draw_sprite_ext(marco_nombre.sprite, 0, marco_nombre.pos_x, marco_nombre.pos_y, 1, 1, 0, c_white, transparencia_marcos);

// Texto del nombre del nivel
var texto_nombre = parametros_nombre_nivel.texto;
draw_set_font(texto_nombre.font);
textos.escritura_sombreada(texto_nombre.pos_x, texto_nombre.pos_y, texto_nombre.contenido, 2, texto_nombre.color, c_white, 1, 1);

// Marco del objetivo del nivel
var marco_objetivo = parametros_objetivo_nivel.marco;
draw_sprite_ext(marco_objetivo.sprite, 0, marco_objetivo.pos_x, marco_objetivo.pos_y, 1, 1, 0, c_white, transparencia_marcos);

// Texto del objetivo del nivel
var texto_objetivo = parametros_objetivo_nivel.texto;
draw_set_font(texto_objetivo.font);
textos.escritura_sombreada(texto_objetivo.pos_x, texto_objetivo.pos_y, texto_objetivo.contenido, 2, texto_objetivo.color, c_white, 0.5, 0.5);

// Transicion negra
var transicion_negra = parametros_transiciones.negra;
draw_sprite_ext(transicion_negra.sprite, 0, parametros_transiciones.pos_x, parametros_transiciones.pos_y, 1, 1, 0, c_white, transicion_negra.transparencia);

// Animacion del personaje
if (animacion_personaje > 0) {
	var tipo_animacion = nivel.obtener_permiso_reaparicion() ? parametros_personaje.animacion_normal : parametros_personaje.animacion_corriendo;
	parametros_personaje.indice_actual += tipo_animacion.velocidad;
	draw_sprite_ext(tipo_animacion.sprite, parametros_personaje.indice_actual, parametros_personaje.pos_x, parametros_personaje.pos_y, 1, 1, 0, c_white, transicion_morada.transparencia);
}