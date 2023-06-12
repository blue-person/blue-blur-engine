function calcular_angulo(angulo, espaciado_horizontal, cantidad_puntos_verificacion) {
  // Declarar variables
  var angulo_aproximado = floor(angulo);
  var valor_acos = dcos(angulo_aproximado);
  var valor_asin = dsin(angulo_aproximado);
  var primer_subconjunto = false;
  var segundo_subconjunto = false;
  
  // Declarar puntos
  var pos_x_1 = round(self.x - (valor_acos * espaciado_horizontal));
  var pos_y_1 = round(self.y + (valor_asin * espaciado_horizontal));
  var pos_x_2 = round(self.x + (valor_acos * espaciado_horizontal));
  var pos_y_2 = round(self.y - (valor_asin * espaciado_horizontal));
  
  // Declarar requisitos de colision
  var requisitos_colision_riel = self.permitir_grinding;
  var requisitos_caminar_sobre_agua = self.caminar_sobre_agua;
  
  // Logica
  while (cantidad_puntos_verificacion > 0) {
    if (not primer_subconjunto) {
		// Determinar estado del primer subconjunto
		primer_subconjunto = colision_punto(self, pos_x_1, pos_y_1, requisitos_colision_riel, requisitos_caminar_sobre_agua);
		
		// Actualizar posiciones
		pos_x_1 += valor_asin;
		pos_y_1 += valor_acos;
    }
	
    if (not segundo_subconjunto) {
		// Determinar estado del segundo subconjunto
		segundo_subconjunto = colision_punto(self, pos_x_2, pos_y_2, requisitos_colision_riel, requisitos_caminar_sobre_agua);
		
		// Actualizar posiciones
		pos_x_2 += valor_asin;
		pos_y_2 += valor_acos;
    }
	
	// Verificar si se ha encontrado un angulo valido
	if (primer_subconjunto and segundo_subconjunto) {
		break;
	} else {
		cantidad_puntos_verificacion--;
	}
  }
  
  // Retornar angulo
  var angulo_calculado = point_direction(pos_x_1, pos_y_1, pos_x_2, pos_y_2);
  return round(angulo_calculado);
}