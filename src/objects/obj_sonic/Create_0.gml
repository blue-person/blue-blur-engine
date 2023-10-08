// Heredar datos del objeto padre
event_inherited();

// Establecer el sprite por defecto
sprite_index = spr_sonic_normal;

// Parametros externos
parametros_hud = {
	font:  textos.obtener_font_azul(),
	vidas: { icono: spr_contador_vidas_sonic },
	boost: { colores: [COLOR_AZUL_NORMAL, COLOR_AZUL_CLARO] }
}

parametros_titlecard = {
	color_font: make_colour_rgb(27, 54, 166),
	barra_diagonal: spr_barra_diagonal_azul,
	animaciones: {
		normal: {
			sprite: spr_animacion_sonic_normal,
			velocidad: 0.20
		},
		corriendo: {
			sprite: spr_animacion_sonic_corriendo,
			velocidad: 0.45
		}
	}
}

parametros_resultados = {
	color_font: make_colour_rgb(27, 54, 166),
	bandas: {
		superior: spr_banda_superior_azul,
		inferior: spr_banda_inferior_azul
	}
}

parametros_checkpoint = {
	animacion_normal: spr_sonic_normal,
	font: textos.obtener_font_azul()
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

particulas_rastro = part_type_create();
part_type_shape(particulas_rastro, pt_shape_flare);
part_type_size(particulas_rastro, 0.18, 0.18, 0, 0);
part_type_scale(particulas_rastro, 5.8, 2);
part_type_speed(particulas_rastro, -2.5, -2.5, 0.15, 0);
part_type_direction(particulas_rastro, 0, 0, 0, 0);
part_type_gravity(particulas_rastro, 0, 270);
part_type_orientation(particulas_rastro, 0, 0, 0, 0, true);
part_type_color1(particulas_rastro, COLOR_AZUL_CLARO);
part_type_alpha2(particulas_rastro, 0.6, 0);
part_type_blend(particulas_rastro, true);
part_type_life(particulas_rastro, 12, 12);

audio_quejido = snd_quejido_sonic;

audio_homing_dash = snd_homing_attack;

velocidad_homing_attack = 10.5;

audio_festejo = snd_festejo_sonic;

audio_muerte = snd_muerte_sonic;
