// \/\/ STEP-BASED TIMELINE VARIABLES \/\/
stage_time = 0;
completedelay = 0; 
global.pausable = true;
global.omake_enabled = 0;
global.level = 3; // used for game completion/object deletion checking

// \/\/ BACKGROUND INITIALISATION/LOADING \/\/
start = 3500;
finish = start+1400;
global.behaviour = 4; // determines behaviour of stars (if used)
scr_camera_init(0,80,0,0);
scr_layer_vars();
instance_create_layer(x+160,y+240,layer,obj_ctrl_game);