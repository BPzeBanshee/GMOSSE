/// @description  Update surface
if !surface_exists(surf) surf = surface_create(240,320);
surface_set_target(surf);
draw_clear_alpha(c_white,0);
surface_reset_target();
surface_copy(surf,0,0,application_surface);

