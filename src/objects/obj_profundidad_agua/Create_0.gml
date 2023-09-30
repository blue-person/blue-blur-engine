//------YOU MAY TWEAK THESE VARIABLES----------------------
//Reflection
//You will need to tweak these vars by trial-and-error to find the best settings
//that suit your liking.
wave_speed = 1; //Speed of the wave animation
wave_size = 0.5; //Size of the waves, horizontally
wave_frequency = 2; //Frequency; How much waves are created in a time

vertical_wave_size = 2; //Size of the vertical waves
vertical_wave_frequency = 4; //Frequency of the vertical waves

//Refraction
refr_speed = 1; //Speed of the refraction shader
refr_size = 0.5; //Size of the refraction waves
refr_frequency = 4; //Frequency of the refraction waves

//Water other
water_blend = make_color_rgb(150, 220, 255); //Reflection blend color (light blue)
                                             //use c_white for no blending
refl_alpha = 0.6; //Reflection alpha (opacity)

//Reflective Layers
back_layers = []; //Background layers to reflect
tile_layers = []; //Tile layers to reflect
//----END----------------------------------------

//new
flipSurf = -1;

//refl org surface
refl_x = x;
refl_y = y - sprite_height;

refl_org = surface_create(sprite_width, sprite_height);
refl_surf_clear(refl_org);

//refl surface
refl_surf = surface_create(sprite_width, sprite_height);
refl_surf_clear(refl_surf);

//refr org surface
refr_org = surface_create(sprite_width, sprite_height);
refl_surf_clear(refr_org);

//shader
uni_time = shader_get_uniform(sh_refl, "time");
uni_texel = shader_get_uniform(sh_refl, "texel");

uni_slow = shader_get_uniform(sh_refl, "slow");
uni_amount = shader_get_uniform(sh_refl, "amount");
uni_waves = shader_get_uniform(sh_refl, "waves");
uni_y_amount = shader_get_uniform(sh_refl, "y_amount");
uni_y_waves = shader_get_uniform(sh_refl, "y_waves");

uni_uvs2 = shader_get_uniform(sh_refr, "uvs");
uni_time2 = shader_get_uniform(sh_refr, "time");
uni_texel2 = shader_get_uniform(sh_refr, "texel");

uni_slow2 = shader_get_uniform(sh_refr, "slow");
uni_amount2 = shader_get_uniform(sh_refr, "amount");
uni_waves2 = shader_get_uniform(sh_refr, "waves");

uni_surf_size = shader_get_uniform(sh_refl, "surf_size");