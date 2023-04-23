// Permitir contar los ticks del juego
medir_tiempo = false;

// Variables para almacenar el tiempo
milisegundos = 0;
segundos = 0;
minutos = 0;

// Variables para almacenar el tiempo como string
texto_milisegundos = "";
texto_segundos = "";
texto_minutos = "";
texto_tiempo = "";

// Almacenar el tiempo al momento de usar un checkpoint
if (instance_exists(obj_controlador_checkpoint) and obj_controlador_checkpoint.checkpoint) {
    milisegundos = obj_controlador_checkpoint.milisegundos;
    segundos = obj_controlador_checkpoint.segundos; 
    minutos = obj_controlador_checkpoint.minutos;
}