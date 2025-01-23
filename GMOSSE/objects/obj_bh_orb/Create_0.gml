parent_id = noone;
image_timer = 0;
image_blend = c_white;
image_angle = 90;
angle = 90;
program = 0;

fire_weapon = function(){
	var s[];
	switch parent_id.weapontype
	    {
	    case 1:
	        {
	        if instance_number(obj_bh_shot1)>5 exit;
	        s[0] = scr_player_shot(x,y,obj_bh_shot1,13,image_angle);
	        scr_snd_play(snd_bh_shot1,true);
	        break;
	        }
	    case 2:
	        {
	        if instance_number(obj_bh_shot2)>10 exit;
	        s[0] = scr_player_shot(x,y,obj_bh_shot2,10,image_angle);
	        scr_snd_play(snd_bh_shot2,true);
	        break;
	        }
	    case 3:
	        {
	        if instance_number(obj_bh_shot3)>12 exit;
	        s[0] = scr_player_shot(x,y,obj_bh_shot3,9,image_angle);
	        scr_snd_play(snd_bh_shot3,true);
	        break;
	        }
	    case 4:
	        {
	        if instance_number(obj_bh_shot4)>2 exit;
	        s[0] = scr_player_shot(x,y,obj_bh_shot4,3.5,image_angle);
	        break;
	        }
	    case 5:
	        {
	        if instance_number(obj_bh_shot5)>1 exit;
	        s[0] = scr_player_shot(x,y,obj_bh_shot5,0,image_angle,true);
	        break;
	        }
	    case 6:
	        {
	        s[0] = scr_player_shot(x,y,obj_bh_shot6,5,image_angle);
	        break;
	        }
	    case 7:
	        {
	        if instance_number(obj_bh_shot7) > 7 exit;
	        s[0] = scr_player_shot(x,y,obj_bh_shot7,8,image_angle);
	        s[1] = scr_player_shot(x,y,obj_bh_shot7,8,image_angle-30);
	        s[2] = scr_player_shot(x,y,obj_bh_shot7,8,image_angle-60);
	        s[3] = scr_player_shot(x,y,obj_bh_shot7,8,image_angle+30);
	        s[4] = scr_player_shot(x,y,obj_bh_shot7,8,image_angle+60);
	        scr_snd_play(snd_bh_shot1,true);
	        break;
	        }
	    }
	for (var i=0; i<array_length(s); i++) 
		{
		s[i].blend = image_blend;
		}
	}