function refl_surf_clear(argument0) {
	surface_set_target(argument0);
	draw_clear_alpha(0, 0);
	surface_reset_target();
}