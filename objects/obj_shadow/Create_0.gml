// Heredar datos del objeto padre
event_inherited();

// Establecer el sprite por defecto
sprite_index = spr_shadow_normal;

// tmp
animacion_presentacion = {
	normal: {
		sprite: spr_animacion_shadow_normal,
		velocidad: 0.20
	},
	corriendo: {
		sprite: spr_animacion_shadow_corriendo,
		velocidad: 0.75
	}
}

audios_grito_boost = [snd_boost_shadow_a, snd_boost_shadow_b, snd_boost_shadow_c];
sprite_explosion_boost = spr_explosion_boost_shadow;
sprite_efecto_boost = spr_efecto_boost_shadow;
sprite_destello_boost = spr_destello_boost_shadow;

sprite_efecto_pisoton = spr_efecto_pisoton_shadow;

sprite_efecto_salto = {
	sprite_aura: spr_efecto_salto_shadow,
	sprite_aterrizar: spr_shadow_aterrizar
}

sprites_acrobacia = [spr_shadow_saltando];
audios_acrobacia = [snd_ataque_shadow_a, snd_ataque_shadow_b, snd_ataque_shadow_c];

sprites_hud = {
	icono_vidas: spr_contador_vidas_shadow,
	font_numeros: texto.obtener_font_gris(),
	colores_barra_boost: { 
		superior: COLOR_NARANJA_NORMAL,
		inferior: COLOR_NARANJA_CLARO
	}
}

font_checkpoint = texto.obtener_font_gris();

particula_boost = global.prt_rastro_naranja;

audio_quejido = snd_quejido_shadow;

audio_homing_dash = snd_teletransportacion;

velocidad_homing_attack = 12;

audio_festejo = snd_festejo_shadow;

audio_muerte = snd_muerte_shadow;