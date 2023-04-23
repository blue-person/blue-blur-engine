dibujar_efectos(spr_explosion_itembox, 0, 1, 1, false, x, y);
dibujar_efectos(spr_explosion_itembox, 0, 1, 1, false, x, y - 8);
dibujar_efectos(spr_explosion_itembox, 0, 1, 1, false, x, y + 8);

audio_play_sound(snd_romper_concreto, 1, false);

sacudir_camara(6, 25);
if (determinar_tipo_controles() != "teclado") then vibrar_gamepad(15);

global.puntaje_cool += 5;