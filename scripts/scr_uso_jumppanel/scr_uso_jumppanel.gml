function gestion_uso_jumppanel() {
	// Impulsar hacia jump panel
    if (accion == 24) {
        var velocidad_impulso = 15;
        var jump_panel_requerido;

        velocidad_horizontal = 0;
        velocidad_vertical = 0;

        switch (jump_panel) {
            case 1:
                jump_panel_requerido = instance_nearest(x, y, obj_jump_panel_1);
                break;
            case 2:
                jump_panel_requerido = instance_nearest(x, y, obj_jump_panel_2);
                break;
            case 3:
                jump_panel_requerido = instance_nearest(x, y, obj_jump_panel_3);
                break;
            case 4:
                jump_panel_requerido = instance_nearest(x, y, obj_jump_panel_4);
                break;
            case 5:
                jump_panel_requerido = instance_nearest(x, y, obj_jump_panel_final);
                break;
        }

        move_towards_point(jump_panel_requerido.x, jump_panel_requerido.y, velocidad_impulso);
        if (x > jump_panel_requerido.x) {
            direccion_horizontal = -1;
        } else if (x < jump_panel_requerido.x) {
            direccion_horizontal = 1;
        }

        if (tocando_suelo or place_meeting(x, y, obj_jump_panel_final)) {
            accion = 0;
            velocidad_horizontal = direccion_horizontal * 5;
            jump_panel = 1;
        }
    }

    // Mantener pegado al jump panel
    if (accion == 25) {
        hspeed = 0;
        vspeed = 0;

        velocidad_horizontal = 0;
        velocidad_vertical = 0;

        var jump_panel_cercano = instance_nearest(x, y, obj_jump_panel);
        x = jump_panel_cercano.x - dsin(jump_panel_cercano.image_angle) * 4;
        y = jump_panel_cercano.y - dcos(jump_panel_cercano.image_angle) * 4;
    }
}