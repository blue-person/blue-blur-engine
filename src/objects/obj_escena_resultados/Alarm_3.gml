// Iniciar el conteo de la alarma
iniciar_alarma(4, 180);

// Determianr la calificacion
var puntaje_final = parametros_final.texto.contenido;
for (var i = 0; i < array_length(calificaciones); ++i) {
	var calificacion = calificaciones[i];
    if (puntaje_final >= calificacion.requisito) {
		parametros_calificacion.sprite = calificacion.sprite;
		break;
	}
}

// Cambiar de fase
fase_animacion = 11;