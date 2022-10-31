global.level = -11;
global.pausable = true;

stage_time = 0;
completedelay = 0;

scr_layer_vars();

// ROCKS!
var rx,ry,rs,rd,r;
repeat 30
    {
    rx = random_range(2,318);
	ry = random_range(2,318);
    rs = random_range(5,15);
    rd = random_range(240,300);
    r = scr_basicshot(rx,ry,global.lay_en_ground,obj_rock,rs,rd);
    r.z = random(100);
    }

scr_camera_init(0,80,0,0);
instance_create_layer(x+160,y+240,layer,obj_ctrl_game);