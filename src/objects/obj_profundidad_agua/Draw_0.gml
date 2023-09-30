//refl_org SURFACE*****
surface_set_target(refl_org);

//Catch draw
refl_x = x;
refl_y = y - sprite_height;

refl_catch_draw();

surface_reset_target();

//Flip it
refl_surf_clear(flipSurf);

surface_set_target(flipSurf);

draw_surface_ext(refl_org, 0, sprite_height, 1, -1, 0, c_white, 1);

surface_reset_target();

//refr org SURFACE*****
surface_set_target(refr_org);

//Catch draw
refl_x = x;
refl_y = y;

refl_catch_draw();

surface_reset_target();
    
//draw refraction surface
draw_surface_ext(refr_org, x, y, 1, 1, 0, water_blend, 0.2);
    
//draw reflection surface
shader_set(sh_refl);

var pi2 = pi * 2;
shader_set_uniform_f(uni_time, current_time % (pi2 * (100 / wave_speed)));

shader_set_uniform_f(uni_slow, 100 / wave_speed);
shader_set_uniform_f(uni_amount, 4 * wave_size);
shader_set_uniform_f(uni_waves, 20 * wave_frequency);
shader_set_uniform_f(uni_y_amount, 2 * vertical_wave_size);
shader_set_uniform_f(uni_y_waves, 20 * vertical_wave_frequency);

var tex = surface_get_texture(refl_org);

var t_w = sprite_width;
var t_h = sprite_height;

shader_set_uniform_f(uni_surf_size, t_w, t_h);
shader_set_uniform_f(uni_texel, texture_get_texel_width(tex), texture_get_texel_height(tex));

draw_surface_ext(flipSurf, x, y, 1, 1, 0, water_blend, refl_alpha);

//end stuff
shader_reset();