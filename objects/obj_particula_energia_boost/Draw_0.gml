var angulo = rodear_angulo(floor(point_direction(x_inicial, y_inicial, x, y)));

part_type_direction(global.prt_rastro_blanco, angulo, angulo, 0, 0);
part_particles_create(global.sistema_particulas, x, y, global.prt_rastro_blanco, 2);
draw_self();