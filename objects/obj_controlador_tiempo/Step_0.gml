// Aumentar valores de cada variable segun la cantidad de ticks
if (medir_tiempo) {
    ++milisegundos;
	
    if (milisegundos >= 60) { 
        milisegundos = 0;
        ++segundos;
    }
	
    if (segundos >= 60) {
        segundos = 0;
        ++minutos;
    }
	
    if (minutos >= 10) {
        minutos = 0;
    }
}

// Pasar las variables a string
texto_milisegundos = string(milisegundos);
texto_segundos = string(segundos);
texto_minutos = string(minutos);

// Arreglar el formato de presentacion de los numeros
if (milisegundos < 10) {
	texto_milisegundos = "0" + texto_milisegundos;
}

if (segundos < 10) {
	texto_segundos = "0" + texto_segundos;
}

if (texto_minutos < 10) {
	texto_minutos = "0" + texto_minutos;
}

texto_segundos = texto_segundos + ".";
texto_minutos = texto_minutos + ":";
texto_tiempo = texto_minutos + texto_segundos + texto_milisegundos;