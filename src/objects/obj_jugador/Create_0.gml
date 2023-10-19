// Variables esenciales
mascara_colision = 16;
velocidad_horizontal = 0;
velocidad_vertical = 0;
limite_velocidad_vertical = 16;
limite_velocidad_maxima = 13;
limite_velocidad_normal = 12;
altura_salto = -6.5;
altura_salto_minima = -4;

aceleracion = 0.125;
desaceleracion = 0.125;
friccion = 0.046875;
gravedad = 0.21875;
angulo = 0;
acos = 1;
asin = 0;

accion = 0;
tocando_suelo = false;

direccion_horizontal = 1;
capa_actual = "frontal";
tiempo_aire = 0;
limite_velocidad_actual = 0;

// Variables para el manejo del boost
cantidad_boost = 100;
permitir_uso_boost = false;
valor_incremento_rastro = 0;

// Variables para el manejo del spindash
velocidad_spindash = 0;
friccion_bola = 0.023475;
desaceleracion_bola = 0.1484375;

// Variables para el manejo de cosas que puede hacer el jugador en determinado momento
caminar_sobre_agua = false;
permitir_movimiento = true;
permitir_ser_apuntado = true;
permitir_homing_attack = false;
puede_hacer_homing = false;
permitir_air_dash = false;
permitir_walljump = true;
permitir_grinding = true;
permitir_pisoton = false;

// Variables para el manejo de los eventos Quick Time Events
cantidad_eventos_qte = 1;  
jump_panel = 1

// Variables de otros casos
sumergido_agua = false;
velocidad_zipline = 0;

dando_pisadas = false;
pisada_actual = "a";
sonido_pisada_a = 0;
sonido_pisada_b = 0;

rings = 0;
zona_superada = false;
tiempo_invencibilidad = 0;

// Variables para el manejo de los sprites
sprite_index = noone;
image_alpha = 1;
image_index = 0;
image_speed = 0;
image_angle = 0;
mask_index = mascara_colision;

fotograma = 0;
pos_y_efectos = 0;
ultima_accion_realizada = 0;

// Creacion de alarmas personalizadas para tener mas controles sobre los ticks
alarma_2 = 0;
alarma_3 = 0;
alarma_4 = 0;
alarma_5 = 0;

// Eliminar todo puntaje al crear el jugador
nivel.eliminar_puntaje();

// Determinar donde sera creado el jugador
if (nivel.obtener_permiso_reaparicion()) {
	var ubicacion_reaparicion = nivel.obtener_ubicacion_reaparicion();
	x = ubicacion_reaparicion.pos_x;
	y = ubicacion_reaparicion.pos_y;
}

// Parametros externos
parametros_hud = {
	font: noone,
	vidas: { icono: noone },
	boost: { colores: [noone, noone] }
}

parametros_titlecard = {
	color_font: make_colour_rgb(155, 155, 155),
	barra_diagonal: spr_barra_diagonal_blanca,
	animaciones: {
		normal: { sprite: noone, velocidad: 0 },
		corriendo: { sprite: noone, velocidad: 0 }
	}
}

parametros_resultados = {
	color_font: make_colour_rgb(155, 155, 155),
	bandas: { superior: noone, inferior: noone }
}

parametros_checkpoint = { animacion_normal: noone, font: noone }

animaciones_dashring = { girando: noone, impulsandose: noone, saltando: noone }

audios_grito_boost = [];
sprite_explosion_boost = noone;
sprite_efecto_boost = noone;
sprite_destello_boost = noone;

sprite_efecto_pisoton = noone;

sprite_efecto_salto = { sprite_aura: noone, sprite_aterrizar: noone }

sprites_acrobacia = [];
audios_acrobacia = [];

particulas_rastro = noone;

audio_quejido = noone;

audio_homing_dash = noone;

velocidad_homing_attack = noone;

audio_festejo = noone;

audio_muerte = noone;

direccion_aura_boost = 0;

