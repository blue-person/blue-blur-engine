if (!permitir_ser_apuntado) {
    if (hspeed >= 0) {
		image_angle += 25;
	} else {
		image_angle -= 25;
	}
	
    if (collision_circle(x, y - 5, 8, obj_superficie, true, true)) {
		instance_destroy();
	}
}
