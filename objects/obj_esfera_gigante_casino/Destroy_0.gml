// Efectos visuales de explosion
instance_create_depth(x + 30, y, -10, obj_efecto_explosion_silenciosa)
instance_create_depth(x - 30, y, -10, obj_efecto_explosion_silenciosa)
instance_create_depth(x, y + 30, -10, obj_efecto_explosion_silenciosa)
instance_create_depth(x, y - 30, -10, obj_efecto_explosion_silenciosa)

// Detener el sonido de la esfera al rodar 
if (audio_is_playing(snd_esfera_gigante_rodando)) {
	audio_stop_sound(snd_esfera_gigante_rodando);
}

// Efectos de audio para la explosion
audio_play_sound(snd_explosion_reducida, 1, false);
audio_play_sound(snd_explosion_grande, 1, false);