// Variables
var jugador_tocando_suelo = other.tocando_suelo;
var jugador_haciendo_accion = (other.accion == 30);
var velocidad_rapida = (other.velocidad_horizontal >= 4);
var velocidad_lenta = (other.velocidad_vertical < 0);

// Gestionar funcionamiento
if (not activar_evento and jugador_tocando_suelo and velocidad_rapida) {
	// Modificar parametros
    activar_evento = true;
	iniciar_alarma(0, 15);
	
	// Reproducir efecto de sonido
	audio.reproducir_audio(snd_agarrar_objeto);
	
	// Modificar parametros del jugador
	with (jugador) {
	    image_index = 0;
	    x = other.x + other.image_xscale * 2;
	    y = other.y + 15;
	    direccion_horizontal = sign(other.image_xscale);
	    velocidad_horizontal = 0;
	    velocidad_vertical = 7;
	    tocando_suelo = false;
	    accion = 30;
	    angulo = 0;
	}
} else if (activar_evento and permitir_salto and jugador_haciendo_accion and velocidad_lenta) {
    // Modificar parametros
	permitir_salto = false;
    activar_evento = false;
    audio.reproducir_audio(snd_trampolin);
	
	// Modificar parametros del jugador
	with (jugador) {
	    velocidad_horizontal = 0;
	    velocidad_vertical = -13;
	    accion = 0;
	}
}