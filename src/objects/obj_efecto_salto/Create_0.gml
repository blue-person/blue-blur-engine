depth = Profundidades.Jugador - 1;
image_xscale = obj_jugador.direccion_horizontal;
image_alpha = 0.75;

sprite_index = obj_jugador.sprite_efecto_salto.sprite_aura;
sprite_aterrizar = obj_jugador.sprite_efecto_salto.sprite_aterrizar;

audio.reproducir_audio(snd_vuelta_aerea);