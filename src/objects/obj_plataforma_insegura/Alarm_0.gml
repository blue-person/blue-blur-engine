// Crear la plataforma cayendo
var plataforma_cayendo = instance_create_depth(x, y, Profundidades.Backstage, obj_plataforma_cayendo);
plataforma_cayendo.sprite_index = sprite_index;

// Destruir objeto
instance_destroy();