// Variables
cantidad_nodos = 16;
ancho_puente = cantidad_nodos * 16;
mitad_ancho_puente = ancho_puente / 2;
tension_maxima = 16;
nodos = [];

// Metodos
crear_nodos = function() {
	for (var i = 0; i < cantidad_nodos; ++i) {
	    var pos_x = x + i * 16;
	    nodos[i] = {
	        objeto: instance_create_depth(pos_x, y, Profundidades.Backstage, obj_nodo_puente),
	        altura: 0
	    };
	}
}