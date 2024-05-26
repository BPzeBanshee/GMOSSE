// Compulsory
enemyHP = 40;
event_inherited();

// Attack-related
timer = 0;
count = 0;

// Misc
thr_timer = 0;

// Aim at hitbox
set_aim = function(){
var target = instance_nearest(x,y,obj_hitbox);
direction = instance_exists(target) ? point_direction(x,y,target.x,target.y) : 270;
}
set_aim();