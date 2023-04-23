if (indice_sprite > 998) {
    indice_sprite = 0;
}

if (fotograma >= 1) {
    fotograma = 0;
    ++indice_sprite;
}

if (fotograma <= -1) {
    fotograma = 0;
    --indice_sprite;
}

draw_sprite_ext(spr_lados_fourwaycannon, indice_sprite, x, y, 1, 1, 0, c_white, image_alpha);