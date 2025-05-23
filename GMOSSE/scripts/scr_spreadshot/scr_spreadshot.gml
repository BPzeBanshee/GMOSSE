/// @desc Shoots an arc of bullets aimed at the player. Written by Alluro with modifications by BPzeBanshee.
/// @param {Real} origin_x				the x/y location where the shot will originate
/// @param {Real} origin_y
/// @param {Asset.GMObject} bullettype	the bullet OBJECT to shoot
/// @param {Real} shootsound			the sound to play when shooting (-1 plays no sound)
/// @param {Real} arc					arc (in degrees) the spread will cover
/// @param {Real} numbullets			the number of bullets in the spread
/// @param {Real} bulletspeed			the speed the bullets will travel
/// @param {Bool} imagedir				if true, rotate the image of the created bullet to value of shootdir
function scr_spreadshot(origin_x,origin_y,bullettype,shootsound,arc,numbullets,bulletspeed,imagedir) {

	//Get direction to shoot (from origin to player)
	var target = instance_nearest(x,y,obj_hitbox);
	var shootdir = 270;
	if target != noone
	shootdir = point_direction(origin_x, origin_y, target.x, target.y);

	var arcstart = shootdir;
	if numbullets > 1 arcstart = (shootdir - (arc / 2));
    
	//play shoot sound (-1 plays no sound)
	if audio_exists(shootsound) scr_snd_play(shootsound,true);

	var mybullet;
	for (var bulletloop = 0; bulletloop < numbullets; bulletloop += 1)
	    {
	    mybullet = instance_create_layer(origin_x, origin_y, global.lay_bullets, bullettype);
	    mybullet.direction = arcstart;
	    mybullet.speed = bulletspeed;
    
	    if imagedir == true mybullet.image_angle = arcstart;
    
	    if numbullets > 1 arcstart += arc / (numbullets - 1);
	    }
}