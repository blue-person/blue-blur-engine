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
if (reaparicion.obtener_permiso_reaparicion()) {
    var tiempo_registrado = reaparicion.obtener_tiempo_registrado();
    milisegundos = tiempo_registrado[0];
    segundos = tiempo_registrado[1];
    minutos = tiempo_registrado[2];
}