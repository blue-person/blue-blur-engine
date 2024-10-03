// Parametros del objeto
depth = Profundidades.Frontstage;
image_speed = 0;

// Variables
activar_evento = false;
realizar_animacion = true;
tiempo_espera = 200;
puede_usarse = true;
angulo_imagen = 0;
indice_imagen = 0;
indices_validos = [1, 5, 9, 13];

// Tubos del Four Way Cannon
tubos = instance_create_depth(x, y, Profundidades.Backstage, obj_tubos_fourwaycannon);

// Metodos
ajustar_animacion = function(indice_a, indice_b, angulo) {
	// Ajustar angulo de los aros
	angulo_imagen = angulo;
	
	// Ajustar indice de los tubos
	if (tubos.image_index == 0) {
		audio.reproducir_audio(snd_fourwaycannon_apuntar);
		tubos.image_index = indice_a;
	}
	
	// Ajustar fotograma actual de los tubos
	if ((tubos.image_index >= indice_a) and (tubos.image_index < indice_b)) {
		tubos.fotograma += 0.5;
	}
}