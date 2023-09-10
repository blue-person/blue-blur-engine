function refl_catch_draw() {
	//shader if refr surface
	if (refl_y == y){
	    shader_set(sh_refr);
   
	    shader_set_uniform_f(uni_time2, current_time);
	    shader_set_uniform_f(uni_slow2, 100 / refr_speed);
	    shader_set_uniform_f(uni_amount2, 2 * refr_size);
	    shader_set_uniform_f(uni_waves2, 10 * refr_frequency);
   
	    //draw white on refr surface
	    draw_rectangle(0, 0, sprite_width, sprite_height, false);
	}
 
	//add layers to priority ds
	var prior = ds_priority_create();
	
	for (var i = 0; i < array_length_1d(tile_layers); i++) {
	    ds_priority_add(prior, tile_layers[i], layer_get_depth(tile_layers[i]));
	}
 
	for (var i = 0; i < array_length_1d(back_layers); i++) {
	    ds_priority_add(prior, back_layers[i], layer_get_depth(back_layers[i]));
	}
 
	//draw layers
	while(ds_priority_size(prior) > 0) {
	    //var lyr = layer_get_id(ds_priority_delete_max(prior));
		var lyr = ds_priority_delete_max(prior);
   
	    //background
	    var arr = layer_get_all_elements(lyr);
	    if (layer_get_element_type(arr[0]) == layerelementtype_background) {
	        var bk_spr = layer_background_get_sprite(arr[0]);
       
	        //color
	        if (bk_spr < 0) {
	            var bk_clr = layer_background_get_blend(arr[0]);
           
	            draw_set_color(bk_clr);
	            draw_rectangle(0, 0, sprite_width, sprite_height, false);
	            draw_set_color(c_white);
	        }
	        //sprite
	        else {
	            //shader
	            var bk_ind = layer_background_get_index(arr[0]);
	            var tex = sprite_get_texture(bk_spr, bk_ind);
	            var uvs = texture_get_uvs(tex);
       
	            shader_set_uniform_f(uni_texel2, texture_get_texel_width(tex), texture_get_texel_height(tex));
	            shader_set_uniform_f(uni_uvs2, uvs[0], uvs[1], uvs[2], uvs[3]);
           
	            //tiled
	            var tiled = layer_background_get_htiled(arr[0]);
           
	            if (tiled) {
	                draw_sprite_tiled_ext(bk_spr, bk_ind, layer_get_x(lyr) - refl_x, layer_get_y(lyr)-refl_y,
	                    layer_background_get_xscale(arr[0]), layer_background_get_yscale(arr[0]),
	                    layer_background_get_blend(arr[0]), layer_background_get_alpha(arr[0]));
	            } else {
	                draw_sprite_ext(bk_spr, bk_ind, layer_get_x(lyr) - refl_x, layer_get_y(lyr)-refl_y,
	                    layer_background_get_xscale(arr[0]), layer_background_get_yscale(arr[0]),
	                    0, layer_background_get_blend(arr[0]), layer_background_get_alpha(arr[0]));
	            }
	        }
	    }
	    else if (layer_get_element_type(arr[0]) == layerelementtype_tilemap) {
	        //shader
	        var tex = sprite_get_texture(sprite_index, image_index);
       
	        shader_set_uniform_f(uni_texel2, texture_get_texel_width(tex), texture_get_texel_height(tex));
	        shader_set_uniform_f(uni_uvs2, 0, 0, 1, 1);
       
	        draw_tilemap(arr[0], layer_get_x(lyr) - refl_x, layer_get_y(lyr) - refl_y);
	    }
	}
 
	//sprites
	with (all) {
	    if (visible and (object_index != obj_water) and (sprite_index != -1)) {
	        //shader
	        var tex = sprite_get_texture(sprite_index, image_index);
	        var uvs = sprite_get_uvs(sprite_index, image_index);
			var pos_x = x - other.refl_x;
			var pos_y = y - other.refl_y;
       
	        shader_set_uniform_f(other.uni_texel2, texture_get_texel_width(tex), texture_get_texel_height(tex));
	        shader_set_uniform_f(other.uni_uvs2, uvs[0], uvs[1], uvs[2], uvs[3]);
			
			if (object_index == obj_jugador) {
				draw_sprite_ext(sprite_actual, indice_sprite, pos_x, pos_y, direccion_horizontal, 1, angulo_imagen, image_blend, image_alpha);
			} else {
				draw_sprite_ext(sprite_index, image_index, pos_x, pos_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			}
	    } else if (object_index == obj_water) {
	        //shader
	        var tex = surface_get_texture(refl_surf);
			var pos_x = x - other.refl_x;
			var pos_y = y - other.refl_y;
       
	        shader_set_uniform_f(other.uni_texel2, texture_get_texel_width(tex), texture_get_texel_height(tex));
	        shader_set_uniform_f(other.uni_uvs2, 0, 0, 1, 1);
       
	        draw_surface(refl_surf, pos_x, pos_y);
	    }
	}
 
	//reset shader
	if (refl_y == y) {
	    shader_reset();
	}
}