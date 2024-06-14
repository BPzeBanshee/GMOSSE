if stage_time > 220 
&& !instance_exists(obj_omake2)
&& !obj_ctrl_music.fading_out
completedelay += 1;
if completedelay == 120 instance_create_layer(x,y,global.lay_en_air,obj_ctrl_clear);

/* STAGE TIMELINE */
stage_time += 1;
switch stage_time
    {
    //case 60:
	case 120:
        {
        var w = instance_create_layer(x,y,layer,obj_danger);
		w.msg = "4|\\|71(|-|R1$7 ||\nAPPROACHING";
		instance_create_layer(0,0,global.lay_en_ground,obj_bkg_redfade);
        break;
        }
    //case 400:
	case 220:
        {
        instance_create_layer(160,yview-16,global.lay_en_air,obj_omake2);
        break;
        }
    }