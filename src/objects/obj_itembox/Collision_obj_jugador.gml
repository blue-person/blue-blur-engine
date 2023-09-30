if (other.accion == 4) {
    other.accion = 0;
    other.hspeed = 0;
    other.vspeed = 0;
    other.x = x;
    other.velocidad_horizontal = 0;
    other.velocidad_vertical = -5;
} else if (!other.tocando_suelo) {
	other.velocidad_vertical = -5;
}

instance_destroy();
