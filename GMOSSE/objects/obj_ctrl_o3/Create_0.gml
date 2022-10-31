global.level = -33;
global.pausable = true;

scr_layer_vars();

instance_create_layer(0,0,global.lay_en_ground,obj_light_gen);
instance_create_layer(32,-48,global.lay_en_ground,obj_cloud);
instance_create_layer(128,352,global.lay_en_ground,obj_cloud);
instance_create_layer(288,160,global.lay_en_ground,obj_cloud);
	
var xx,yy,dd,ss,ra;
repeat 15
    {
    xx = random(320);
    yy = random(320);
    dd = random_range(260,280);
    ss = random_range(7,12);
    ra = scr_basicshot(xx,yy,global.lay_en_ground,obj_rain,ss,dd);
    //ra.depth = random_range(0,1500);
    //ra.image_alpha = 0;
    }

stage_time = 0;
completedelay = 0;
scr_camera_init(0,80,0,0);
instance_create_layer(x+160,y+240,layer,obj_ctrl_game);