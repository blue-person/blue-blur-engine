// Variables
var pos_y_polea = y - 3;
var pos_y_motor = motor_polea.y + 5;

// Dibujar cuerda hasta el final de la polea
draw_line_colour(x, pos_y_polea, motor_polea.x, pos_y_motor, c_gray, c_gray);
draw_line_colour(x - 2, pos_y_polea, motor_polea.x - 2, pos_y_motor, c_gray, c_gray);
draw_line_colour(x - 1, pos_y_polea, motor_polea.x - 1, pos_y_motor, c_gray, c_gray);

// Dibujar manija
draw_self();