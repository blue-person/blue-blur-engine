// Heredar datos del objeto padre
event_inherited();

// Establecer el sprite por defecto
if (not permitir_movimiento) {
    sprite_index = spr_shadow_normal;
    exit;
}

// Reproducir sonidos de pisadas
if ((sprite_index == spr_shadow_patinando_a) or (sprite_index == spr_shadow_patinando_b)) {
    sonido_pisada_a = snd_propulsores_a;
    sonido_pisada_b = snd_propulsores_b;
}

if ((accion == 0) and (sprite_index != spr_shadow_normal) and (tocando_suelo) and (!zona_superada) and (!((sprite_index == spr_shadow_patinando_b) or (sprite_index == spr_shadow_patinando_a) or (sprite_index == spr_shadow_volando)))) {
    sonido_pisadas_general(sonido_pisada_a, sonido_pisada_b);
} else {
    sonido_pisadas_shadow(sonido_pisada_a, sonido_pisada_b);
}