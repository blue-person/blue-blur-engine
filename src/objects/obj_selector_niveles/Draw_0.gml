// Mostrar el selector de niveles
draw_self();

// Mostrar el titulo del nivel encima del selector
var primer_parrafo = titulo_nivel.primer_parrafo;
textos.escritura_simple(x, primer_parrafo.pos_y, primer_parrafo.contenido, font, fa_middle, fa_top, transparencia_iconos);

var segundo_parrafo = titulo_nivel.segundo_parrafo;
textos.escritura_simple(x, segundo_parrafo.pos_y, segundo_parrafo.contenido, font, fa_middle, fa_top, transparencia_iconos);

// Mostrar el icono del control
var boton = controles.obtener_icono_boton("boton_especial");
draw_sprite_ext(boton, 0, x, pos_y_boton, 1, 1, 0, c_white, transparencia_iconos - 0.1);