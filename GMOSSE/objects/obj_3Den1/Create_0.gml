/*
obj_3Den1, by BPzeBanshee

enemyHP is initially declared here but note
that when it is recreated by 3Den1_alt that
passing variables to an object on its Create
overrides what is present here.

For example:
ayy = instance_create_layer(120,30,global.lay_en_air,obj_3Den3);
ayy.enemyHP = 10;

will override the value of 40 set here.
This allows for the illusion of an enemy
returning when it's actually a new object
altogether.
*/
enemyHP = 40;
event_inherited();

dead = false;
z_speed = 4;

jump_timer = 180;
jump_count = 0;

scr_circleshot02(30,x,y,0,obj_bullet2,4,false);
scr_snd_play(snd_en_shot2,true);