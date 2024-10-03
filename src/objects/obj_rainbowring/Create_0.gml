// Variables
image_speed = 0.25;
activar_evento = true;
cantidad_energia = 25;
cantidad_puntos = 1000;
animacion = obj_efecto_rainbowring;
efecto_sonido = snd_rainbowring;
efecto_visual = spr_efecto_rainbowring;
cantidad_fuerza = 12;
tiempo_espera = 30;

// Crear el lado frontal del objeto
var lado_frontal = instance_create_depth(x, y, Profundidades.Frontstage, obj_rainbowring_frontal);
lado_frontal.image_angle = image_angle;
lado_frontal.image_speed = image_speed;

// Crear el lado posterior del objeto
var lado_posterior = instance_create_depth(x, y, Profundidades.Backstage, obj_rainbowring_posterior);
lado_posterior.image_angle = image_angle;
lado_posterior.image_speed = image_speed;