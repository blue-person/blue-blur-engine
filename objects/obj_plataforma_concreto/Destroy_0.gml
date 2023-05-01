dibujar_efectos(spr_explosion_itembox, 0, 1, 1, false);
audio_play_sound(snd_romper_concreto, 1, false);

efecto_haptico_colision();

global.puntaje_cool += 5;