/*
scr_pause()

Pauses the game using deactivation of objects,
and provides a stillscreen image to draw to
fake the impression of everything having frozen.
*/

p = 0;

// Freeze background positions/save speeds
for (i=0; i<=7; i+=1)
    {
    bkg_vspd[i] = background_vspeed[i];
    bkg_hspd[i] = background_hspeed[i];
    bkg_alph[i] = background_alpha[i];
    background_vspeed[i] = 0;
    background_hspeed[i] = 0;
    }

// Capture image of screen (without debug text)
instance_deactivate_object(obj_debug);
instance_deactivate_object(obj_ctrl_music);

/*if global.surfaces = 0 // Normal Method
    {
    //screen_redraw();
    p = sprite_create_from_screen(0,0,window_get_width(),window_get_height(),0,0,0,0);
    s = 1 / global.win_size;
    s2 = (global.win_size-1)/6;
    }*/
//if global.surfaces = 1 || p = -1// When sprite_create_from_screen fails
//    {
    surf = surface_create(view_wview,view_hview);
    surface_set_target(surf);
    draw_clear_alpha(c_black,1);
//    screen_redraw();
    surface_reset_target();
    p = sprite_create_from_surface(surf,0,0,view_wview,view_hview,false,false,0,0);
    surface_free(surf);
    s = 1;
    s2 = 0;
//    }

// Deactivate everything else/reactivate core stuff
instance_deactivate_all(1);
if global.update instance_activate_object(obj_ctrl_config);
instance_activate_object(obj_ctrl_input);
instance_activate_object(obj_debug);
instance_activate_object(obj_ctrl_music);
//instance_activate_object(obj_ctrl_cleanmem);
