/* COMPULSORY */
global.level = -1;
global.pausable = true;
global.omake_enabled = true;
stage_time = 0;
completedelay = 0; // stage complete handling

/* VARIABLE HANDLING */
atk_timer = 0;

scr_layer_vars();
lay_planet = layer_get_id("lay_obj_planet");

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

/* BACKGROUND HANDLING */
scr_camera_init(0,80,0,0);
planet1 = instance_create_layer(200,134,lay_planet,obj_planet1);
planet1.image_angle = 46;

instance_create_layer(x+160,y+240,layer,obj_ctrl_game);