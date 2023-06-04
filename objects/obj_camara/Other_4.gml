// Crear vista
view_enabled = true;
view_visible[0] = true;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = pantalla.obtener_ancho();
view_hport[0] = pantalla.obtener_altura() ;
view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, objeto_enfocado, -1, -1, 32, 32);

// Crear camara
camara = camera_create();
var pos_min = 1;
var pos_max = 10000;

camera_set_view_mat(camara, matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0));
camera_set_proj_mat(camara, matrix_build_projection_ortho(pantalla.obtener_ancho(), pantalla.obtener_altura() , pos_min, pos_max));
view_camera[0] = camara;

// Establecer el enfoque de la camara
if (instance_exists(obj_jugador)) {
	objeto_enfocado = obj_jugador;
}