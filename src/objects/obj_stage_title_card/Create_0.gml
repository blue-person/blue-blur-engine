// Evitar que el jugador se pueda mover durante la presentacion del nivel
jugador.permitir_movimiento = false;

// Variables
animacion_presentacion = 1;
animacion_personaje = 0;
velocidad_presentacion = 10;
transparencia_marcos = 0;
duracion_primera_fase = 120;

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
	pos_x_actual: 410,
	pos_y_actual: 35,
	pos_x_final: mitad_ancho_pantalla,
	pos_y_final: mitad_altura_pantalla,
    animacion_normal: {
        sprite:  obj_jugador.animacion_presentacion.normal.sprite,
        velocidad: obj_jugador.animacion_presentacion.normal.velocidad
    },
    animacion_corriendo: {
        sprite: obj_jugador.animacion_presentacion.corriendo.sprite,
        velocidad: obj_jugador.animacion_presentacion.corriendo.velocidad
    }
}