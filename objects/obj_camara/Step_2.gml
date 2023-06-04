// Hacer que la camara no se salga de los bordes del nivel
var mitad_ancho = pantalla.obtener_ancho() / 2;
var mitad_altura = pantalla.obtener_altura()  / 2;
x = clamp(x, mitad_ancho, room_width - mitad_ancho);
y = clamp(y, mitad_altura, room_height - mitad_altura);

// Establecer la vista de la camara, esto se hace en modo de matriz
camera_set_view_mat(camara, matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0));