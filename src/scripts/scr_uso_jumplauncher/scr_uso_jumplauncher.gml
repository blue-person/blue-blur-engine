function gestion_uso_jumplauncher() {
	// Variables
    var jump_launcher = instance_nearest(x, y, obj_jump_launcher);

    // Gestionar la accion inicial
    if (accion == 35) {
        // Ajustar parametros
        angulo = 0;
        tocando_suelo = false;
		velocidad_vertical = 0;
        velocidad_horizontal = 0;
		permitir_uso_boost = false;

        // Mover hacia el jump launcher
        move_towards_point(jump_launcher.x, jump_launcher.y, 3);

        // Ajustar parametros al estar cerca
        var distancia_al_launcher = distance_to_point(jump_launcher.x, jump_launcher.y);
        if (distancia_al_launcher <= 2) {
            accion = 35.1;
            jump_launcher.alarm[0] = 60;	
        }
		
		// Salir del evento
		exit;
    } else if (accion == 35.1) {
		// Ajustar posicion
        x = jump_launcher.x;
        y = jump_launcher.y;
		
		// Salir del evento
		exit;
    } else if ((accion == 35.2) and (tocando_suelo or (velocidad_vertical >= 2))) {
		// Modificar accion
        accion = 0;
		
		// Salir del evento
		exit;
    }
}