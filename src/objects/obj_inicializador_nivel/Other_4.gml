// Crear el menu de pausa en caso de no existir
if (not instance_exists(obj_controlador_pausa)) {
	crear_funcionalidad(Profundidades.Controladores, obj_controlador_pausa);
}