// Establecer el sprite por defecto
if (not permitir_movimiento) {
    sprite_index = spr_sonic_normal
    exit;
}

// Heredar datos del objeto padre
event_inherited();

// Reproducir sonidos de pisadas
if ((accion == 0) and (sprite_index != spr_sonic_normal) and tocando_suelo and !zona_superada) {
    sonido_pisadas_general(sonido_pisada_a, sonido_pisada_b);
}

// Gestionar los movimientos del personaje
if (not zona_superada) {
	gestion_movimiento_sonic();
} else {
    accion = 0;
    direccion_horizontal = 1;
	
    if (abs(velocidad_horizontal) < 9) {
		velocidad_horizontal += aceleracion;
	}
}