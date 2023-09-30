event_inherited();

if (permitir_ser_apuntado and (other.accion != 26)) {
    other.image_index = 0;
    other.accion = 12;
    permitir_ser_apuntado = false;
}
