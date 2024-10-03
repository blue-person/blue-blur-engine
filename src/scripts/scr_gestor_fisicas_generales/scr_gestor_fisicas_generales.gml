function gestion_fisicas_entidad() {
    // Definir variables
    var pendiente = 0;

    // Establecer los límites de velocidad del movimiento de la entidad
	velocidad_horizontal = clamp(velocidad_horizontal, -limite_velocidad_maxima, limite_velocidad_maxima);
    velocidad_vertical = clamp(velocidad_vertical, -limite_velocidad_vertical, limite_velocidad_vertical);

    // Velocidad horizontal
    if (velocidad_horizontal > 0) {
        for (var n = 0; (n < velocidad_horizontal) and not colision_circular_derecha(); ++n) {
            x += acos;
            y -= asin;
        }
    } else if (velocidad_horizontal < 0) {
        for (var n = 0; (n > velocidad_horizontal) and not colision_circular_izquierda(); --n) {
            x -= acos;
            y += asin;
        }
    }

    // Velocidad vertical
    if (velocidad_vertical > 0) {
        for (var n = 0; (n < velocidad_vertical) and not colision_circular_inferior(); ++n) {
            y++;
        }
    } else if (velocidad_vertical < 0) {
        for (var n = 0; (n > velocidad_vertical) and not colision_circular_superior(); --n) {
            y--;
        }
    }

    // Aterrizar en el suelo
    if (not tocando_suelo and colision_circular_inferior() and (colision_lineal_izquierda() or colision_lineal_derecha()) and (velocidad_vertical >= 0)) {
        angulo = calcular_angulo(angulo, mascara_colision, mascara_colision);
        acos = dcos(angulo);
        asin = dsin(angulo);

        velocidad_horizontal -= (asin * velocidad_vertical * 2);
        velocidad_vertical = 0;
        tocando_suelo = true;
    }

    // Mantener en el suelo
    if (tocando_suelo) {
        while (colision_circular_central()) {
            x -= asin;
            y -= acos;
        }

        while (not colision_circular_central() and colision_con_suelo()) {
            x += asin;
            y += acos;
        }

        var pos_x = x + mascara_colision * asin;
        var pos_y = y + mascara_colision * acos;
        var sin_colision_superficie = not collision_point(pos_x, pos_y, obj_superficie, true, true);
        var sin_colision_superficie_posterior = not collision_point(pos_x, pos_y, obj_superficie_posterior, true, true) and (capa_actual == "posterior");
        var sin_colision_superficie_frontal = not collision_point(pos_x, pos_y, obj_superficie_frontal, true, true) and (capa_actual == "frontal");
        var sin_colision_riel = not collision_point(pos_x, pos_y, obj_riel, true, true) and permitir_grinding;

        if (sin_colision_superficie or sin_colision_superficie_posterior or sin_colision_superficie_frontal or sin_colision_riel) {
            x += asin;
            y += acos;
        } else {
            x -= asin;
            y -= acos;
        }
    }

    // Dejar de estar en el suelo
	var longitud_linea = mascara_colision + 4;
	var colision_superficie = collision_line(x, y, x + longitud_linea * asin, y + longitud_linea * acos, obj_superficie, true, true);
	
    if (tocando_suelo and not colision_superficie and not colision_circular_inferior() and (not colision_lineal_izquierda() or not colision_lineal_derecha())) {
        tocando_suelo = false;
        velocidad_vertical = -asin * velocidad_horizontal;
        velocidad_horizontal = acos * velocidad_horizontal;

        angulo = 0;
        asin = 0;
        acos = 1;
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
    if (not tocando_suelo) then velocidad_vertical += gravedad;

    // Velocidad según el ángulo con el suelo
    if ((angulo > 70) and (angulo < 290) and (abs(velocidad_horizontal) < 1.5) and (accion != 11)) {
        x -= asin * 5;
        y -= acos * 5;
        angulo = 0;

        velocidad_vertical = -(asin * velocidad_horizontal);
        velocidad_horizontal = acos * velocidad_horizontal;
        tocando_suelo = false;
    }

    // Pendiente del suelo cuando se está rodando
    if (accion == 0) {
        pendiente = 0.125;
    } else if (accion == 2) {
        var direccion_horizontal = sign(velocidad_horizontal);
        var direccion_arcoseno = sign(asin);

        if (direccion_horizontal == direccion_arcoseno) {
            pendiente = 0.078125
        } else {
            pendiente = 0.3125;
        }
    }

    if ((accion >= 0) and (abs(velocidad_horizontal) < limite_velocidad_maxima)) {
        velocidad_horizontal -= pendiente * asin;
    }

    if (tocando_suelo and (colision_lineal_izquierda() and colision_lineal_derecha())) {
        angulo = calcular_angulo(angulo, mascara_colision, 25);
    }

    if (not tocando_suelo and colision_circular_superior() and (velocidad_vertical < 0)) {
        var verificar_angulo = calcular_angulo(180, mascara_colision, 25);
		
        if ((verificar_angulo >= 135) and (verificar_angulo <= 170)) {
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
            angulo = 0;
            velocidad_vertical = 0;
        }
    }

    // Estandarizar valores esenciales
    acos = dcos(angulo);
    asin = dsin(angulo);
}