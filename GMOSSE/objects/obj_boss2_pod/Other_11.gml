if alt == 0
then scr_spreadshot_aim(x,y,obj_bullet3,-1,25,5,4,true,direction);//4.5
else scr_circleattack(45,x,y,0,obj_bullet3,obj_hitbox,6,true);
alt = !alt; // binary switch value, 0 becomes 1, 1 becomes 0
scr_snd_play(snd_en_shot4,true);