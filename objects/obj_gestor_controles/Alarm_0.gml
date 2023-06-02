// En caso de que la lectura no sea permitida, se habilita
var lectura_permitida = self.obtener_estado_lectura();
if (not lectura_permitida) then self.habilitar_lectura();