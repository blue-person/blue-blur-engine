function fisicas_esfera_casino() {
	var mascara = 50;

	// Establecer los limites de velocidad de la pelota de bingo
    if (velocidad_horizontal > limite_velocidad_horizontal) then velocidad_horizontal = limite_velocidad_horizontal;
    if (velocidad_horizontal < -limite_velocidad_horizontal) then velocidad_horizontal = -limite_velocidad_horizontal;
    if (velocidad_vertical > limite_velocidad_vertical) then velocidad_vertical = limite_velocidad_vertical;
    if (velocidad_vertical < -limite_velocidad_vertical) then velocidad_vertical = -limite_velocidad_vertical;

	// Velocidad horizontal
	if (velocidad_horizontal > 0) {
	    for (var n = 0; n < velocidad_horizontal and !colision_circular_derecha(mascara); ++n) {
	        x += acos;
	        y -= asin;    
	    }
	}

	if (velocidad_horizontal < 0) {
	    for (var n = 0; n > velocidad_horizontal and !colision_circular_izquierda(mascara); --n) {
	        x -= acos;
	        y += asin;
	    }
	}

	// Velocidad vertical
	if (velocidad_vertical > 0) {
	    for (var n = 0; n < velocidad_vertical and!colision_circular_inferior(mascara); ++n) {
	        y += 1;
	    }
	}

	if (velocidad_vertical < 0) {
	    for (var n = 0; n > velocidad_vertical and !colision_circular_superior(mascara); --n) {
	        y -= 1;
	    }
	}

	// Aterrizar en el suelo
	if (velocidad_vertical >= 0 and !tocando_suelo and colision_circular_inferior(mascara) and (colision_lineal_izquierda(mascara) or colision_lineal_derecha(mascara))) {
	    angulo = calcular_angulo(angulo, mascara,mascara);
		acos = dcos(angulo);
		asin = dsin(angulo);
    
	    velocidad_horizontal -= asin * velocidad_vertical * 2;
	    velocidad_vertical = 0;
	    tocando_suelo = true;
	}

	// Mantener en el suelo
	if (tocando_suelo) {
	    while (colision_circular_principal(mascara)) {
	        x -= asin;
	        y -= acos;
	    }

	    while (!colision_circular_principal(mascara) and colision_con_suelo(mascara)) {
	        x += asin;
	        y += acos;
	    }

		var pos_x = x + asin * mascara;
        var pos_y = y + acos * mascara;
        if (!collision_point(pos_x, pos_y, obj_superficie, true, true) or (!collision_point(pos_x, pos_y, obj_superficie_posterior, true, true) and capa_nivel == 0) or (!collision_point(pos_x, pos_y, obj_superficie_frontal, true, true) and capa_nivel == 1) or (!collision_point(pos_x, pos_y, obj_riel, true, true) and permitir_grinding)) {
            x += asin;
            y += acos;
        } else {
            x -= asin;
            y -= acos;
        }
	}

	// Dejar de estar en el suelo
	if (!colision_lineal_izquierda(mascara) or !colision_lineal_derecha(mascara)) and !colision_circular_inferior(mascara) and tocando_suelo  and !collision_line(x,y,x+mascara+4*asin,y+mascara+4*acos,obj_superficie,true,true) {   
	    velocidad_vertical = -asin * velocidad_horizontal;
	    velocidad_horizontal = acos * velocidad_horizontal; 
    
	    angulo = 0;
	    asin = 0;
	    acos = 1;
		tocando_suelo = false;
	}

	// Colisionar con las paredes
	while (colision_circular_derecha(mascara)) {
	    x -= acos;
	    y += asin;
	    velocidad_horizontal = 0;
	}

	while (colision_circular_izquierda(mascara)) {
	    x += acos;
	    y -= asin;
	    velocidad_horizontal = 0;
	}

	// Establecer gravedad
	if (!tocando_suelo) {
        velocidad_vertical += gravedad;
    }

	// Velocidad segun el angulo con el suelo
	if (angulo > 70 and angulo < 290 and abs(velocidad_horizontal) < 1.5 and accion != 11){
	    x -= asin * 5;
	    y -= acos * 5;
	    angulo = 0;

	    velocidad_vertical = -asin * velocidad_horizontal;
	    velocidad_horizontal = acos * velocidad_horizontal;
	    tocando_suelo = false;
	}

	// Pendiente del suelo
	if (tocando_suelo and (colision_lineal_izquierda(mascara) and colision_lineal_derecha(mascara))) {
		angulo = calcular_angulo(angulo, mascara, mascara + 11);
	}

	acos = dcos(angulo);
	asin = dsin(angulo);
}