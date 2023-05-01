// Crear vista
view_enabled = true;
view_visible[0] = true;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = Pantalla.RESOLUCION_HORIZONTAL;
view_hport[0] = Pantalla.RESOLUCION_VERTICAL ;
view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, noone, -1, -1, 32, 32);

// Crear camara
camara = camera_create();
var pos_min = 1;
var pos_max = 10000;

camera_set_view_mat(camara, matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0));
camera_set_proj_mat(camara, matrix_build_projection_ortho(Pantalla.RESOLUCION_HORIZONTAL, Pantalla.RESOLUCION_VERTICAL , pos_min, pos_max));
view_camera[0] = camara;

// Determinar ubicacion inicial de la camara
pos_x = x;
pos_y = y;

// Determinar enfoque de la camara
if (instance_exists(obj_jugador)) {
	objeto_enfocado = obj_jugador;
} else {
	objeto_enfocado = noone;
}

// Valores del efecto de Smooth Camera
valor_retraso = 5;

// Sacudir camara
permitir_sacudir = false;
duracion_sacudida = 0;
magnitud_sacudida = 0;
sacudida_restante = 0;

// Mirar hacia arriba o hacia abajo
requisito_elevar_camara = room_speed / 2;
requisito_bajar_camara = room_speed / 1.25;
cronometro = 0;