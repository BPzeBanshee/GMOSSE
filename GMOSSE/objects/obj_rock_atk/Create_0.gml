var target = instance_nearest(x,y,obj_hitbox);
if target != noone
then direction = point_direction(x,y,target.x,target.y)
else direction = 270;

speed = 4;
turnspeed = 4;
enemyHP = 12.5;
event_inherited();