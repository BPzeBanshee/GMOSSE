/* STAGE COMPLETE HANDLING */
if stage_time > 10000
&& !instance_exists(obj_omake3) && !obj_ctrl_music.fade_out
then completedelay += 1;

if completedelay == 120
    {
    with obj_rain instance_destroy();
    with obj_cloud instance_destroy();
    with obj_light_gen instance_destroy();
    instance_create_layer(x,y,global.lay_en_air,obj_ctrl_clear);
    }

/* STAGE TIMELINE */
stage_time += 1;
switch stage_time
    {
    case 60:
        {
        //instance_create_layer(160,0,global.lay_en_air,obj_3Den4s);
        //stage_time = 0;
        //a = instance_create_layer(xview,yview+120,global.lay_en_air,obj_en5);
        //with a path_start(pth_test,5,0,0);
        //instance_create_layer(120,-240,global.lay_en_air,obj_boss3);
        //w = instance_create_layer(x,y,layer,obj_danger);
        //w.msg = "/\X3|<I|_|_J<>y |\/||< ||#APPROACHING";
        //instance_create_layer(x,y,layer,obj_warning);
        break;
        }
    case 300:
        {
        instance_create_layer(0,0,layer,obj_textbox);
        //a = instance_create_layer(xview,yview+120,global.lay_en_air,obj_en5);
        //with a path_start(pth_test,5,0,0);
        //instance_create_layer(160,yview-64,global.lay_en_air,obj_omake3);
        //instance_create_layer(120,-240,global.lay_en_air,obj_boss3);
        break;
        }
    }

if keyboard_check(ord("Q")) && !instance_exists(obj_static_test)
then instance_create_layer(xview,yview,layer,obj_static_test);
if keyboard_check(ord("W")) && !instance_exists(obj_beam_s)
    {
    var b;
    b = instance_create_layer(160,40,global.lay_bullets,obj_beam_s);
    b.direction = point_direction(b.x,b.y,obj_hitbox.x,obj_hitbox.y);
    }
if keyboard_check(ord("E")) && !instance_exists(obj_beam)
    {
    var b;
    b = instance_create_layer(160,40,global.lay_bullets,obj_beam);
    b.direction = point_direction(b.x,b.y,obj_hitbox.x,obj_hitbox.y);
    }