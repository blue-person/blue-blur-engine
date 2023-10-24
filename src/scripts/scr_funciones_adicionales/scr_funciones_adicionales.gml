function normalizar_angulo(angulo) {
	while (angulo < 0) {
		angulo += 360;
	}
	while (angulo > 359) { 
		angulo -= 360;
	}
	return angulo;
}

function iniciar_alarma(indice, tiempo_espera) {
	if (alarm[indice] == -1) {
		alarm[indice] = tiempo_espera;
	}
}

function numero_a_texto(numero, cantidad_ceros) {
	var numero_en_texto = string(numero);
	var longitud_numero = string_length(numero_en_texto);
	var ceros_faltantes = cantidad_ceros - longitud_numero;
	return string_repeat("0", ceros_faltantes) + numero_en_texto;
}

function division_segura(valor_a, valor_b) {
	return (valor_b == 0.0) ? 0.0 : (valor_a / valor_b);
}

function calcular_fotograma(valor_calculo, valor_comparacion) {
	var valor_maximo = max(valor_calculo - abs(velocidad_horizontal), valor_comparacion);
	return (1 / valor_maximo);
}

function interpolacion_lineal(punto_inicial, punto_final, incremento) {
	return (punto_final - punto_inicial) / incremento;
}

function copiar_lista(lista_fuente) {
	var lista_destino = [];
	var cantidad_elementos = array_length(lista_fuente);
	array_copy(lista_destino, 0, lista_fuente, 0, cantidad_elementos);
	return lista_destino;
}

function valor_aleatorio(lista) {
	// Obtener un nuevo valor para la aleatoriedad
	randomize();
	
	// Escoger de forma aleatoria un elemento de la lista
	var cantidad_elementos = array_length(lista);
	var indice = irandom(cantidad_elementos - 1);
	var valor_escogido = lista[indice];
	
	// Regresar un valor aleatorio
	return valor_escogido
}