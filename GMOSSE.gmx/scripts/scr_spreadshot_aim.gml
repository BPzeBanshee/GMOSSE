///scr_spreadshot_aim(origin_x,origin_y,bullettype,shootsound,arc,numbullets,bulletspeed,imagedir,direction)
/*
Aimed bullet spread shot script
by Alluro
    
Function:
Shoots an arc of bullets aimed at the player.
    
Usage:
aimedspreadshot(origin_x,origin_y,bullettype,shootsound,arc,numbullets,bulletspeed)
        
Arguments:
originx,     : the x/y location where the shot will originate
originy
bullettype   : the bullet OBJECT to shoot
shootsound   : the sound to play when shooting (-1 plays no sound)
arc          : arc (in degrees) the spread will cover
numbullets   : the number of bullets in the spread
bulletspeed  : the speed the bullets will travel
imagedir     : whether the sprite angle will be turned to instance's direction or not
shootdir     : the direction to shoot at
        
Returns:
none
*/
var origin_x,origin_y,bullettype,shootsound,arc,numbullets,bulletspeed,imagedir,shootdir;

//Variables from arguments
origin_x    = argument0;
origin_y    = argument1;
bullettype  = argument2;
shootsound  = argument3;
arc         = argument4;
numbullets  = argument5;
bulletspeed = argument6;
imagedir    = argument7; // true or false
shootdir    = argument8; // Get direction to shoot (from origin to player)

if numbullets > 1
then arcstart = (shootdir - (arc / 2))
else arcstart = shootdir;
    
//play shoot sound (-1 plays no sound)
if shootsound >= 0 then scr_playsnd(shootsound,1);

var mybullet;
for (bulletloop = 0; bulletloop < numbullets; bulletloop += 1)
    {
    mybullet = instance_create(origin_x, origin_y, bullettype);
    mybullet.direction = arcstart;
    mybullet.speed = bulletspeed;
    
    if imagedir = 1 then mybullet.image_angle = arcstart;
    
    if numbullets > 1 then arcstart += arc / (numbullets - 1);
    }
