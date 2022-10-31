// \/\/ GLOBAL/TIMELINE VARIABLES \/\/
global.level = 2;
global.pausable = true;
global.omake_enabled = false;

// \/\/ STEP-BASED TIMELINE VARIABLES \/\/
stage_time = 0;
completedelay = 0; // initialise variable for stage complete handling

// \/\/ BACKGROUND INITIALISATION/LOADING \/\/
l1 = layer_get_id("lay_bkg2");
l2 = layer_get_id("lay_bkg3");
layer_vspeed(l1,-0.495);
layer_vspeed(l2,-0.495);

scr_camera_init(0,80,0,-0.5);
instance_create_layer(x+160,y+240,layer,obj_ctrl_game);

/*
// Enemy handling
instance_deactivate_object(obj_en_wall);
instance_deactivate_object(obj_en_parent);
instance_activate_region(0,12478,320,320,true);

instance_deactivate_object(obj_en_wall);
instance_deactivate_object(obj_en_parent);
instance_activate_region(0,2094,320,320,true);
*/