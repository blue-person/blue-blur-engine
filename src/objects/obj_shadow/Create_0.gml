// Heredar datos del objeto padre
event_inherited();

// Establecer el sprite por defecto
sprite_index = spr_shadow_normal;

// Parametros externos
parametros_hud = {
	font:  textos.obtener_font_gris(),
	vidas: { icono: spr_contador_vidas_shadow },
	boost: { colores: [COLOR_NARANJA_NORMAL, COLOR_NARANJA_CLARO] }
}

parametros_titlecard = {
	color_font: make_colour_rgb(137, 27, 41),
	barra_diagonal: spr_barra_diagonal_roja
}

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



font_checkpoint = textos.obtener_font_gris();

particulas_rastro = part_type_create();
part_type_shape(particulas_rastro, pt_shape_flare);
part_type_size(particulas_rastro, 0.18, 0.18, 0, 0);
part_type_scale(particulas_rastro, 5.8, 2);
part_type_speed(particulas_rastro, -2.5, -2.5, 0.15, 0);
part_type_direction(particulas_rastro, 0, 0, 0, 0);
part_type_gravity(particulas_rastro, 0, 270);
part_type_orientation(particulas_rastro, 0, 0, 0, 0, true);
part_type_color1(particulas_rastro, COLOR_NARANJA_CLARO);
part_type_alpha2(particulas_rastro, 0.6, 0);
part_type_blend(particulas_rastro, true);
part_type_life(particulas_rastro, 12, 12);;

audio_quejido = snd_quejido_shadow;

audio_homing_dash = snd_teletransportacion;

velocidad_homing_attack = 12;

audio_festejo = snd_festejo_shadow;

audio_muerte = snd_muerte_shadow;
