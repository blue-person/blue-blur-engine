function gestion_uso_zipline() {
	if (accion == 32) {
        direccion_horizontal = 1;
        velocidad_vertical = 0;

        y = instance_nearest(x, y, obj_activador_zipline).y + 2;
        velocidad_horizontal += 0.125;
    }
	
	if (accion == 32.5) {
        velocidad_horizontal = 0;
        velocidad_vertical = 0;

        var final_zipline_cercano = instance_nearest(x, y, obj_final_zipline);
        move_towards_point(final_zipline_cercano.x, final_zipline_cercano.y - 12, velocidad_zipline);

        if (velocidad_zipline < limite_velocidad_maxima) {
            velocidad_zipline += 0.125;
        }

        if (instance_exists(obj_efecto_boost)) {
            velocidad_zipline = limite_velocidad_maxima;
        }
    }
}