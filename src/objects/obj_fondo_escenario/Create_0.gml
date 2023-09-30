// Declarar variables
nivel_actual = room;
estructura_fondos = [];
estructura_tilesets = [];

// Asignar el valor de cada variable en base al nivel donde se encuentre
switch (nivel_actual) {
    case rm_emerald_valley:
        estructura_fondos = [{
                capa: layer_get_id("fondo_cielo"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("fondo_oceano_a"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("fondo_oceano_b"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("fondo_oceano_c"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("fondo_oceano_d"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("fondo_nubes_a"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("fondo_nubes_b"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("fondo_nubes_c"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("fondo_nubes_d"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("fondo_montes"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("fondo_piedras"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }
        ];
		
		estructura_tilesets = [{
                capa: layer_get_id("nivel_tilesets_a"),
                permitir_reflexion_agua: true
            }
        ];
		break;
    case rm_practice_zone:
        estructura_fondos = [{
                capa: layer_get_id("fondo_cuadros"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }
        ];
		
		estructura_tilesets = [{
                capa: layer_get_id("nivel_tilesets_a"),
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("nivel_tilesets_b"),
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("nivel_tilesets_c"),
                permitir_reflexion_agua: true
            }
        ];
        break;
	case rm_groovy_badlands:
        estructura_fondos = [{
                capa: layer_get_id("Monte_A"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("Monte_B"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("Nubes_A"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("Monte_C"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("Nubes_B"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("Nubes_C"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("Nubes_D"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("Nubes_E"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("Nubes_F"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }
        ];
		
		// Para evitar cambiar la profundidad del fondo en cada
		// frame, se declara directamente en el evento Crear
		layer_depth(estructura_fondos[8].capa, -30);
		
		estructura_tilesets = [{
                capa: layer_get_id("nivel_tilesets_a"),
                permitir_reflexion_agua: true
            }
		];
        break;
    case rm_mining_mayhem:
		estructura_fondos = [{
                capa: layer_get_id("fondo_nubes"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("fondo_arboles"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("fondo_montes"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("fondo_escenario"),
				velocidad_desplazamiento: 0,
                permitir_reflexion_agua: true
            }
        ];
		
		estructura_tilesets = [{
                capa: layer_get_id("nivel_tilesets_a"),
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("nivel_tilesets_b"),
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("nivel_tilesets_c"),
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("nivel_tilesets_d"),
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("nivel_tilesets_e"),
                permitir_reflexion_agua: true
            }, {
                capa: layer_get_id("nivel_tilesets_f"),
                permitir_reflexion_agua: true
            }
        ];
        break;
}