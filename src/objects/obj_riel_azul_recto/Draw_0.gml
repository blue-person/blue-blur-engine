if (jugador_existe) {
    if (jugador.capa_actual == "frontal") {
		gpu_set_blendmode(bm_max);
        draw_self();
        gpu_set_blendmode(bm_normal);
    }
}