atk2_timer -= 1;
if atk2_timer <= 5
    {
    scr_circleattack(40,x,y,0,obj_bullet4,obj_hitbox,4,false);
    scr_snd_play(snd_en_shot3,true);
    }
if atk2_timer == 0 then atk2_timer = 30;

if enemyHP <= 100 then atk3_timer -= 1; 
if atk3_timer == 0
    {
    atk3_timer = 90;
    var blast;
    blast = scr_basicshot(x,y,global.lay_bullets,obj_bullet_shoot,0,0);
    blast.btype = 3;
    }

