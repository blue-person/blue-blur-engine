function crear_funcionalidad(profundidad, funcionalidad) {
	return instance_create_depth(OFFSCREEN, OFFSCREEN, profundidad, funcionalidad);
}

function crear_sistema_particulas_basico() {
	var sistema_particulas = part_system_create_layer(layer, true);
	part_system_depth(sistema_particulas, PROFUNDIDAD_PARTICULAS);
	return sistema_particulas;
}

function redondear_valor(valor) {
	var signo_valor = sign(valor);
	var parte_fraccional = frac(valor);
	var es_positivo = (signo_valor >= 0) and (parte_fraccional == 1);
	var es_negativo = (signo_valor < 0) and (parte_fraccional == 0);
	
	if (es_positivo or es_negativo) {
	    return ceil(valor);
	} else {
	    return floor(valor);
	}
}

function normalizar_angulo(angulo) {
	while (angulo < 0) {
		angulo += 360;
	}
	while (angulo > 359) { 
		angulo -= 360;
	}
	return angulo;
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
	var valor_maximo = max(valor_calculo - abs(self.velocidad_horizontal), valor_comparacion);
	return (1 / valor_maximo);
}

function interpolacion_lineal(punto_inicial, punto_final, incremento) {
	return (punto_final - punto_inicial) / incremento;
}

function copiar_lista(lista_fuente) {
	var lista_destino = [];
	array_copy(lista_destino, 0, lista_fuente, 0, array_length(lista_fuente));
	return lista_destino;
}

function valor_en_lista(valor, lista) {
	// Buscar el valor en la lista
	for (var i = 0; i < array_length(lista); i++) {
	   if (lista[i] == valor) then return true;
	}
	
	// En caso de no encontrar el valor, regresa falso
	return false;
}

function valor_aleatorio(lista) {
	// Obtener un nuevo valor para la aleatoriedad
	randomize();
	
	// Escoger de forma aleatoria un elemento de la lista
	var longitud_lista = array_length(lista);
	var indice = irandom(longitud_lista - 1);
	var valor_escogido = lista[indice];
	
	// Regresar un valor aleatorio
	return valor_escogido
}