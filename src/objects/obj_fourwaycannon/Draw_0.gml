// Dibujar el centro del Four Way Cannon
draw_self();

// Dibujar aros del tubo
draw_sprite_ext(spr_aros_derecha_fourwaycannon, direccion_apuntado, x, y, 1, 1, angulo_tubos, c_white, 1);
draw_sprite_ext(spr_aros_izquierda_fourwaycannon, direccion_apuntado, x, y, 1, 1, angulo_tubos, c_white, 1);
draw_sprite_ext(spr_aros_abajo_fourwaycannon, direccion_apuntado, x, y, 1, 1, angulo_tubos, c_white, 1);
draw_sprite_ext(spr_aros_arriba_fourwaycannon, direccion_apuntado, x, y, 1, 1, angulo_tubos, c_white, 1);