if (!place_meeting(x, y, obj_jugador)) {
	activar_evento = true;
}

var panel_cercano = instance_nearest(x, y, obj_jump_panel_1);
image_angle = point_direction(x, y, panel_cercano.x, panel_cercano.y);