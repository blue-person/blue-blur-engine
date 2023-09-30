if (image_index > 998) {
    image_index = 0;
}

if (fotograma >= 1) {
    fotograma = 0;
    image_index++;
}

if (fotograma <= -1) {
    fotograma = 0;
    image_index--;
}

draw_sprite_ext(spr_lados_fourwaycannon, image_index, x, y, 1, 1, 0, c_white, image_alpha);