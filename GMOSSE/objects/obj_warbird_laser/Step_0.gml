// Aesthetics
image_angle = direction;
var yee = instance_create_depth(x,y,depth+1,obj_warbird_laser2);
yee.image_angle = image_angle;

// Change from player target to enemy
timer += 1;
if timer == 30 attacktarget = obj_en_parent;

// Turning laser behaviour
/*
ternary operator code explained:
if target (instance_nearest) doesn't return special value 'noone'
value 'angle' is declared as the point_direction result, 
otherwise it's just 90.
*/
var target = instance_nearest(x,y,attacktarget);
var angle = target != noone ? point_direction(x,y,target.x,target.y) : 90;
scr_turntoangle(angle,turnrate);