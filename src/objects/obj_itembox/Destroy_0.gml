var efecto = instance_create_depth(x, y, -10, obj_efecto_generico)
with (efecto) {
    permitir_combinar_imagen = false;
    sprite_index = spr_explosion_itembox;
    image_speed = 0.5;
    depth = -2;
}

if (item != noone) {
	instance_create_depth(x, y, 0, item);
}

audio.reproducir_audio(snd_explosion_itembox);
