// Ajustar elementos externos
jugador.permitir_movimiento = false;
audio.reproducir_cancion(msc_nivel_completado);
alarm[0] = 350;

// Variables
fase_animacion = 1;
permitir_transicion = true;
font_titulos = font_principal_cursiva;
font_subtitulos = font_principal_normal;

// Parametros
var sprite_bandas = jugador.parametros_resultados.bandas;
var color_font = jugador.parametros_resultados.color_font;

parametros_bandas = {
    superior: {
        pos_x: 0,
        pos_y: -38,
        pos_y_final: 0,
        sprite: sprite_bandas.superior
    },
    inferior: {
        pos_x: 0,
        pos_y: 324,
        pos_y_final: 256,
        sprite: sprite_bandas.inferior
    }
}

parametros_titulo = {
    marco: {
        pos_x: 0,
        pos_y: 105,
        sprite: spr_marco_titulo,
        transparencia: 0
    },
    texto: {
        pos_x: -150,
        pos_y: 101.5,
        pos_x_final: 125,
        pos_y_final: 35.5,
        contenido: "Stage  Clear",
        color: color_font
    }
}

parametros_tiempo = {
    titulo: {
        pos_x: -150,
        pos_y: 90,
        pos_x_final: 40,
        contenido: "Time Bonus",
        color: color_font
    },
    texto: {
        pos_x: 534,
        pos_y: 90,
        color: color_font
    }
}

parametros_rings = {
    titulo: {
        pos_x: -150,
        pos_y: 120,
        pos_x_final: 40,
        contenido: "Ring Bonus",
        color: color_font
    },
    texto: {
        pos_x: 534,
        pos_y: 120,
        color: color_font
    }
}

parametros_cool = {
    titulo: {
        pos_x: -150,
        pos_y: 150,
        pos_x_final: 40,
        contenido: "Cool Bonus",
        color: color_font
    },
    texto: {
        pos_x: 534,
        pos_y: 150,
        color: color_font
    }
}

parametros_final = {
    titulo: {
        pos_x: -150,
        pos_y: 210,
        pos_x_final: 40,
        contenido: "Score",
        color: color_font
    },
    texto: {
        pos_x: 113,
        pos_y: 210,
        color: color_font,
        puntaje_min: 0,
        puntaje_max: 99999
    }
}

calificaciones = [{
        requisito: 50000,
        sprite: spr_calificacion_s
    }, {
        requisito: 40000,
        sprite: spr_calificacion_a
    }, {
        requisito: 35000,
        sprite: spr_calificacion_b
    }, {
        requisito: 25000,
        sprite: spr_calificacion_c
    }, {
        requisito: 0,
        sprite: spr_calificacion_d
    }
];

parametros_calificacion = {
    pos_x: 347,
    pos_y: 208,
	escala_x: 11,
	escala_y: 11,
    sprite: spr_calificacion_d,
	transparencia: 0
}

parametros_boton = {
    pos_x: 428,
    pos_y: 222,
    estado: 0,
    transparencia: 0
}