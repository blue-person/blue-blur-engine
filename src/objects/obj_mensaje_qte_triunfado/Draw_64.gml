// Establecer ubicacion del textos
x = graficos.obtener_ancho() / 2;
y = 165;

// Determinar mensaje en base a cuanto tiempo tardo en hacer el QTE
if (respuesta_rapida) {
	image_index = 0;
} else if (respuesta_normal) {
	image_index = 1;
} else {
	image_index = 2;
}

// Dibujar el mensaje
draw_self();