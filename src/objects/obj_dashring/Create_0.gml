// Variables
activar_evento = true;
cantidad_energia = 0;
cantidad_puntos = 100;
animacion = obj_efecto_dashring;
efecto_sonido = snd_dashring;
efecto_visual = spr_efecto_dashring;
cantidad_fuerza = 12;
tiempo_espera = 30;

// Crear el lado frontal del objeto
var lado_frontal = instance_create_depth(x, y, Profundidades.Frontstage, obj_dashring_frontal);
lado_frontal.image_angle = image_angle;

// Crear el lado posterior del objeto
var lado_posterior = instance_create_depth(x, y, Profundidades.Backstage, obj_dashring_posterior);
lado_posterior.image_angle = image_angle;