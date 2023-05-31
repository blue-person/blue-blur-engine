// Calculo principal para el efecto de Smooth Camera
x += (pos_x - x) / valor_retraso;
y += (pos_y - y) / valor_retraso;

// Establecer el enfoque de la camara
if (objeto_enfocado != noone) {
	pos_x = objeto_enfocado.x;
	pos_y = objeto_enfocado.y;
} 

// Sacudir camara
if (permitir_sacudir) {
	x += random_range(-sacudida_restante, sacudida_restante);
	y += random_range(-sacudida_restante, sacudida_restante);
	
	if (sacudida_restante == 0) {
		permitir_sacudir = false;
	} else {
		var calculo_sacudida = sacudida_restante - ((1 / duracion_sacudida) * magnitud_sacudida)
		sacudida_restante = max(0, calculo_sacudida);
	}
}

// Modificaciones para Sonic
if (objeto_enfocado == obj_jugador)  {
	var accion_jugador = obj_jugador.accion;
	
	// Eliminar efecto de Smooth Camera si se inicia un QTE
	if (accion_jugador == 14) {
		x = pos_x;
		y = pos_y;
	} else {
		// En cualquier otro caso, la camara debe moverse ligeramente delante
		// del jugador y asi aumentar su tiempo de reaccion
		pos_x += obj_jugador.velocidad_horizontal * (valor_retraso * 1.55);
	}
	
	// Subir o bajar la camara dependiendo de la accion del jugador
	if ((accion_jugador == -3) or (accion_jugador == -1)) {
		var permitir_elevar_camara = (cronometro >= requisito_elevar_camara);
		var permitir_bajar_camara = (cronometro >= requisito_bajar_camara);
		
		if (accion_jugador == -3) {
			cronometro++;
			if (permitir_elevar_camara) {
			   pos_y -= 55;
			}
		} else if (accion_jugador == -1) {
			cronometro++;
			if (permitir_bajar_camara) {
			   pos_y += 45;
			}
		}
	} else {
		cronometro = 0;
	}
}

// Hacer que la camara no se salga de los bordes del nivel
var mitad_ancho = Pantalla.RESOLUCION_HORIZONTAL / 2;
var mitad_altura = Pantalla.RESOLUCION_VERTICAL  / 2;
x = clamp(x, mitad_ancho, room_width - mitad_ancho);
y = clamp(y, mitad_altura, room_height - mitad_altura);

// Establecer la vista de la camara, esto se hace en modo de matriz
camera_set_view_mat(camara, matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0));