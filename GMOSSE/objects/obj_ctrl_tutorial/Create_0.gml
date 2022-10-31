global.level = 60;
global.pausable = true;

stage_time = 0;
scr_camera_init(0,80,0,0);
instance_create_layer(x+160,y+240,layer,obj_ctrl_game);