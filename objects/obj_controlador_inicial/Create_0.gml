// Profundidades de dibujado
#macro PROFUNDIDAD_GESTORES 0
#macro PROFUNDIDAD_CONTROLADORES 0
	
// Prioridades de sonidos
#macro PRIORIDAD_CANCIONES 0
#macro PRIORIDAD_SONIDOS 1

// Colores
#macro COLOR_BLANCO make_color_rgb(255, 255, 255)
#macro COLOR_AZUL_CLARO make_color_rgb(78, 194, 252)
#macro COLOR_AZUL_NORMAL make_color_rgb(33, 74, 223)
#macro COLOR_NARANJA_CLARO make_color_rgb(255, 160, 64)
#macro COLOR_NARANJA_NORMAL make_color_rgb(218, 84, 69)

// Gestor de pantalla
global.gestor_pantalla = instance_create_depth(0, 0, PROFUNDIDAD_GESTORES, obj_gestor_pantalla);
#macro pantalla global.gestor_pantalla

// Gestor de audio
global.gestor_audio = instance_create_depth(0, 0, PROFUNDIDAD_GESTORES, obj_gestor_audio);
#macro audio global.gestor_audio

// Gestor de controles
global.gestor_controles = instance_create_depth(0, 0, PROFUNDIDAD_GESTORES, obj_gestor_controles);
#macro control global.gestor_controles

// Gestor de texto
global.gestor_texto = instance_create_depth(0, 0, PROFUNDIDAD_GESTORES, obj_gestor_texto);
#macro texto global.gestor_texto

// Gestor del nivel actual
global.gestor_nivel = instance_create_depth(0, 0, PROFUNDIDAD_GESTORES, obj_gestor_nivel);
#macro nivel global.gestor_nivel

// Controlador del modo debug
global.controlador_depuracion = instance_create_depth(0, 0, PROFUNDIDAD_CONTROLADORES, obj_controlador_depuracion);
#macro debug global.controlador_depuracion