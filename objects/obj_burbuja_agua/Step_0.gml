if (place_meeting(x, y, obj_water)) {
	if (image_alpha < 1) {
		image_alpha += 0.0625;
	}

	if (place_meeting(x, y, obj_superficie_agua)) {
		instance_destroy();
	}
}