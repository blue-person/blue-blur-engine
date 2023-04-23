if (instance_exists(obj_jugador)) {
    if (obj_jugador.capa_nivel == 0) {
        gpu_set_blendmode(bm_max);
        draw_self();
        draw_self();
        gpu_set_blendmode(bm_normal);
    }
}