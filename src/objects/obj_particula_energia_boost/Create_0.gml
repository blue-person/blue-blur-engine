velocidad_particula = 0;
x_inicial = 0;
y_inicial = 0;

particulas_rastro = part_type_create();
part_type_shape(particulas_rastro, pt_shape_flare);
part_type_size(particulas_rastro, 0.18, 0.18, 0, 0);
part_type_scale(particulas_rastro, 3.5, 1);
part_type_speed(particulas_rastro, -2.5, -2.5, 0.15, 0);
part_type_direction(particulas_rastro, 0, 0, 0, 0);
part_type_gravity(particulas_rastro, 0, 270);
part_type_orientation(particulas_rastro, 0, 0, 0, 0, true);
part_type_color1(particulas_rastro, COLOR_BLANCO);
part_type_alpha2(particulas_rastro, 0.6, 0);
part_type_blend(particulas_rastro, true);
part_type_life(particulas_rastro, 8, 8);

image_xscale = 0.5;
image_yscale = 0.5;
