// Parametros del objeto
depth = Profundidades.Frontstage;
image_speed = 0;

// Variables
activar_evento = false;
realizar_animacion = true;
tiempo_transcurrido = 0;
tiempo_maximo = 200;
puede_usarse = true;
direcciones_apuntado = [1, 5, 9, 13];

// Tubos del Four Way Cannon
tubos = instance_create_depth(x, y, Profundidades.Backstage, obj_tubos_fourwaycannon);
angulo_tubos = 0;
direccion_apuntado = 0;

// Metodos
ajustar_animacion = function(indice_a, indice_b, angulo) {
	// Determinar si la animacion acaba de iniciar
	if (tubos.image_index == 0) {
		// Reproducir sonido
		audio.reproducir_audio(snd_fourwaycannon_apuntar);
		
		// Ajustar indice de la imagen
		tubos.image_index = indice_a;
	}
	
	// Determinar si la animacion ya ha iniciado
	if ((tubos.image_index >= indice_a) and (tubos.image_index < indice_b)) {
		tubos.fotograma += 0.5;
	}
	
	// Ajustar variables
	angulo_tubos = angulo;
}