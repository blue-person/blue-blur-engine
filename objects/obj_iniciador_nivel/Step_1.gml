// Gestionar las propiedades del nivel actual
switch (room) {
	case rm_hub_world:
		gestion_fondo_hub_world();
		break;
	case rm_practice_zone:
		gestion_fondo_practice_zone();
		break;
	case rm_emerald_valley:
		gestion_fondo_emerald_valley();
		break;
	case rm_groovy_badlands:
		gestion_fondo_groovy_badlands();
        break;
	case rm_luminous_bingo:
		gestion_fondo_luminous_bingo();
		break;
	case rm_mining_mayhem:
		gestion_fondo_mining_mayhem();
		break;
}