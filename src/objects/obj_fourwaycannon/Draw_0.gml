draw_self();
draw_sprite_ext(spr_aros_derecha_fourwaycannon, direccion_imagen, x, y, 1, 1, angulo_lados, c_white, 1);
draw_sprite_ext(spr_aros_izquierda_fourwaycannon, direccion_imagen, x, y, 1, 1, angulo_lados, c_white, 1);
draw_sprite_ext(spr_aros_abajo_fourwaycannon, direccion_imagen, x, y, 1, 1, angulo_lados, c_white, 1);
draw_sprite_ext(spr_aros_arriba_fourwaycannon, direccion_imagen, x, y, 1, 1, angulo_lados, c_white, 1);

var tecla_presionada = (controles.boton_mantenido("boton_arriba") or controles.boton_mantenido("boton_abajo") or controles.boton_mantenido("boton_derecha") or controles.boton_mantenido("boton_izquierda"));
if (place_meeting(x, y, obj_jugador) and (obj_jugador.accion == 21) and tecla_presionada) {
	if (direccion_imagen < 6) {
		direccion_imagen++;
	}
} else {
    if (direccion_imagen > 0) {
		direccion_imagen--;
	} else {
        direccion_imagen = 0;
        angulo_lados = 0;
    }
}