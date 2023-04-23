var velocidad_requerida = ((other.velocidad_horizontal > 0.5) and (direccion_horizontal <= -1)) or ((other.velocidad_horizontal < -0.5) and (image_xscale >= 1));

if (activar_evento and velocidad_requerida and (other.accion != 26)) {
    other.accion = 19;
	
    other.direccion_horizontal = -direccion_horizontal;
    other.x = x + 16 * direccion_horizontal;
	
    other.alarm[2] = 80;
    activar_evento = false;
    
    if (instance_exists(obj_efecto_boost)) {
        obj_efecto_boost.activar_efecto = false;
    }
}