depth = obj_jugador.depth - 1;
image_xscale = obj_jugador.direccion_horizontal;
image_alpha = 0.75;

switch (global.personaje_actual) {
    case "Sonic":
        sprite_index = spr_efecto_salto_sonic;
		sprite_aterrizar = spr_sonic_aterrizar;
        break;
    case "Shadow":
        sprite_index = spr_efecto_salto_shadow;
		sprite_aterrizar = spr_shadow_aterrizar;
        break;
}

audio_play_sound(snd_vuelta_aerea, 1, false);