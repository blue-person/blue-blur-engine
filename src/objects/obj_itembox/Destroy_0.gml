// Crear el item
if (item != noone) {
	instance_create_depth(x, y, Profundidades.Interfaz, item);
}

// Crear una explosion sencilla
var efecto = instance_create_depth(x, y, Profundidades.Efectos, obj_efecto_generico);
with (efecto) {
    image_speed = 0.5;
    sprite_index = spr_explosion_itembox;
	audio.reproducir_audio(snd_explosion_itembox);
	permitir_combinar_imagen = false;
}