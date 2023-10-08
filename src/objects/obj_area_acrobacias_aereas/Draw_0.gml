// Mostrar el objeto
draw_self();

// Mostrar el titulo del nivel encima del selector
var boton = controles.obtener_icono_boton("boton_salto");
draw_sprite_ext(boton, 0, x, y - 48, 1, 1, 0, c_white, transparencia_icono);