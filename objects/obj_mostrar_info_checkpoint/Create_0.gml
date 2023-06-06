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
        font_requerida = fonts.obtener_texto_azul();
		numeros_requeridos = fonts.obtener_numeros_azules();
        break;
    case "Shadow":
        font_requerida = fonts.obtener_texto_gris();
		numeros_requeridos = fonts.obtener_numeros_grises();
        break;
}