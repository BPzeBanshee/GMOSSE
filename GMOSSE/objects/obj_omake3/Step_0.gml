/* 
/\><3|<I|_|_J<>y |\/||< || , by BPzeBanshee
       (Omake 3 - AXEKILLJOY MK-II)
            
Summary of its parts:
* Body
- left arm
- right arm
- legs
both arms use obj_omake3_arm, no plans on doing Batrider Grubby bullshit
"head" is part of the body at exact center
legs is separate purely for depth trickery and nothing else

Control variables:
d1/d2 is offset from body angle + 90 degrees left/right from center
- left arm uses d1, right d2
by manipulating these variables individually you can make crude hand signal behaviour
            
Code blocks in order:
* Aesthetic code
* Boss orientation
* Attack phase
    - phase 0 is intro
    - will cycle through phase 1-3
    - will cycle through phase 2-4? on <=50% health
*/

/* 
AESTHETIC CODE

Only significant thing I have here for the body is the single thruster
on it's back. The rest I have delegated to the arm code in event_user(0) for now.
*/
var thr = scr_basicshot(x,y,layer,obj_explosion,5,image_angle+180+random_range(-10,10));
thr.depth = depth + 1;
thr.image_xscale = 0.25;
thr.image_yscale = 0.25;

/*
BOSS ORIENTATION

This part maintains the var aim to be the aim of the player hitbox
position according to the head of omake3 as well as the creation 
and updating of the two arms.
*/
// Main body
var p = instance_nearest(x,y,obj_hitbox);
if p != noone scr_turntoimageangle(point_direction(x,y,p.x,p.y),2);
var aim = image_angle;

// Update position variables for arms and arm pieces
x1 = x+lengthdir_x(36,aim+270); // left shoulder
y1 = y+lengthdir_y(36,aim+270);
x2 = x+lengthdir_x(36,aim+90); // right shoulder
y2 = y+lengthdir_y(36,aim+90);

if !made // Create the arms
    {
    arm_left = instance_create_layer(x1,y1,layer,obj_omake3_arm);
    arm_right = instance_create_layer(x2,y2,layer,obj_omake3_arm);
    arm_left.direction = image_angle; arm_left.image_yscale = -1;
    arm_right.direction = image_angle;
    made = true;
    }
else
    {
    // Left arm
    if instance_exists(arm_left)
        {
        arm_left.x = x1; arm_left.y = y1;
        arm_left.direction = image_angle+d1;
        }
    else
        {
        var e = scr_basicshot(x1,y1,layer,obj_explosion,5,aim+270+random_range(-30,30));
        e.depth = depth + 1;
        e.image_xscale = 0.5;
        e.image_yscale = 0.5;
        }
    // Right arm
    if instance_exists(arm_right)
        {
        arm_right.x = x2; arm_right.y = y2;
        arm_right.direction = image_angle+d2;
        }
    else 
        {
        var e = scr_basicshot(x2,y2,layer,obj_explosion,5,aim+90+random_range(-30,30));
        e.depth = depth + 1;
        e.image_xscale = 0.5;
        e.image_yscale = 0.5;
        }
    }

/*
ATTACK PATTERNS

I split this out into event_user calls for the sake of simplicity.
Manipulating patterns is hard enough without scrolling through a bunch
of aesthetic code and it's easier to look at stuff on a per-phase basis.
*/
event_user(phase);