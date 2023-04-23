// Variables generales
permitir_uso_controles = true;

// Variables de botones
boton_salto = new Boton(0, vk_space, gp_face1);
boton_boost = new Boton(1, ord("Z"), gp_face3);
boton_ataque = new Boton(2, ord("X"), gp_face2);
boton_especial = new Boton(3, ord("C"), gp_face4);
boton_izquierda = new Boton(4, vk_left);
boton_abajo = new Boton(5, vk_down);
boton_arriba = new Boton(6, vk_up);
boton_derecha = new Boton(7, vk_right);
boton_entrada = new Boton(8, vk_enter, gp_start);

// Lista de botones
lista_total_botones = [boton_salto, boton_boost, boton_ataque, boton_especial, boton_izquierda, boton_abajo, boton_arriba, boton_derecha, boton_entrada];
lista_botones_gamepad = [boton_salto, boton_boost, boton_ataque, boton_especial, boton_entrada];
