global.pausable = true;
global.level = -22;

stage_time = 0;
completedelay = 0;
scr_camera_init(0,80,0,0);
instance_create_layer(x+160,y+240,layer,obj_ctrl_game);