/*
Attack Phase 3: Large explosion of bullets that home in on the player

This is called by obj_boss along with obj_orb2's direct attack
*/
atk2_timer -= 1;
if atk2_timer <= 5
    {
	var target = instance_nearest(x,y,obj_hitbox);
    scr_circleattack(40,x,y,0,obj_bullet4,target,4,false);
    scr_snd_play(snd_en_shot3,true);
    }
if atk2_timer == 0 atk2_timer = 30;

if enemyHP <= 100 atk3_timer -= 1; 
if atk3_timer == 0
    {
    atk3_timer = 90;
    var blast = scr_basicshot(x,y,global.lay_bullets,obj_bullet_shoot,0,0);
    blast.btype = 3;
    }