// Calculo principal para el efecto de Smooth Camera
x += (pos_x - x) / valor_retraso;
y += (pos_y - y) / valor_retraso;

// Establecer el enfoque de la camara
if (objeto_enfocado != noone) {
	pos_x = objeto_enfocado.x;
	pos_y = objeto_enfocado.y;
}