// Ajustar visibilidad
if (not jugador_puede_recogerlo) {    
    image_alpha -= 0.0625;
	
    if (image_alpha <= 0) then instance_destroy();
}

// Ajustar velocidad vertical
if (place_meeting(x, y + vspeed + 1, obj_superficie)) {
	vspeed *= -0.75;
}

// Ajustar velocidad horizontal   
if (place_meeting(x + hspeed + sign(hspeed), y, obj_superficie)) {
	hspeed *= -0.25;
}

// Ajustar ubicacion
while (place_meeting(x, y + 1, obj_superficie)) {
	y--;
}

// Ajustar velocidad vertical
vspeed += 0.0625