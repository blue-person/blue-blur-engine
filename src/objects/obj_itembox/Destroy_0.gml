// Crear el item
if (item != noone) {
	crear_elemento_gui(x, y, item);
}

// Crear una explosion sencilla
var efecto = crear_efecto(x, y, obj_efecto_generico);
with (efecto) {
    image_speed = 0.5;
    sprite_index = spr_explosion_itembox;
	audio.reproducir_audio(snd_explosion_itembox);
	permitir_combinar_imagen = false;
}