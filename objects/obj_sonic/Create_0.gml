// Heredar datos del objeto padre
event_inherited();

// Establecer el sprite por defecto
sprite_index = spr_sonic_normal;

// tmp
animacion_presentacion = {
	normal: {
		sprite: spr_animacion_sonic_normal,
		velocidad: 0.20
	},
	corriendo: {
		sprite: spr_animacion_sonic_corriendo,
		velocidad: 0.45
	}
}

audios_grito_boost = [snd_boost_sonic_a, snd_boost_sonic_b, snd_boost_sonic_c];
sprite_explosion_boost = spr_explosion_boost_sonic;
sprite_efecto_boost = spr_efecto_boost_sonic;
sprite_destello_boost = spr_destello_boost_sonic;

sprite_efecto_pisoton = spr_efecto_pisoton_sonic;

sprite_efecto_salto = {
	sprite_aura: spr_efecto_salto_sonic,
	sprite_aterrizar: spr_sonic_aterrizar
}

sprites_acrobacia = [spr_sonic_acrobacia_a, spr_sonic_acrobacia_a, spr_sonic_acrobacia_c];
audios_acrobacia = [snd_ataque_sonic_a, snd_ataque_sonic_b, snd_ataque_sonic_c];

sprites_hud = {
	icono_vidas: spr_contador_vidas_sonic,
	font_numeros: texto.obtener_font_azul(),
	colores_barra_boost: { 
		superior: COLOR_AZUL_NORMAL,
		inferior: COLOR_AZUL_CLARO
	}
}

font_checkpoint = texto.obtener_font_azul();

particula_boost = global.prt_rastro_azul;

audio_quejido = snd_quejido_sonic;

audio_homing_dash = snd_homing_attack;

velocidad_homing_attack = 10.5;

audio_festejo = snd_festejo_sonic;

audio_muerte = snd_muerte_sonic;