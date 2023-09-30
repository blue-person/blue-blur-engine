if (!visibilidad) {
    if ((sprite_index == -1) and !ds_queue_empty(global.queue)) {
        sprite_index = ds_queue_dequeue(global.queue);
        visibilidad = true;
    } else {
        image_alpha -= 0.1;
		
        if (image_alpha <= 0) {
			sprite = -1;
		}
    } 
} else {
    image_alpha += 0.1;
	
    if (image_alpha == 0.9) {
		var tiempo_visibilidad = 90;
		alarm[0] = tiempo_visibilidad;
	}
}
