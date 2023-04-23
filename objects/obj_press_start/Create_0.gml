// Variables de la animacion
event_inherited();
transparencia = 0;

// Determinar mensaje
var tipo_controles = determinar_tipo_controles();
if (tipo_controles == "teclado") {
	mensaje = "press enter key";
} else {
	mensaje = "press start button";
}

// Variables generales
estado_animacion = 0;
valor_aumento_transparencia = 0.05;
permitir_transicion = true;