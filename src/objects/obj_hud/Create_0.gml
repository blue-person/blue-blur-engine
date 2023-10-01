// Variables
transparencia = 1;
font = obj_jugador.sprites_hud.font_numeros;

// Parametros del tiempo
parametros_tiempo = {
    icono: {
        pos_x: 25,
        pos_y: 20,
        sprite: spr_contador_tiempo
    },
    info: {
        pos_x: 55,
        pos_y: 25
    },
	transparencia: 1,
	mostrar_en_pantalla: true
}

// Parametros de los rings
parametros_rings = {
    icono: {
        pos_x: 25,
        pos_y: 45,
        sprite: spr_contador_rings
    },
    info: {
        pos_x: 55,
        pos_y: 48
    },
	transparencia: 1,
	mostrar_en_pantalla: true
}

// Parametros de las vidas
parametros_vidas = {
    icono: {
        pos_x: 364.8,
        pos_y: 20,
        sprite: obj_jugador.sprites_hud.icono_vidas
    },
    info: {
        pos_x: 394.8,
        pos_y: 23
    },
	transparencia: 1,
	mostrar_en_pantalla: true
}

// Parametros del boost
parametros_boost = {
    icono: {
        pos_x: 25,
        pos_y: 217.6,
        sprite: spr_barra_boost
    },
	barras: {
		superior: {
	        pos_x: 32,
	        pos_y: 225.1
	    },
		inferior: {
	        pos_x: 33,
	        pos_y: 226.1
	    },
		colores: [obj_jugador.sprites_hud.colores_barra_boost.superior, obj_jugador.sprites_hud.colores_barra_boost.inferior]	
	},
	transparencia: 1,
	mostrar_en_pantalla: true
}

// Metodos
mostrar = function() {
	// Solo iniciar el cronometro si es necesario
	if (instance_exists(cronometro) and parametros_tiempo.mostrar_en_pantalla) {
		cronometro.iniciar_cronometro();
	}
	
	// Mostrar el HUD
	visible = true;
}

ocultar = function() {
	visible = false;
}

establecer_visibilidad_elementos = function(mostrar_tiempo, mostrar_rings, mostrar_vidas, mostrar_boost) {
	parametros_tiempo.mostrar_en_pantalla = mostrar_tiempo;
	parametros_rings.mostrar_en_pantalla = mostrar_rings;
	parametros_vidas.mostrar_en_pantalla = mostrar_vidas;
	parametros_boost.mostrar_en_pantalla = mostrar_boost;
}

dibujar_icono = function(elemento) {
    draw_sprite(elemento.icono.sprite, 0, elemento.icono.pos_x, elemento.icono.pos_y);
}

dibujar_informacion = function(elemento, texto) {
	textos.escritura_simple(elemento.info.pos_x, elemento.info.pos_y, texto, font, fa_top, fa_top, elemento.transparencia);
}

dibujar_barra = function(barra, longitud, colores) {
	draw_line_width_colour(barra.pos_x, barra.pos_y, barra.pos_x + longitud, barra.pos_y, 1, colores[0], colores[1]);
}