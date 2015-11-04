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
    bkg_alpha[i] = background_alpha[i];
    background_vspeed[i] = 0;
    background_hspeed[i] = 0;
    }

// Capture image of screen (without debug text)
instance_deactivate_object(obj_debug);
instance_deactivate_object(obj_ctrl_music);

surf = surface_create(view_wport,view_hport);
surface_set_target(surf);
draw_clear_alpha(c_black,1);
draw_set_blend_mode_ext(bm_one, bm_inv_src_alpha);
if surface_exists(application_surface) then draw_surface(application_surface,0,0);
draw_set_blend_mode(bm_normal);
surface_reset_target();

p = sprite_create_from_surface(surf,0,0,view_wport,view_hport,false,false,0,0);
surface_free(surf);

s = 1;
s2 = 0;

// Deactivate everything else/reactivate core stuff
instance_deactivate_all(1);
if global.update instance_activate_object(obj_ctrl_config);
instance_activate_object(obj_ctrl_input);
instance_activate_object(obj_debug);
instance_activate_object(obj_ctrl_music);
instance_activate_object(obj_ctrl_filter);
