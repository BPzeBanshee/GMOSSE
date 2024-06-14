// STAGE CLEAR HANDLING
if stage_time > 1000 
&& !instance_exists(obj_omake3) 
&& !obj_ctrl_music.fading_out
completedelay += 1;
if completedelay == 120
	{
	instance_destroy(obj_light_gen);
	instance_create_layer(x,y,global.lay_en_air,obj_ctrl_clear);
	}

// STAGE TIMELINE
stage_time += 1;
switch stage_time
    {
    case 60:
        {
        //instance_create_layer(x,y,layer,obj_warning);
        var w = instance_create_layer(x,y,layer,obj_danger);
        w.msg = "/\\><3|<I|_|_J<>Y |\\/||< ||\nAPPROACHING";
        break;
        }
    case 150:
        {
        instance_create_layer(160,yview-64,global.lay_en_air,obj_omake3);
        break;
        }
    }