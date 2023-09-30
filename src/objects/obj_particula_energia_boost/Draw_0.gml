var direccion_jugador = floor(point_direction(x_inicial, y_inicial, x, y));
var angulo_rastro = normalizar_angulo(direccion_jugador);
part_type_direction(particulas_rastro, angulo_rastro, angulo_rastro, 0, 0);
part_particles_create(particulas, x, y, particulas_rastro, 2);

draw_self();