// Modificar parametros de los sprites
crear_particulas_jugador();
gestionar_indice_sprites_jugador();
gestionar_angulo_sprites_jugador();

// Dibujar sprites
draw_sprite_ext(sprite_index, image_index, x, y, direccion_horizontal, image_yscale, image_angle, c_white, image_alpha);