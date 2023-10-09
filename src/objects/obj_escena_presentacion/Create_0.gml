// Evitar que el jugador se pueda mover
jugador.permitir_movimiento = false;

// Variables
fase_presentacion = 1;
fase_personaje = 0;
velocidad_presentacion = 10;
transparencia_marcos = 0;

// Parametros
var descripcion_nivel = nivel.obtener_descripcion();
var parametros_interfaz = jugador.parametros_titlecard;
var mitad_ancho_pantalla = graficos.obtener_ancho() / 2;
var mitad_altura_pantalla = graficos.obtener_altura() / 2;

parametros_transiciones = {
    pos_x: mitad_ancho_pantalla,
    pos_y: mitad_altura_pantalla,
    negra: {
        sprite: spr_pantalla_negra,
        transparencia: 1
    },
    morada: {
        sprite: spr_pantalla_morada,
        transparencia: 1
    }
}

parametros_barra_diagonal = {
    pos_x: 0,
    pos_y: 0,
    angulo: 80,
    sprite: parametros_interfaz.barra_diagonal,
}

parametros_nombre_nivel = {
    marco: {
        pos_x: 0,
        pos_y: 75,
        sprite: spr_marco_titulo
    },
    texto: {
        pos_x: -200,
        pos_y: 85,
        font: font_principal_cursiva,
        color: parametros_interfaz.color_font,
        contenido: descripcion_nivel.nombre
    }
}

parametros_objetivo_nivel = {
    marco: {
        pos_x: 0,
        pos_y: 210,
        sprite: spr_marco_subtitulo
    },
    texto: {
        pos_x: 500,
        pos_y: 212,
        font: font_principal_cursiva,
        color: parametros_interfaz.color_font,
        contenido: descripcion_nivel.objetivo
    }
}

parametros_personaje = {
	indice_actual: 0,
	pos_x: 410,
	pos_y: 35,
	pos_x_final: mitad_ancho_pantalla,
	pos_y_final: mitad_altura_pantalla,
    animacion_normal: {
        sprite:  parametros_interfaz.animaciones.normal.sprite,
        velocidad:  parametros_interfaz.animaciones.normal.velocidad
    },
    animacion_corriendo: {
        sprite: parametros_interfaz.animaciones.corriendo.sprite,
        velocidad:  parametros_interfaz.animaciones.corriendo.velocidad
    }
}