if (audio_is_playing(cancion_nivel)) {
	pos_playlist = audio_sound_get_track_position(cancion_nivel);
	
	if (pos_playlist > duracion_total) {
		audio_sound_set_track_position(cancion_nivel, pos_playlist - duracion_repeticion);
	}
} else {
	audio_play_sound(cancion_nivel, 0, false);
	audio_sound_set_track_position(cancion_nivel, pos_playlist - duracion_repeticion);
}