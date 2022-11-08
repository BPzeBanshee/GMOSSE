// This is the health handling.
enemyHP = 20;
event_inherited();

// Misc. variables
direction = 270;
speed = 4;
shot_timer = 120;
thr_timer = 0;
num_of_shots = 2;
mode = 0;

/*
9-11-22
Let it be known here that an attempt was made to make this enemy
use a GM path while retaining it's screenbound nature as a child
of obj_en_air. 

The closest-to-working code was as follows:
// Room Creation Code
mypath = path_duplicate(pth_test2);
path_shift(mypath,x,y);
path_start(mypath,5,path_action_restart,true);

// Step (or Pre-Draw, keep reading)
var pp = path_position;
path_end();
path_shift(mypath,spd_x,spd_y);
path_start(mypath,5,path_action_restart,true);
path_position = pp;

The end result was eldritch-horror-worthy.
If executed in Step, the main sprite would move but direction
changing was off-key, and the thrusters would only spawn from
x/ystart.
If executed in Pre-Draw, the main sprite would appear to be
locked at x/ystart but the collision hitbox would move along
the path, resulting in player death if the ship was parked
next to it despite nothing visually being nearby.

TLDR: if you use GM paths, use obj_en_ground children and
keep them world-bound. Paths force an object to ignore all
movement input thus forcing them world-bound.
*/