/// @description  Attack Phase 1: rapid spread shot aimed at player
if count < 4 then atk_timer -= 1;
if atk_timer < 8
    {
	var target = instance_nearest(x,y,obj_hitbox);
	var aim;
	if target == noone
	then aim = 270
    else aim = point_direction(x,y,target.x,target.y);
    scr_basicshot(x,y,global.lay_bullets,obj_bullet3,0,aim);
    scr_basicshot(x,y,global.lay_bullets,obj_bullet3,0,aim+20);
    scr_basicshot(x,y,global.lay_bullets,obj_bullet3,0,aim-20);
    scr_playsnd(snd_en_shot4,1);
    }      
if atk_timer == 0
    {
    atk_timer = 120; 
    count += 1;
    }

