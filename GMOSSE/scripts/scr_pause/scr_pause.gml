/// @description scr_pause()
function scr_pause() {
	/*
	scr_pause()

	Creates a surface copy of the current screen and then deactivates all instances,
	effectively pausing the game and making an image of everything beforehand so you
	can use scr_pause_draw() to make it appear as if the objects were still present.
	*/
	global.paused = true;

	// Freeze background positions/save speeds
	var back = layer_get_all();
	for (var i=0; i<array_length(back); i++)
		{
		if layer_get_name(back[i]) != "layer_bkg_brightness" // Reserved for background darkening
			{
			global.bkg_vspd[i] = layer_get_vspeed(back[i]);
			global.bkg_hspd[i] = layer_get_hspeed(back[i]);
			global.bkg_alpha[i] = layer_background_get_alpha(layer_background_get_id(back[i]));
			layer_vspeed(back[i],0);
			layer_hspeed(back[i],0);
			}
		}

	// Capture image of screen (without debug text)
	// Note: This stopped working for debug use since GMS switchover, 
	instance_deactivate_object(obj_ctrl_music);
	instance_deactivate_object(obj_debug);
	
	if !sprite_exists(global.pause_img)
		{
		// First, create the surface
		var win_w = obj_ctrl_render.m_base_w;
		var win_h = obj_ctrl_render.m_base_h;
		var surf = surface_create(win_w,win_h);
		surface_set_target(surf);
		draw_clear_alpha(c_black,1);
		gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
		if surface_exists(application_surface) draw_surface_stretched(application_surface,0,0,win_w,win_h);
		gpu_set_blendmode(bm_normal);
		surface_reset_target();

		// Then make the sprite off the surface
		global.pause_img = sprite_create_from_surface(surf,0,0,win_w,win_h,false,false,0,0);
		surface_free(surf);
		}
	/* 
	Strange bug in HTML5 export: 
	the stage controller lasts a frame longer if this isn't included
	before the use of surface_set_target. Seems controllers that use
	instance_activate_region will wreck obj_ctrl_continue something
	shocking, and instance_deactivate_object is immediate but
	instance_deactivate_all(1) only occurs on the next frame.
	*/
	instance_deactivate_object(obj_ctrl_stage);

	// Now we're done with the image, deactivate everything except core controllers
	instance_deactivate_all(true);
	instance_activate_object(obj_debug);
	instance_activate_object(obj_ctrl_input);
	instance_activate_object(obj_ctrl_music);
	instance_activate_object(obj_ctrl_render);
}