// Heredar datos del objeto padre
event_inherited();

// Establecer el sprite por defecto
if (not permitir_movimiento) {
    sprite_index = spr_sonic_normal
    exit;
}

// Reproducir sonidos de pisadas
if ((accion == 0) and (sprite_index != spr_sonic_normal) and tocando_suelo and !zona_superada) {
    sonido_pisadas_general(sonido_pisada_a, sonido_pisada_b);
}