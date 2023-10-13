function gestion_uso_jumplauncher() {
	// Variables
    var jump_launcher = instance_nearest(x, y, obj_jump_launcher);
	
    // Gestionar si se toca el suelo
	if (accion >= 35 and accion < 36) {
        tocando_suelo = false;
    }

    // Gestionar la accion inicial
    if (accion == 35) {
        // Ajustar parametros
        angulo = 0;
		velocidad_vertical = 0;
        velocidad_horizontal = 0;

        // Eliminar boost
        var efecto_boost = instance_find(obj_efecto_boost, 0);
        if (efecto_boost != noone) then instance_destroy(efecto_boost);

        // Mover hacia el jump launcher
        move_towards_point(jump_launcher.x, jump_launcher.y, 3);

        // Ajustar parametros al estar cerca
        var distancia_al_launcher = distance_to_point(jump_launcher.x, jump_launcher.y);
        if (distancia_al_launcher <= 2) {
            accion = 35.1;
            jump_launcher.alarm[0] = 60;
        }
    }

    // Gestionar la accion intermedia
    if (accion == 35.1) {
        x = jump_launcher.x;
        y = jump_launcher.y;
        velocidad_horizontal = 0;
        velocidad_vertical = 0;
    }

    // Gestionar la accion final
    if ((accion == 35.2) and (tocando_suelo or (velocidad_vertical >= 2))) {
        accion = 0;
    }
}