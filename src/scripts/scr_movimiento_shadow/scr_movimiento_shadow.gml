function gestion_movimiento_shadow() {
    // Gestionar el boost
    gestion_boost();

    // Frenar al cambiar de direccion
    gestion_accion_frenar();
	
	// Movimiento basico
    gestion_movimiento_basico();

    // Gestion del salto
    gestion_accion_salto();

    // Aterrizar en el suelo
    gestion_accion_aterrizar();

    // Agacharse y rodar
    gestion_accion_agacharse();

    // Mirar hacia arriba
    gestion_accion_mirar_arriba();
	
    // Spindash
    gestion_spindash();

    // Homing attack
    gestion_homing_attack();

    // Saltar en trampolin
	gestion_uso_trampolin();
	
	// Dash ring
	gestion_uso_dashring();

    // Dash ramp
    gestion_uso_dashramp();

    // Dash pad
    gestion_uso_dashpad();

    // Deslizarse por el suelo
	gestion_accion_shadow_deslizarse();
	
    // Grinding
    gestion_grinding();

    // Usar swingbar
    gestion_uso_swingbar();

    // Quick Time Event
	gestion_evento_qte();

    // Cinta de Moebius
	gestion_uso_cinta_moebius();

    // Pisoton
	gestion_accion_shadow_pisoton();

    // Walljump
	gestion_accion_walljump();
	
    // Four Way Cannon
    gestion_uso_fourwaycannon();

    // Ser herido
    gestion_accion_herirse();
	
    // Light ring dash
	gestion_lightdash();
	
	// Jump Panel
    gestion_uso_jumppanel();

    // Morir
    gestion_accion_morir();

    // Agarrarse de polea
    gestion_uso_polea();

    // Agarrarse de poste giratorio
    gestion_uso_poste_giratorio();

    // Salto de bungee
    gestion_uso_bungee();
	
    // Usar zipline
    gestion_uso_zipline();

    // Tirar de grab-pole
    gestion_uso_grabpole();

    // Movimiento del auto-tunnel
    gestion_uso_autotunnel();

    // Rotate Jump Launcher
    gestion_uso_jumplauncher();

    // Wallrun
    gestion_accion_wallrun();

    // Ventilador gigante
    gestion_uso_ventilador();
}