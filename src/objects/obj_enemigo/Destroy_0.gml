audio.reproducir_audio(snd_explosion_reducida);
instance_create_depth(x, y, -10, obj_efecto_explosion_reducida);
instance_create_depth(x, y, 0, obj_particula_energia_boost);

if (recibio_golpe) {
    global.puntaje_cool += 300;
}