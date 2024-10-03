// Limitar el indice de la imagen
if (image_index >= 999) {
    image_index = 0;
}

// Ajustar el indice de la imagen
if (fotograma >= 1) {
    fotograma = 0;
    image_index++;
} else if (fotograma <= -1) {
    fotograma = 0;
    image_index--;
}