// Dibujar cuerda hasta el final de la polea
draw_line_colour(x, y - 3, instance_nearest(x, y, obj_motor_polea).x, instance_nearest(x, y, obj_motor_polea).y + 5, c_gray, c_gray);
draw_line_colour(x - 2, y - 3, instance_nearest(x + 1, y, obj_motor_polea).x - 2, instance_nearest(x, y, obj_motor_polea).y + 5, c_gray, c_gray);
draw_line_colour(x - 1, y - 3, instance_nearest(x, y, obj_motor_polea).x - 1, instance_nearest(x, y, obj_motor_polea).y + 5, c_gray, c_gray);

// Dibujar manija
draw_self();