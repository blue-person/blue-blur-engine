// Efectos visuales de explosion
instance_create_depth(x + 30, y, -10, obj_efecto_explosion_silenciosa)
instance_create_depth(x - 30, y, -10, obj_efecto_explosion_silenciosa)
instance_create_depth(x, y + 30, -10, obj_efecto_explosion_silenciosa)
instance_create_depth(x, y - 30, -10, obj_efecto_explosion_silenciosa)

// Detener el sonido de la esfera al rodar 
audio.detener_audio(snd_esfera_gigante_rodando);

// Efectos de audio para la explosion
audio.reproducir_audio(snd_explosion_reducida);
audio.reproducir_audio(snd_explosion_grande);