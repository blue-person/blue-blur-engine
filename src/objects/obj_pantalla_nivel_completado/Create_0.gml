fase_animacion = 1;
transparencia_barra = 0;
texto_puntaje_final = "";
puntaje_maximo = 99999;
permitir_transicion = true;

// Boton de continuar
estado_boton_continuar = 0;
transparencia_boton_continuar = 0;

// Posicion de las barras
pos_y_barra_superior = -38;
pos_y_barra_inferior = 324;

pos_x_titulo = -150;
pos_y_titulo = 98;

// Posicion de los textos
pos_final_texto = 40;

pos_x_texto_tiempo = -150;
pos_y_texto_tiempo = 90;

pos_x_texto_rings = -150;
pos_y_texto_rings = 120;

pos_x_texto_cool = -150;
pos_y_texto_cool = 150;

pos_x_puntaje_final = -150;
pos_y_puntaje_final = 210;

pos_x_puntaje_tiempo = 534;
pos_x_puntaje_rings = 534;
pos_x_puntaje_cool = 534;

// Definir sprites y colores en base al personaje
switch (global.personaje_actual) {
    case "Sonic":
        indice = 0;
        color = make_colour_rgb(27, 54, 166);
        break;
    case "Shadow":
        indice = 1;
        color = make_colour_rgb(137, 27, 41);
        break;
	default:
		indice = 0;
        color = make_colour_rgb(155, 155, 155);
		break;
}

// Cancion inicial de nivel completado
audio.reproducir_cancion(msc_nivel_completado);
alarm[1] = 350;