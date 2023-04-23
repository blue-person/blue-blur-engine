x = obj_jugador.x;    
y = obj_jugador.y;

image_angle = obj_jugador.direccion_aura_boost;
image_yscale = obj_jugador.direccion_horizontal;

switch (obj_jugador.accion) {
    case 11:
        sprite_index = spr_chispas_riel_a;
        break;
    case 16.5:
        sprite_index = spr_chispas_riel_b;
        break;
	default:
		instance_destroy();
		break;
}
