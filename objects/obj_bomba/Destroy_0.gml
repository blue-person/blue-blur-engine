audio.reproducir_audio(snd_explosion_reducida);
instance_create_depth(x + 5, y, -10, obj_efecto_explosion_reducida);
instance_create_depth(x - 5, y, -10, obj_efecto_explosion_reducida);
instance_create_depth(x, y, 0, obj_particula_energia_boost);

if (instance_exists(obj_efecto_boost)) {
	instance_destroy(obj_efecto_boost);
}