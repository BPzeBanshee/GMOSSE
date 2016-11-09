///scr_pause()
/*
scr_pause()

Creates a surface copy of the current screen and then deactivates all instances,
effectively pausing the game and making an image of everything beforehand so you
can use scr_pause_draw() to make it appear as if the objects were still present.
*/

tate_first = global.rotation;
var win_w,win_h;
if global.use_new_renderer
    {
    win_w = obj_ctrl_render.m_base_w;
    win_h = obj_ctrl_render.m_base_h;
    }
else
    {
    win_w = obj_ctrl_render_old.l_win_w;
    win_h = obj_ctrl_render_old.l_win_h;
    }

// Freeze background positions/save speeds
for (i=0; i<=7; i+=1)
    {
    bkg_vspd[i] = background_vspeed[i];
    bkg_hspd[i] = background_hspeed[i];
    bkg_alpha[i] = background_alpha[i];
    background_vspeed[i] = 0;
    background_hspeed[i] = 0;
    }

// Capture image of screen (without debug text)
instance_deactivate_object(obj_debug);
instance_deactivate_object(obj_ctrl_music);

// First, create the surface
var surf;
surf = surface_create(win_w,win_h);
surface_set_target(surf);
draw_clear_alpha(c_black,1);
draw_set_blend_mode_ext(bm_one, bm_inv_src_alpha);
if surface_exists(application_surface) then draw_surface_stretched(application_surface,0,0,win_w,win_h);
draw_set_blend_mode(bm_normal);
surface_reset_target();

// Then make the sprite off the surface
globalvar pause_img;
pause_img = sprite_create_from_surface(surf,0,0,win_w,win_h,false,false,0,0);
surface_free(surf);

// Now we're done with the image, deactivate everything except core controllers
instance_deactivate_all(1);
instance_activate_object(obj_debug);
if global.update instance_activate_object(obj_ctrl_config);
instance_activate_object(obj_ctrl_input);
instance_activate_object(obj_ctrl_music);
instance_activate_object(obj_ctrl_filter);

if global.use_new_renderer 
then instance_activate_object(obj_ctrl_render)
else instance_activate_object(obj_ctrl_render_old);
