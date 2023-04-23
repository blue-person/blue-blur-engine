event_inherited();

if (permitir_ser_apuntado) {
    if (!collision_line(x, y, x, y + sprite_height / 2 + 1, obj_superficie, true, true)) {
        ++y;
    }

    if (accion == 2) {
        hspeed = image_xscale * 2;
        sprite_index = spr_eggpawn_obrero_caminando;
	} else {
        hspeed = 0;
        sprite_index = spr_eggpawn_obrero_normal;
    }
	
    if (!collision_point(x + image_xscale * sprite_width / 2, y + 17, obj_superficie, true, true) or collision_point(x + image_xscale * sprite_width, y, obj_superficie, true, true)) {
        accion = 1;
        alarm[1] = 120;
    }
}
