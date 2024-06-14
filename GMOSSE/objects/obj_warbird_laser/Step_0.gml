// Aesthetics
image_angle = direction;
var yee;
yee = instance_create_depth(x,y,depth+1,obj_warbird_laser2);
yee.image_angle = image_angle;

// Change from player target to enemy
timer += 1;
if timer == 30 attacktarget = obj_en_parent;

// Turning laser behaviour
var angle;
if instance_exists(attacktarget)
    {
    var target = instance_nearest(x,y,attacktarget);
    angle = point_direction(x,y,target.x,target.y);
    }
else angle = 90;
scr_turntoangle(angle,turnrate);