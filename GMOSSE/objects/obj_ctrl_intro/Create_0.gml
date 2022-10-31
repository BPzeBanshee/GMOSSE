c = 0;
timer = 0;
global.behaviour = 2;
if global.intro then mode = 1 else mode = 2;

lay_fx = layer_get_id("lay_menu_fx");

instance_create_layer(120,160,lay_fx,obj_warp_gen);
repeat 30 instance_create_layer(room_width/2,room_height/2,lay_fx,obj_star);
if mode == 1
    {
    left_piece = instance_create_layer(-120,75,lay_fx,obj_logo2);
    right_piece = instance_create_layer(360,75,lay_fx,obj_logo2);
    with obj_warp_gen visible = false;
    with obj_star visible = false;
    }
else 
    {
    instance_create_layer(119,75,layer,obj_title);
    with obj_warp_gen visible = true;
    with obj_warp visible = true;
    with obj_star visible = true;
    }