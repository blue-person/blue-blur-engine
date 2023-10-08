// Informacion general
#macro TITULO_JUEGO "Blue Blur Engine"

// Profundidades de dibujado
#macro OFFSCREEN -50
#macro PROFUNDIDAD_GESTORES 0
#macro PROFUNDIDAD_CONTROLADORES 0
#macro PROFUNDIDAD_PARTICULAS 0
#macro PROFUNDIDAD_JUGADOR -1
#macro PROFUNDIDAD_OBJETOS 0
#macro PROFUNDIDAD_INTERFAZ -100
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
global.gestor_graficos = crear_funcionalidad(PROFUNDIDAD_GESTORES, obj_gestor_graficos);
#macro graficos global.gestor_graficos

// Gestor de audio
global.gestor_audio = crear_funcionalidad(PROFUNDIDAD_GESTORES, obj_gestor_audio);
#macro audio global.gestor_audio

// Gestor de controles
global.gestor_controles = crear_funcionalidad(PROFUNDIDAD_GESTORES, obj_gestor_controles);
#macro controles global.gestor_controles

// Gestor de textos
global.gestor_texto = crear_funcionalidad(PROFUNDIDAD_GESTORES, obj_gestor_texto);
#macro textos global.gestor_texto

// Gestor de transiciones
global.gestor_transiciones = crear_funcionalidad(PROFUNDIDAD_CONTROLADORES, obj_gestor_transiciones);
#macro transiciones global.gestor_transiciones

// Gestor del nivel actual
global.gestor_nivel = crear_funcionalidad(PROFUNDIDAD_GESTORES, obj_gestor_nivel);
#macro nivel global.gestor_nivel

// Controlador del modo debug
global.controlador_depuracion = crear_funcionalidad(PROFUNDIDAD_CONTROLADORES, obj_controlador_depuracion);
#macro debug global.controlador_depuracion

// Sistema de particulas
global.sistema_particulas = crear_sistema_particulas_basico();
#macro particulas global.sistema_particulas

// Establecer del jugador
global.personaje_actual = obj_sonic;
global.vidas_restantes = 3;

// Creacion de seudonimos
#macro hud instance_find(obj_hud, 0)
#macro camara instance_find(obj_camara, 0)
#macro cronometro instance_find(obj_cronometro, 0)
#macro jugador instance_find(global.personaje_actual, 0)