if (instance_exists(obj_jugador)) {
	var posicion = obj_jugador.y + obj_jugador.sprite_height / 2.5;
	
    if (round(posicion) > y) {
		mask_index = -1;
	} else {
        mask_index = sprite;
	}
}
