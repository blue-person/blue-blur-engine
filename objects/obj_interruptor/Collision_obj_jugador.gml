if (!activar_evento) {
    activar_evento = true;
    image_speed = 0.25;
	
    audio.reproducir_audio(snd_activar_interruptor);
	
    if (compuerta == obj_compuerta) {
      audio.reproducir_audio(snd_abrir_compuerta);
      
      var compuerta_cercana = instance_nearest(x, y, compuerta);
      compuerta_cercana.activar_evento = true;
    }
}
