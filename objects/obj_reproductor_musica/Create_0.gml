cancion_nivel = -1;
duracion_intro = -1;
duracion_repeticion = -1;
duracion_total = -1;
pos_playlist = -1;

switch (room) {
    case rm_hub_world:
		cancion_nivel = reproducir_cancion(msc_stardust_speedway);
		duracion_intro = 24.65;
		duracion_repeticion = 86.01 - duracion_intro;
        break;
	case rm_emerald_valley:
		cancion_nivel = reproducir_cancion(msc_quartz_quadrant);
		duracion_intro = 14.90;
		duracion_repeticion = 108 - duracion_intro;
        break;
    case rm_groovy_badlands:
		cancion_nivel = reproducir_cancion(msc_wild_groovy);
		duracion_intro = 75;
		duracion_repeticion = 138.03 - duracion_intro;
        break;
	case rm_luminous_bingo:
		cancion_nivel = reproducir_cancion(msc_luminous_bingo);
		duracion_intro = 8.5;
		duracion_repeticion = 108.97 - duracion_intro;
        break;
	case rm_mining_mayhem:
		cancion_nivel = reproducir_cancion(msc_planet_wisp);
		duracion_intro = 14.6;
		duracion_repeticion = 160.5 - duracion_intro;
        break;
    case rm_practice_zone:
		cancion_nivel = reproducir_cancion(msc_tidal_tempest);
		duracion_intro = 56.56;
		duracion_repeticion = 188.36 - duracion_intro;
        break;
}
duracion_total = duracion_intro + duracion_repeticion;