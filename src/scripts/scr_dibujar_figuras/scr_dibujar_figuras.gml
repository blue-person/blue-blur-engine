function dibujar_circulo_progreso(pos_x, pos_y, valor, valor_maximo, color, radio, transparencia, ancho) {
    if (valor > 0) {
        var cantidad_secciones = 120;
        var magnitud_secciones = 360 / cantidad_secciones;

        var contador = (valor / valor_maximo) * cantidad_secciones

        if (contador > 1) {
            superficie_circulo = surface_create(radio * 2, radio * 2);
            draw_set_colour(color);
            draw_set_alpha(transparencia);
            surface_set_target(superficie_circulo);

            draw_clear_alpha(c_blue, 0.7);
            draw_clear_alpha(c_black, 0);

            draw_primitive_begin(pr_trianglefan);
	        draw_vertex(radio, radio);

            for (var n = 0; n <= contador; n++) {
                var longitud = n * magnitud_secciones + 90;
                var altura_triangulo = lengthdir_x(radio, longitud);
                var ancho_triangulo = lengthdir_y(radio, longitud);
                draw_vertex(radio + altura_triangulo, radio + ancho_triangulo);
            }

            draw_primitive_end();
	        draw_set_alpha(1);
        
	        gpu_set_blendmode(bm_subtract);
	        draw_set_colour(c_black);
	        draw_circle(radio - 1, radio - 1, radio - ancho, false);
	        gpu_set_blendmode(bm_normal);

	        surface_reset_target()
     
	        draw_surface(superficie_circulo, pos_x - radio, pos_y - radio);
	        surface_free(superficie_circulo);
        }
    }
}
