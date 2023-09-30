function gestion_movimiento_basico() {
	// Determinar direccion
    if (accion == 0) {
        if (control.boton_mantenido("boton_izquierda")) {
            direccion_horizontal = -1;
        } else if (control.boton_mantenido("boton_derecha")) {
            direccion_horizontal = 1;
        }
    }
	
	// Manejar movimiento
	if ((accion == 0) or (accion == 1) or (accion == 16)) {
        if (tocando_suelo) {
            if (control.boton_mantenido("boton_derecha")) {
                if (velocidad_horizontal > 0) {
                    if (velocidad_horizontal < limite_velocidad_actual) {
                        velocidad_horizontal += aceleracion;
                    }
                } else {
                    velocidad_horizontal += desaceleracion;
                }
            }
            if (control.boton_mantenido("boton_izquierda")) {
                if (velocidad_horizontal < 0) {
                    if (velocidad_horizontal > -limite_velocidad_actual) {
                        velocidad_horizontal -= aceleracion;
                    }
                } else {
                    velocidad_horizontal -= desaceleracion;
                }
            }

            if (!control.boton_mantenido("boton_derecha") and !control.boton_mantenido("boton_izquierda")) {
                if (velocidad_horizontal > 0) {
                    velocidad_horizontal -= friccion;
                }

                if (velocidad_horizontal < 0) {
                    velocidad_horizontal += friccion;
                }

                if (velocidad_horizontal <= friccion and velocidad_horizontal >= -friccion) {
                    velocidad_horizontal = 0;
                }
            }

            if (control.boton_mantenido("boton_derecha") and control.boton_mantenido("boton_izquierda")) {
                if (abs(velocidad_horizontal) <= desaceleracion) {
                    velocidad_horizontal = 0;
                }
            }
        } else {
            if ((accion == 0) or (accion == 16)) {
                if (control.boton_mantenido("boton_derecha")) {
                    if (velocidad_horizontal > 0) {
                        if (velocidad_horizontal < limite_velocidad_actual) {
                            velocidad_horizontal += aceleracion;
                        }
                    } else {
                        velocidad_horizontal += desaceleracion;
                    }
                }

                if (control.boton_mantenido("boton_izquierda")) {
                    if (velocidad_horizontal < 0) {
                        if (velocidad_horizontal > -limite_velocidad_actual) {
                            velocidad_horizontal -= aceleracion;
                        }
                    } else {
                        velocidad_horizontal -= desaceleracion;
                    }
                }

                if (!control.boton_mantenido("boton_derecha") and !control.boton_mantenido("boton_izquierda")) {
                    if (velocidad_horizontal > 0) {
                        velocidad_horizontal -= friccion;
                    }

                    if (velocidad_horizontal < 0) {
                        velocidad_horizontal += friccion;
                    }

                    if (velocidad_horizontal <= friccion and velocidad_horizontal >= -friccion) {
                        velocidad_horizontal = 0;
                    }
                }

                if (control.boton_mantenido("boton_derecha") and control.boton_mantenido("boton_izquierda")) {
                    if (abs(velocidad_horizontal) <= desaceleracion) {
                        velocidad_horizontal = 0;
                    }
                }
            } else if (accion == 1) {
                if (control.boton_mantenido("boton_derecha")) {
                    if (velocidad_horizontal > 0) {
                        if (velocidad_horizontal < limite_velocidad_actual) {
                            velocidad_horizontal += aceleracion;
                        }
                    } else {
                        velocidad_horizontal += desaceleracion;
                    }
                }

                if (control.boton_mantenido("boton_izquierda")) {
                    if (velocidad_horizontal < 0) {
                        if (velocidad_horizontal > -limite_velocidad_actual) {
                            velocidad_horizontal -= aceleracion;
                        }
                    } else {
                        velocidad_horizontal -= desaceleracion;
                    }
                }

                if (!control.boton_mantenido("boton_derecha") and !control.boton_mantenido("boton_izquierda")) {
                    if (velocidad_horizontal > 0) {
                        velocidad_horizontal -= friccion;
                    }

                    if (velocidad_horizontal < 0) {
                        velocidad_horizontal += friccion;
                    }

                    if (velocidad_horizontal <= friccion and velocidad_horizontal >= -friccion) {
                        velocidad_horizontal = 0;
                    }
                }

                if (control.boton_mantenido("boton_derecha") and control.boton_mantenido("boton_izquierda")) {
                    if (abs(velocidad_horizontal) <= desaceleracion) {
                        velocidad_horizontal = 0;
                    }
                }
            }
        }
    }

    if (accion == 2) {
        if (tocando_suelo) {
            if (velocidad_horizontal > friccion_bola) {
                velocidad_horizontal -= friccion_bola;

                if (control.boton_mantenido("boton_izquierda")) {
                    velocidad_horizontal -= desaceleracion_bola;
                }
            }

            if (velocidad_horizontal < -friccion_bola) {
                velocidad_horizontal += friccion_bola;

                if (control.boton_mantenido("boton_derecha")) {
                    velocidad_horizontal += desaceleracion_bola;
                }
            }

            if ((velocidad_horizontal < friccion_bola) and (velocidad_horizontal > -friccion_bola)) {
                velocidad_horizontal = 0;
            }
        } else {
            if (control.boton_mantenido("boton_derecha")) {
                if (velocidad_horizontal >= 0) {
                    if (velocidad_horizontal < velocidad_horizontal_normal) {
                        velocidad_horizontal += aceleracion * 2;
                    }
                }
            }
            if (control.boton_mantenido("boton_izquierda")) {
                if (velocidad_horizontal <= 0) {
                    if (velocidad_horizontal > -velocidad_horizontal_normal) {
                        velocidad_horizontal -= aceleracion * 2;
                        velocidad_horizontal -= aceleracion * 2;
                    }
                }
            }
        }
    }
}