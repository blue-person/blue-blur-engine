// Crear controladores de elementos decorativos
instance_create_depth(0, 0, 0, obj_fondo_pantalla_titulo);

// Aplicar una capa translucida
var fondo_capa_translucida = layer_background_get_id(layer_get_id("fondo_capa_translucida"));
var transparencia = 0.8;
layer_background_alpha(fondo_capa_translucida, transparencia);

// Determinar imagenes de fondo
imagenes_fondo = [
    "fondo_monte_a",
    "fondo_monte_b",
    "fondo_nubes_a",
    "fondo_monte_c",
    "fondo_nubes_b",
    "fondo_nubes_c",
    "fondo_nubes_d",
    "fondo_nubes_e"
];

// Inicializar valores de movimiento
valor_a = 0;
valor_b = 0;
valor_c = 0;
valor_d = 0;
valor_e = 0;
valor_f = 0;
valor_g = 0;
valor_h = 0;

// Determinar posicion de la vista
pos_x = 0;
pos_y = -110;