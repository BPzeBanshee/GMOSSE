// \/\/ MISC. GLOBAL/TIMELINE VARIABLES \/\/
global.level = -2;
global.pausable = true;
global.omake_enabled = true;

completedelay = 0; 
stage_time = 5800;

// \/\/ BACKGROUND INITIALISATION/LOADING \/\/
l1 = layer_get_id("lay_bkg2");
l2 = layer_get_id("lay_bkg3");
layer_vspeed(l1, -0.99);
layer_vspeed(l2, -0.99);

scr_camera_init(0,80,0,-1);
instance_create_layer(x+160,y+240,layer,obj_ctrl_game);

/*
instance_deactivate_object(obj_en_wall);
instance_deactivate_object(obj_en_parent);
instance_activate_region(0,2094,320,320,true);
*/