// Ajustar elementos externos
jugador.permitir_movimiento = false;
audio.reproducir_cancion(msc_nivel_completado);
alarm[1] = 350;

// Variables
fase_animacion = 1;
permitir_transicion = true;

// Parametros
var sprite_bandas = jugador.parametros_resultados.bandas;
var color_font = jugador.parametros_resultados.color_font;

parametros_bandas = {
    superior: {
        sprite: sprite_bandas.superior,
        pos_y: -38,
        pos_y_final: 0
    },
    inferior: {
        sprite: sprite_bandas.inferior,
        pos_y: 324,
        pos_y_final: 256
    },
    transparencia: 0
}

parametros_titulo = {
    marco: spr_marco_titulo,
    pos_x: -150,
    pos_y: 98,
    pos_x_final: 125,
    pos_y_final: 32,
    contenido: "Stage  Clear"
}

parametros_tiempo = {
    pos_x_titulo: -150,
    pos_x_contenido: 534,
    pos_x_final: 40,
    pos_y_final: 90,
    color: color_font
}

parametros_rings = {
    pos_x_titulo: -150,
    pos_x_contenido: 534,
    pos_x_final: 40,
    pos_y_final: 120,
    color: color_font
}

parametros_cool = {
    pos_x_titulo: -150,
    pos_x_contenido: 534,
    pos_x_final: 40,
    pos_y_final: 150,
    color: color_font
}

parametros_total = {
    pos_x_titulo: -150,
    pos_x_contenido: 534,
    pos_x_final: 40,
    pos_y_final: 210,
    color: color_font,
    valor_maximo: 99999
}

parametros_boton = {
    estado: 0,
    transparencia: 0
}