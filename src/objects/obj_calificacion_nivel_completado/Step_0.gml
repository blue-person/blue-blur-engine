// Animacion al presentar la calificacion
if (image_alpha < 1) {
    image_alpha += 0.05;
    image_xscale -= 0.5;
    image_yscale -= 0.5;
	
    if (image_alpha == 1) {
		audio.reproducir_audio(snd_mostrar_calificacion);
	}
}