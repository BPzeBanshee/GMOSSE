/*
Attack Phase 2: Circular explosions aimed at player hitbox

This is called by obj_boss along with obj_orb2's direct attack
*/
if count < 20 atk2_timer -= 1;
if atk2_timer == 0
    {
	var target = instance_nearest(x,y,obj_hitbox);
    scr_circleattack(40,x,y,3,obj_bullet1,target,4,true); //1,true
    scr_snd_play(snd_en_shot2,true);
    atk2_timer = 30;
    count += 1;
    }