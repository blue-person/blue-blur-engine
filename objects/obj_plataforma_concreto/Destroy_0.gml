dibujar_efectos(spr_explosion_itembox, 0, 1, 1, false);
audio.reproducir_audio(snd_romper_concreto);

efecto_haptico_colision();

global.puntaje_cool += 5;