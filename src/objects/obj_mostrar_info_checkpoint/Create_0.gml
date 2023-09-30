// Variables de la animacion
image_alpha = 0;
fase_animacion = 1;
velocidad_animacion = 0.1;

// Variables del dibujo
mensaje = "checkpoint";
tiempo_actual = obj_cronometro.valores_cronometro;
font_requerida = noone;
numeros_requeridos = noone;

switch (global.personaje_actual) {
    case "Sonic":
        font_requerida = texto.obtener_font_azul();
		numeros_requeridos = texto.obtener_font_azul();
        break;
    case "Shadow":
        font_requerida = texto.obtener_font_gris();
		numeros_requeridos = texto.obtener_font_gris();
        break;
}