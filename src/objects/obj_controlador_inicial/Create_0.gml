// Informacion general
#macro TITULO_JUEGO "Blue Blur Engine"
#macro OFFSCREEN -50

// Profundidades de dibujado
enum Profundidades {
    Gestores = 0,
    Controladores = 0,
    Particulas = 0,
    Backstage = 1,
    Jugador = -1,
    Efectos = -2,
    Frontstage = -2,
    Interfaz = -100,
    Agua = -200,
    Transiciones = -255
}

// Prioridades de audios
enum Prioridades {
	Canciones = 0,
	Sonidos = 1
}

// Configurar la profundidad del objeto
depth = Profundidades.Controladores;

// Gestor de pantalla
global.gestor_graficos = crear_funcionalidad(Profundidades.Gestores, obj_gestor_graficos);
#macro graficos global.gestor_graficos

// Gestor de audio
global.gestor_audio = crear_funcionalidad(Profundidades.Gestores, obj_gestor_audio);
#macro audio global.gestor_audio

// Gestor de controles
global.gestor_controles = crear_funcionalidad(Profundidades.Gestores, obj_gestor_controles);
#macro controles global.gestor_controles

// Gestor de textos
global.gestor_texto = crear_funcionalidad(Profundidades.Gestores, obj_gestor_texto);
#macro textos global.gestor_texto

// Gestor de transiciones
global.gestor_transiciones = crear_funcionalidad(Profundidades.Controladores, obj_gestor_transiciones);
#macro transiciones global.gestor_transiciones

// Gestor del nivel actual
global.gestor_nivel = crear_funcionalidad(Profundidades.Gestores, obj_gestor_nivel);
#macro nivel global.gestor_nivel

// Controlador del modo debug
global.controlador_depuracion = crear_funcionalidad(Profundidades.Controladores, obj_controlador_depuracion);
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
#macro jugador_existe instance_find(global.personaje_actual, 0) != noone