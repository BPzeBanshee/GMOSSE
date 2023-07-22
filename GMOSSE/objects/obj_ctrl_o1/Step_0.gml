/* STAGE CLEAR HANDLING */
if stage_time > 1000 
&& !instance_exists(obj_omake1) 
&& !obj_ctrl_music.fading_out
then completedelay += 1;
if completedelay == 120
    {
    instance_create_layer(x,y,global.lay_en_air,obj_ctrl_clear);
    with obj_rock instance_destroy();
    }

/* STAGE TIMELINE */
stage_time += 1;
switch stage_time
    {
    case 120:
        {
        var w = instance_create_layer(x,y,layer,obj_danger);
        w.msg = "|<||_|_3R <|_0\\/\\/|\\| ||\nAPPROACHING";
		
		instance_create_layer(0,0,global.lay_en_ground,obj_bkg_redfade);
        break;
        }
    case 210://case 400:
        {
        //with obj_rock dead = 1;
        instance_create_layer(160,88,global.lay_en_air,obj_omake1);
        break;
        }
    }
   
/* AESTHETICS */
if stage_time > 210 && !instance_exists(obj_omake1)
    {
	var l = global.lay_bkg;
    if layer_get_vspeed(l) < 4
		{
		var spd = layer_get_vspeed(l);
		layer_vspeed(l,spd+0.1);
		}
    }