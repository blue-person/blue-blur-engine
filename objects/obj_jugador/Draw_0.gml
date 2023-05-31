// Esto permite arreglar un problema donde el personaje colisiona ligeramente dentro de una superficie de pared mientras se dibujan los sprites
var pared_requerida;

var pos_x = x;
var pos_y = y;

var valor_x = pos_x + asin * mascara_colision;
var valor_y = pos_y + acos * mascara_colision;

if (place_meeting(pos_x, pos_y, obj_superficie)) {
    pared_requerida = instance_place(valor_x, valor_y, obj_superficie);
} else if (place_meeting(pos_x, pos_y, obj_superficie_posterior) or (capa_actual == "posterior")) {
    pared_requerida = instance_place(valor_x, valor_y, obj_superficie_posterior);
} else if (place_meeting(pos_x, pos_y, obj_superficie_frontal) or (capa_actual == "frontal")) {
    pared_requerida = instance_place(valor_x, valor_y, obj_superficie_frontal);
} else if (place_meeting(pos_x, pos_y, obj_riel)) {
    pared_requerida = instance_place(valor_x, valor_y, obj_riel);
} else if (place_meeting(pos_x, pos_y, obj_riel_posterior) or (capa_actual == "posterior")) {
    pared_requerida = instance_place(valor_x, valor_y, obj_riel_posterior);
} else if (place_meeting(pos_x, pos_y, obj_riel_frontal) or (capa_actual == "frontal")) {
    pared_requerida = instance_place(valor_x, valor_y, obj_riel_frontal);
}

var pos_bbox_top = sprite_get_bbox_top(pared_requerida) - sprite_get_yoffset(pared_requerida);
if (collision_point(pos_x + 14.5 * asin, pos_y + 14.5 * acos, obj_superficie, true, true)) {
    pos_bbox_top++;
} else if (collision_point(pos_x + 14.5 * asin, pos_y + 14.5 * acos, obj_superficie_posterior, true, true) or (capa_actual == "posterior")) {
	pos_bbox_top++;
} else if (collision_point(pos_x + 14.5 * asin, pos_y + 14.5 * acos, obj_superficie_frontal, true, true) or (capa_actual == "frontal")) {
	pos_bbox_top++;
} else if (collision_point(pos_x + 14.5 * asin, pos_y + 14.5 * acos, obj_riel, true, true)) {
	pos_bbox_top++;
} else if (collision_point(pos_x + 14.5 * asin, pos_y + 14.5 * acos, obj_riel_posterior, true, true) or (capa_actual == "posterior")) {
	pos_bbox_top++;
} else if (collision_point(pos_x + 14.5 * asin, pos_y + 14.5 * acos, obj_riel_frontal, true, true) or (capa_actual == "frontal")) {
	pos_bbox_top++;
}
dibujar_y_post = pos_bbox_top;

// Dibujar el sprite
if (acos == 1 and tocando_suelo) {
    draw_sprite_ext(sprite_actual, indice_sprite, pos_x, pos_y - pos_bbox_top, direccion_horizontal, 1, angulo_imagen, c_white, image_alpha);
} else if (acos == -1 and tocando_suelo) {
    draw_sprite_ext(sprite_actual, indice_sprite, pos_x, pos_y + 2, direccion_horizontal, 1, angulo_imagen, c_white, image_alpha);
} else {
    draw_sprite_ext(sprite_actual, indice_sprite, pos_x, pos_y, direccion_horizontal, 1, angulo_imagen, c_white, image_alpha);
}

// Dibujar colisiones
if (global.permitir_modo_debug) {
	colision_con_suelo();
	colision_con_riel();
	colision_lineal_derecha();
	colision_lineal_izquierda();
	colision_circular_principal();
	colision_circular_izquierda();
	colision_circular_derecha();
	colision_circular_superior();
	colision_circular_inferior();
}