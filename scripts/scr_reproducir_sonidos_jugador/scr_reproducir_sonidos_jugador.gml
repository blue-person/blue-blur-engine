function reproducir_sonido_triunfar_qte() {
	var sonido_qte;
	switch (global.personaje_actual) {
		case "Sonic":
			sonido_qte = snd_festejo_sonic;
			break;
		case "Shadow":
			sonido_qte = snd_festejo_shadow;
			break;
	}
	audio.reproducir_audio(sonido_qte);
}

function reproducir_sonido_muerte(){
	var sonido_muerte;
	switch (global.personaje_actual) {
		case "Sonic":
			sonido_muerte = snd_muerte_sonic;
			break;
		case "Shadow":
			sonido_muerte = snd_muerte_shadow;
			break;
	}
	audio.reproducir_audio(sonido_muerte);
}