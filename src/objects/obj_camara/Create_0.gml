// Variables generales
objetivo = noone;
controlador_camara = noone;
indice_ajuste_posicional = 5;
modo_seguimiento = "suave";

// Variables para inclinar la camara
desplazamiento_x = 0;
desplazamiento_y = 0;

tiempo_restante_para_inclinar = 0;
tiempo_requerido_para_inclinar = 90;
indice_inclinacion_superior = -83;
indice_inclinacion_inferior = 73;
velocidad_inclinacion_vertical = 3;

permitir_camara_extendida = true;
mitad_ancho_pantalla = graficos.obtener_ancho() / 2;
mitad_altura_pantalla = graficos.obtener_altura() / 2;
indice_inclinacion_horizontal = graficos.obtener_ancho() / 5;
velocidad_inclinacion_horizontal = 2;

// Variables para sacudir la camara
duracion_sacudida = 0;

// Crear vista de la camara
view_enabled = true;
view_visible[0] = true;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = graficos.obtener_ancho();
view_hport[0] = graficos.obtener_altura() ;
view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, objetivo, -1, -1, 32, 32);

// Crear la camara del juego
var valor_min_visibilidad = -255;
var valor_max_visibilidad = 255;
var matriz_visualizacion = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var matriz_proyeccion = matrix_build_projection_ortho(graficos.obtener_ancho(), graficos.obtener_altura(), valor_min_visibilidad, valor_max_visibilidad);

controlador_camara = camera_create();
camera_set_view_mat(controlador_camara, matriz_visualizacion);
camera_set_proj_mat(controlador_camara, matriz_proyeccion);
view_camera[0] = controlador_camara;

// Metodos
obtener_ubicacion = function() {
	var ubicacion = {
		pos_x: -camera_get_view_mat(controlador_camara)[12],
		pos_y: -camera_get_view_mat(controlador_camara)[13]
	};
	return ubicacion;
}

establecer_enfoque = function(objetivo, desplazamiento_x = 0, desplazamiento_y = 0, modo_seguimiento = "suave") {
	self.objetivo = objetivo;
	self.desplazamiento_x = desplazamiento_x;
	self.desplazamiento_y = desplazamiento_y;
	self.modo_seguimiento = modo_seguimiento;
}

desactivar_enfoque = function() {
	self.objetivo = noone;
}

sacudir_camara = function(duracion_sacudida) {
	self.duracion_sacudida = duracion_sacudida;
}