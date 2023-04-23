if ((other.accion == 32) and activar_evento and (x <= other.x)) {
    other.x = x;
    activar_evento = false;
    other.accion = 32.5;
    other.velocidad_zipline = other.velocidad_horizontal;
    other.velocidad_horizontal = 0;
    other.velocidad_vertical = 0;
}