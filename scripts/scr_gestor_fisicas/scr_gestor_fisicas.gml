function gestor_principal_fisicas(entidad) {
	// Definir variables
	var pendiente = 0.125;
	
	// Gestionar las fisicas de la entidad
	with (entidad) {
		// Establecer los limites de velocidad del movimiento de la entidad
	    if (abs(velocidad_horizontal) > limite_velocidad_horizontal) {
			velocidad_horizontal = sign(velocidad_horizontal) * limite_velocidad_horizontal;
		}
	    
		if (abs(velocidad_vertical) > limite_velocidad_vertical) { 
			velocidad_vertical = sign(velocidad_vertical) * limite_velocidad_vertical;
		}

	    // Velocidad horizontal
	    if (velocidad_horizontal > 0) {
	        for (var n = 0; (n < velocidad_horizontal) and !colision_circular_derecha(); n++) {
	            x += acos;
	            y -= asin;
	        }
	    }

	    if (velocidad_horizontal < 0) {
	        for (var n = 0; (n > velocidad_horizontal) and !colision_circular_izquierda(); n--) {
	            x -= acos;
	            y += asin;
	        }
	    }

	    // Velocidad vertical
	    if (velocidad_vertical > 0) {
	        for (var n = 0; (n < velocidad_vertical) and !colision_circular_inferior(); n++) {
	            y++;
	        }
	    }

	    if (velocidad_vertical < 0) {
	        for (var n = 0; (n > velocidad_vertical) and !colision_circular_superior(); n--) {
	            --y;
	        }
	    }

	    // Aterrizar en el suelo
	    if ((velocidad_vertical >= 0) and !tocando_suelo and colision_circular_inferior() and (colision_lineal_izquierda() or colision_lineal_derecha())) {
	        angulo = calcular_angulo(angulo, mascara_colision, mascara_colision);
	        acos = dcos(angulo);
	        asin = dsin(angulo);

	        velocidad_horizontal -= (asin * velocidad_vertical * 2);
	        velocidad_vertical = 0;
	        tocando_suelo = true;
	    }

	    // Mantener en el suelo
	    if (tocando_suelo) {
	        while (colision_circular_principal()) {
	            x -= asin;
	            y -= acos;
	        }

	        while (!colision_circular_principal() and colision_con_suelo()) {
	            x += asin;
	            y += acos;
	        }

	        var punto_x = x + mascara_colision * asin;
	        var punto_y = y + mascara_colision * acos;
	        var sin_colision_superficie = !collision_point(punto_x, punto_y, obj_superficie, true, true);
	        var sin_colision_superficie_posterior = !collision_point(punto_x, punto_y, obj_superficie_posterior, true, true) and (capa_actual == "posterior");
	        var sin_colision_superficie_frontal = !collision_point(punto_x, punto_y, obj_superficie_frontal, true, true) and (capa_actual == "frontal");
	        var sin_colision_riel = !collision_point(punto_x, punto_y, obj_riel, true, true) and permitir_grinding;

	        if (sin_colision_superficie or sin_colision_superficie_posterior or sin_colision_superficie_frontal or sin_colision_riel) {
	            x += asin;
	            y += acos;
	        } else {
	            x -= asin;
	            y -= acos;
	        }
	    }

	    // Dejar de estar en el suelo
	    if ((!colision_lineal_izquierda() or !colision_lineal_derecha()) and !colision_circular_inferior() and tocando_suelo and !collision_line(x, y, x + (mascara_colision + 4) * asin, y + (mascara_colision + 4) * acos, obj_superficie, true, true)) {
	        velocidad_vertical = -asin * velocidad_horizontal;
	        velocidad_horizontal = acos * velocidad_horizontal;

	        angulo = 0;
	        asin = 0;
	        acos = 1;
	        tocando_suelo = false;
	    }

	    // Colisionar con las paredes
	    while (colision_circular_derecha()) {
	        x -= acos;
	        y += asin;
	        velocidad_horizontal = 0;
	    }

	    while (colision_circular_izquierda()) {
	        x += acos;
	        y -= asin;
	        velocidad_horizontal = 0;
	    }

	    // Hacer que la velocidad vertical se afecte por la gravedad
	    if (!tocando_suelo) then velocidad_vertical += gravedad;

	    // Velocidad segun el angulo con el suelo
	    if ((angulo > 70) and (angulo < 290) and (abs(velocidad_horizontal) < 1.5) and (accion != 11)) {
	        x -= asin * 5;
	        y -= acos * 5;
	        angulo = 0;

	        velocidad_vertical = -(asin * velocidad_horizontal);
	        velocidad_horizontal = acos * velocidad_horizontal;
	        tocando_suelo = false;
	    }

	    // Pendiente del suelo cuando se esta rodando
		if (accion == 2) {
			var direccion_horizontal = sign(velocidad_horizontal);
			var direccion_arcoseno = sign(asin);
		
			if (direccion_horizontal == direccion_arcoseno) then pendiente = 0.078125 else pendiente = 0.3125;
		}

	    if ((accion >= 0) and (abs(velocidad_horizontal) < limite_velocidad_horizontal)) then velocidad_horizontal -= pendiente * asin;

	    if (tocando_suelo and (colision_lineal_izquierda() and colision_lineal_derecha())) then angulo = calcular_angulo(angulo, mascara_colision, 25);

	    if (!tocando_suelo and colision_circular_superior() and (velocidad_vertical < 0)) {
	        var verificar_angulo = calcular_angulo(180, mascara_colision, 25);

	        if ((verificar_angulo >= 125) and (verificar_angulo <= 170)) {
	            velocidad_horizontal = -velocidad_vertical;
	            velocidad_vertical = 0;

	            angulo = verificar_angulo;
	            accion = 0;
	        } else if ((verificar_angulo >= 190) and (verificar_angulo <= 235)) {
	            velocidad_horizontal = velocidad_vertical;
	            velocidad_vertical = 0;

	            angulo = verificar_angulo;
	            accion = 0;
	        } else {
	            velocidad_vertical = 0;
	            angulo = 0;
	        }
	    }
		
		// Estandarizar valores esenciales
	    acos = dcos(angulo);
	    asin = dsin(angulo);
		x = redondear_valor(x);
		y = redondear_valor(y);
	}
}