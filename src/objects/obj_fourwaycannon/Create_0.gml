// Parametros del objeto
depth = Profundidades.Frontstage;
image_speed = 0;

// Variables
activar_evento = false;
realizar_animacion = true;
tiempo_transcurrido = 0;
tiempo_maximo = 200;
puede_usarse = true;

// Establecer variables de los lados del objeto
lados = instance_create_depth(x, y, -9, obj_lados_fourwaycannon);
angulo_lados = 0;
direccion_imagen = 0;