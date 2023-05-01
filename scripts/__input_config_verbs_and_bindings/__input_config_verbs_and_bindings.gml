//Input defines the default profiles as a macro called 
//This macro is parsed when Input boots up and provides the baseline bindings for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The root struct called INPUT_DEFAULT_PROFILES contains the names of each default profile
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

INPUT_DEFAULT_PROFILES = {
    keyboard_and_mouse: {
        boton_salto: input_binding_key(vk_space),
        boton_boost: input_binding_key("Z"),
        boton_ataque: input_binding_key("X"),
        boton_especial: input_binding_key("C"),
        boton_izquierda: input_binding_key(vk_left),
        boton_abajo: input_binding_key(vk_down),
        boton_arriba: input_binding_key(vk_up),
        boton_derecha: input_binding_key(vk_right),
        boton_entrada: input_binding_key(vk_enter)
    },
    gamepad: {
        boton_salto: input_binding_gamepad_button(gp_face1),
        boton_boost: input_binding_gamepad_button(gp_face3),
        boton_ataque: input_binding_gamepad_button(gp_face2),
        boton_especial: input_binding_gamepad_button(gp_face4),
        boton_izquierda: [input_binding_gamepad_button(gp_padl), input_binding_gamepad_axis(gp_axislh, true)],
        boton_abajo: [input_binding_gamepad_button(gp_padd), input_binding_gamepad_axis(gp_axislv, false)],
        boton_arriba: [input_binding_gamepad_button(gp_padu), input_binding_gamepad_axis(gp_axislv, true)],
        boton_derecha: [input_binding_gamepad_button(gp_padr), input_binding_gamepad_axis(gp_axislh, false)],
        boton_entrada: input_binding_gamepad_button(gp_start)
    }
}

//Defines which verbs should collide with which other verbs when using input_binding_get_collisions()
//and input_binding_set_safe(). A verb that is not present in a group will collide with all other verbs
INPUT_VERB_GROUPS = {
    //Fill me up!
};