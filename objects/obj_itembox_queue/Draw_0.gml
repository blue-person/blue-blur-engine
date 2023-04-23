if (sprite_index != -1) {
	var valor_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
	var valor_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) * 0.75;
	
	draw_sprite_ext(sprite_index, 0, valor_x, valor_y, 1, 1, 0, c_white, image_alpha);
}
