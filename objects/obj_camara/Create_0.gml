// Variables generales
camara = noone;
enfoque_camara = noone;
valor_interpolacion = 0.25;
modo_seguimiento = "suave";

// Movimiento horizontal de la camara
pos_x = x;
desplazamiento_x = 0;
indice_inclinacion_horizontal = pantalla.obtener_ancho() / 5;
velocidad_inclinacion_horizontal = indice_inclinacion_horizontal / (valor_interpolacion * 100);
permitir_camara_extendida = true;

// Movimiento vertical de la camara
pos_y = y;
desplazamiento_y = 0;
retraso_inclinacion_vertical = 0;
velocidad_inclinacion_vertical = valor_interpolacion * 10;

// Sacudir camara
permitir_sacudir = false;
duracion_sacudida = 0;
magnitud_sacudida = 0;
valor_sacudida_restante = 0;

// Crear vista
view_enabled = true;
view_visible[0] = true;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = pantalla.obtener_ancho();
view_hport[0] = pantalla.obtener_altura() ;
view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, enfoque_camara, -1, -1, 32, 32);

// Crear camara
camara = camera_create();
var pos_min = 1;
var pos_max = 10000;

camera_set_view_mat(camara, matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0));
camera_set_proj_mat(camara, matrix_build_projection_ortho(pantalla.obtener_ancho(), pantalla.obtener_altura() , pos_min, pos_max));
view_camera[0] = camara;

// Variables relacionadas al jugador
if (instance_exists(obj_jugador)) {
	enfoque_camara = obj_jugador;
	limite_velocidad_horizontal = obj_jugador.limite_velocidad_horizontal / 1.5;
}

// Metodos
establecer_enfoque = function(objeto, tipo_seguimiento = "suave") {
	enfoque_camara = objeto;
	pos_x = objeto.x;
	pos_y = objeto.y;
	desplazamiento_x = 0;
	desplazamiento_y = 0;
	modo_seguimiento = tipo_seguimiento;
}

desactivar_enfoque = function() {
	enfoque_camara = noone;
	modo_seguimiento = "suave";
}

sacudir_camara = function(magnitud, duracion) {
	permitir_sacudir = true;
	if (magnitud > valor_sacudida_restante) {
		valor_sacudida_restante = magnitud;
		magnitud_sacudida = magnitud;
		duracion_sacudida = duracion;
	}
}