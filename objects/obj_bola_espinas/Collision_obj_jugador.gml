if (other.permitir_ser_apuntado) {
    if (instance_exists(obj_efecto_boost)) {
        instance_destroy(obj_efecto_boost);
    }
	
    herir_jugador();
}