// Mostrar el objeto
draw_self();

// Mostrar el titulo del nivel encima del selector
var icono_boton = controles.obtener_icono_boton("boton_especial");
draw_sprite_ext(icono_boton, 0, x, boton.pos_y, 1, 1, 0, c_white, boton.transparencia);