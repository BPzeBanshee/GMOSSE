parent = noone;
image_timer = 0;
image_blend = c_white;
image_angle = 90;
angle = 90;
program = 0;
hook = 0;

fire_weapon = function(){
	switch parent.weapon
	    {
	    case 1:
	        {
	        if instance_number(obj_bh_shot1)>5 exit;
	        scr_basicshot(x,y,layer,obj_bh_shot1,13,image_angle);
	        scr_snd_play(snd_bh_shot1,true);
	        break;
	        }
	    case 2:
	        {
	        if instance_number(obj_bh_shot2)>10 then exit;
	        scr_basicshot(x,y,layer,obj_bh_shot2,10,image_angle);
	        scr_snd_play(snd_bh_shot2,true);
	        break;
	        }
	    case 3:
	        {
	        if instance_number(obj_bh_shot3)>12 then exit;
	        scr_basicshot(x,y,layer,obj_bh_shot3,9,image_angle);
	        scr_snd_play(snd_bh_shot3,true);
	        break;
	        }
	    case 4:
	        {
	        if instance_number(obj_bh_shot4)>2 then exit;
	        scr_basicshot(x,y,layer,obj_bh_shot4,3.5,image_angle);
	        break;
	        }
	    case 5:
	        {
	        if instance_number(obj_bh_shot5)>1 then exit;
	        var shot = instance_create_layer(x,y,layer,obj_bh_shot5);
	        shot.parent = id;
	        break;
	        }
	    case 6:
	        {
	        scr_basicshot(x,y,layer,obj_bh_shot6,5,image_angle);
	        break;
	        }
	    case 7:
	        {
	        if instance_number(obj_bh_shot7) > 7 exit;
	        scr_basicshot(x,y,layer,obj_bh_shot7,8,image_angle);
	        scr_basicshot(x,y,layer,obj_bh_shot7,8,image_angle-30);
	        scr_basicshot(x,y,layer,obj_bh_shot7,8,image_angle-60);
	        scr_basicshot(x,y,layer,obj_bh_shot7,8,image_angle+30);
	        scr_basicshot(x,y,layer,obj_bh_shot7,8,image_angle+60);
	        scr_snd_play(snd_bh_shot1,true);
	        break;
	        }
	    }
	}