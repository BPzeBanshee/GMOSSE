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
        
Returns:
none
*/

//Variables from arguments
origin_x    = argument0
origin_y    = argument1
bullettype  = argument2
shootsound  = argument3
arc         = argument4
numbullets  = argument5
bulletspeed = argument6
imagedir    = argument7

//Get direction to shoot (from origin to player)
shootdir   = point_direction (origin_x, origin_y, obj_hitbox.x, obj_hitbox.y)

if numbullets > 1
    arcstart   = (shootdir - (arc / 2))
else
    arcstart   = shootdir
    
//play shoot sound (-1 plays no sound)
if shootsound >= 0
    {
    sound_stop(shootsound)
    sound_play(shootsound)
    }

for (bulletloop = 0; bulletloop < numbullets; bulletloop += 1)
    {
    mybullet = instance_create (origin_x, origin_y, bullettype)
    mybullet.direction = arcstart
    mybullet.speed = bulletspeed
    
    if imagedir = 1
        mybullet.image_angle = arcstart
    
    if numbullets > 1
        arcstart += arc / (numbullets - 1)
    }


