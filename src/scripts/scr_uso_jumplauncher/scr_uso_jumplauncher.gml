function gestion_uso_jumplauncher() {
	var canon_mas_cercano = instance_nearest(x, y, obj_canon);
	
	if (accion >= 35 and accion < 36) {
        tocando_suelo = false;
    }

    if (accion == 35) {
        velocidad_vertical = 0;
        velocidad_horizontal = 0;

        y = canon_mas_cercano.y;
        move_towards_point(canon_mas_cercano.x, canon_mas_cercano.y, 3);

        if (distance_to_point(canon_mas_cercano.x, canon_mas_cercano.y) < 2) {
            accion = 35.1;
            canon_mas_cercano.alarm[0] = 60;
        }
    }

    if (accion == 35.1) {
        x = canon_mas_cercano.x;
        y = canon_mas_cercano.y;

        velocidad_horizontal = 0;
        velocidad_vertical = 0;
    }

    if (accion == 35.2) {
        if ((velocidad_vertical >= 2) or tocando_suelo) {
            accion = 0;
        }
    }
}