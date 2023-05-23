global.level = -666;
global.pausable = true;
global.omake_enabled = false;

stage_time = 0;
completedelay = 0;

scr_layer_vars();

var xx,yy,dd,ss,ra;
repeat 15
    {
    xx = random(320);
    yy = random(320);
    dd = random_range(260,280);
    ss = random_range(7,12);
    ra = scr_basicshot(xx,yy,global.lay_en_ground,obj_rain,ss,dd);
    //ra.depth = random_range(0,1500);
    }

scr_camera_init(0,80,0,0);
instance_create_layer(x+160,y+240,layer,obj_ctrl_game);

/*z = 0;
fx = layer_get_fx("Effect_1");
show_debug_message(fx_get_parameters(fx));*/