/*
Attack Phase 1: Bullet barrage of varied speeds aimed at player

This executes in increments, each barrage of shots happen 8 times,
with 4 barrages in total. Called by obj_boss before said boss
performs its own circular attack.
*/
if count2 < 4 then atk_timer -= 1;
if atk_timer == 0
    {
	var target = instance_nearest(x,y,obj_hitbox);
	var aim;
	if target == noone
	then aim = 270
	else aim = point_direction(x,y,target.x,target.y);
    repeat 5
        {
        scr_basicshot(x,y,global.lay_bullets,obj_bullet1,spd,aim);
        spd += 0.5;
        }
    spd = 4;
    scr_snd_play(snd_en_shot1,true);
    atk_timer = 4;
    count += 1;
    }
if count == 8
    {
    count2 += 1;
    atk_timer = 30;
    count = 0;
    }