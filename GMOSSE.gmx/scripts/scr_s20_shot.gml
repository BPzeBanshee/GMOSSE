/*
originally shot_primary, by S20-TBL
renamed and random variables commented out
by BPzeBanshee for consistency
*/
// The new ubiquitous fire button!
// Format: shot_primary(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10)
// WHERE:
// argument0 = random number to add to starting x position
// argument1 = random number to subtract from argument0
// argument2 = random number to add to starting y position
// argument3 = random number to subtract from argument0
// argument4 = projectile type
// argument5 = variable to add to initial shot angle
// argument6 = variable to subtract from argument5
// argument7 = base projectile speed
// argument8 = random number to subtract from argument7
// argument9 = projectile friction. For special projectile types only (e.g. shot_burst)
// argument10 = object from which the projectile is fired


var fire1;
fire1=instance_create(/*(*/argument10.x/*+(random(argument0))-argument1)*/,/*(*/argument10.y/*+(random(argument2)-argument3))*/,argument4);
fire1.direction=argument5/*+random(argument6)*/;
fire1.speed=argument7/*+random(argument8)*/;
fire1.friction=argument9;
//fire1.image_alpha=fire1.speed; // optional if you want the shot to fade out or something
fire1.image_angle=fire1.direction; // if the bullet doesn't have image_angle to direction coded in, turn this on
