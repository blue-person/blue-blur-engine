if (place_meeting(x - dsin(image_angle) * 8, y - dcos(image_angle) * 8, other)) {
    if (other.permitir_ser_apuntado) {
        herir_jugador();
    }
}