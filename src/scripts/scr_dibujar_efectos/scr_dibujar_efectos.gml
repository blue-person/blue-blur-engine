function dibujar_efectos(sprite, angulo = 0, escala_x = 1, escala_y = 1, estado_combinacion = true, pos_x = x, pos_y = y) {
	var efecto = instance_create_depth(pos_x, pos_y, -10, obj_efecto_generico);
	with(efecto) {
		sprite_index = sprite;
		image_angle = angulo;
		image_xscale = escala_x;
		image_yscale = escala_y;
		permitir_combinar_imagen = estado_combinacion;
	}
}
