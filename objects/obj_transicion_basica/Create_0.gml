// Variables
image_alpha = 0;

color_transicion = spr_pantalla_negra;
transicion_actual = 0;
velocidad_transicion = 0.01;

// Metodos
establecer_color = function(color_transicion) {
	switch (color_transicion) {
		case "blanco":
	        self.color_transicion = spr_pantalla_blanca;
	        break;
	    case "morado":
	        self.color_transicion = spr_pantalla_morada;
	        break;
	    case "negro":
	        self.color_transicion = spr_pantalla_negra;
	        break;
	}
}

establecer_velocidad = function(velocidad_transicion) {
	self.velocidad_transicion = velocidad_transicion;
}