// Variables de la animacion
image_alpha = 0;
fase_animacion = 1;
velocidad_animacion = 0.1;

// Variables del dibujo
mensaje = "checkpoint";
tiempo_actual = obj_controlador_tiempo.texto_tiempo;
font_requerida = -1;
numeros_requeridos = -1;

switch (global.personaje_actual) {
    case "Sonic":
        font_requerida = global.font_texto_azul;
		numeros_requeridos = global.font_numeros_azul;
        break;
    case "Shadow":
        font_requerida = global.font_texto_gris;
		numeros_requeridos = global.font_numeros_gris;
        break;
}