function establecer_particulas() {
	// Creacion del sistema de particulas
	global.sistema_particulas = part_system_create_layer(layer, true);
	part_system_depth(global.sistema_particulas, 0);
	
	// Particulas del rastro de Sonic
	var color_azul = make_colour_rgb(78, 194, 252);
	global.prt_rastro_azul = part_type_create();
	part_type_shape(global.prt_rastro_azul, pt_shape_flare);
	part_type_size(global.prt_rastro_azul, 0.18, 0.18, 0, 0);
	part_type_scale(global.prt_rastro_azul, 5.8, 2);
	part_type_color1(global.prt_rastro_azul, color_azul);
	part_type_alpha2(global.prt_rastro_azul, 0.6, 0);
	part_type_speed(global.prt_rastro_azul, -2.5, -2.5, 0.15, 0);
	part_type_direction(global.prt_rastro_azul, 0, 0, 0, 0);
	part_type_gravity(global.prt_rastro_azul, 0, 270);
	part_type_orientation(global.prt_rastro_azul, 0, 0, 0, 0, 1);
	part_type_blend(global.prt_rastro_azul, 1);
	part_type_life(global.prt_rastro_azul, 12, 12);
	
	// Particulas del rastro de Shadow
	var color_naranja = make_colour_rgb(255, 160, 64);
	global.prt_rastro_naranja = part_type_create();
	part_type_shape(global.prt_rastro_naranja, pt_shape_flare);
	part_type_size(global.prt_rastro_naranja, 0.18, 0.18, 0, 0);
	part_type_scale(global.prt_rastro_naranja, 5.8, 2);
	part_type_color1(global.prt_rastro_naranja, color_naranja);
	part_type_alpha2(global.prt_rastro_naranja, 0.6, 0);
	part_type_speed(global.prt_rastro_naranja, -2.5, -2.5, 0.15, 0);
	part_type_direction(global.prt_rastro_naranja, 0, 0, 0, 0);
	part_type_gravity(global.prt_rastro_naranja, 0, 270);
	part_type_orientation(global.prt_rastro_naranja, 0, 0, 0, 0, 1);
	part_type_blend(global.prt_rastro_naranja, 1);
	part_type_life(global.prt_rastro_naranja, 12, 12);
	
	// Particulas del rastro de las chispas de energia del boost
	var color_blanco = make_colour_rgb(255, 255, 255);
	global.prt_rastro_blanco = part_type_create();
	part_type_shape(global.prt_rastro_blanco, pt_shape_flare);
	part_type_size(global.prt_rastro_blanco, 0.18, 0.18, 0, 0);
	part_type_scale(global.prt_rastro_blanco, 3.5, 1);
	part_type_color1(global.prt_rastro_blanco, color_blanco);
	part_type_alpha2(global.prt_rastro_blanco, 0.6, 0);
	part_type_speed(global.prt_rastro_blanco, -2.5, -2.5, 0.15, 0);
	part_type_direction(global.prt_rastro_blanco, 0, 0, 0, 0);
	part_type_gravity(global.prt_rastro_blanco, 0, 270);
	part_type_orientation(global.prt_rastro_blanco, 0, 0, 0, 0, 1);
	part_type_blend(global.prt_rastro_blanco, 1);
	part_type_life(global.prt_rastro_blanco, 8, 8);
}