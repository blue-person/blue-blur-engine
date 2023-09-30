// Informacion general
#macro TITULO_JUEGO "Blue Blur Engine"

// Profundidades de dibujado
#macro OFFSCREEN -50
#macro PROFUNDIDAD_GESTORES 0
#macro PROFUNDIDAD_CONTROLADORES 0
#macro PROFUNDIDAD_PARTICULAS 0
#macro PROFUNDIDAD_JUGADOR -1
#macro PROFUNDIDAD_AGUA -200
#macro PROFUNDIDAD_TRANSICIONES -255

// Prioridades de sonidos
#macro PRIORIDAD_CANCIONES 0
#macro PRIORIDAD_SONIDOS 1

// Colores
#macro COLOR_BLANCO make_color_rgb(255, 255, 255)
#macro COLOR_AZUL_CLARO make_color_rgb(78, 194, 252)
#macro COLOR_AZUL_NORMAL make_color_rgb(33, 74, 223)
#macro COLOR_NARANJA_CLARO make_color_rgb(255, 160, 64)
#macro COLOR_NARANJA_NORMAL make_color_rgb(218, 84, 69)

// Configurar la profundidad del objeto
depth = PROFUNDIDAD_CONTROLADORES;

// Gestor de pantalla
global.gestor_pantalla = crear_funcionalidad(PROFUNDIDAD_GESTORES, obj_gestor_pantalla);
#macro pantalla global.gestor_pantalla

// Gestor de audio
global.gestor_audio = crear_funcionalidad(PROFUNDIDAD_GESTORES, obj_gestor_audio);
#macro audio global.gestor_audio

// Gestor de controles
global.gestor_controles = crear_funcionalidad(PROFUNDIDAD_GESTORES, obj_gestor_controles);
#macro control global.gestor_controles

// Gestor de texto
global.gestor_texto = crear_funcionalidad(PROFUNDIDAD_GESTORES, obj_gestor_texto);
#macro texto global.gestor_texto

// Gestor de transiciones
global.gestor_transiciones = crear_funcionalidad(PROFUNDIDAD_CONTROLADORES, obj_gestor_transiciones);
#macro transicion global.gestor_transiciones

// Gestor del nivel actual
global.gestor_nivel = crear_funcionalidad(PROFUNDIDAD_GESTORES, obj_gestor_nivel);
#macro nivel global.gestor_nivel

// Controlador del modo debug
global.controlador_depuracion = crear_funcionalidad(PROFUNDIDAD_CONTROLADORES, obj_controlador_depuracion);
#macro debug global.controlador_depuracion

// Sistema de particulas
global.sistema_particulas = crear_sistema_particulas_basico();
#macro particulas global.sistema_particulas