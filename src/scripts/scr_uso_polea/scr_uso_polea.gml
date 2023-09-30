function gestion_uso_polea() {
	if (accion == 27) {
        var polea_cercana = instance_nearest(x, y, obj_manija_polea);
        x = polea_cercana.x
        y = polea_cercana.y + polea_cercana.vspeed;

        velocidad_vertical = 0;
        velocidad_horizontal = 0;
    }
}