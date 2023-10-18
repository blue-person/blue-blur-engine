// Dibujar las particulas del jugador
crear_particulas_jugador();

// Ajustar parametros del objeto
image_angle = angulo;
image_xscale = direccion_horizontal;

// Dibujar sprites
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, image_angle, c_white, image_alpha);