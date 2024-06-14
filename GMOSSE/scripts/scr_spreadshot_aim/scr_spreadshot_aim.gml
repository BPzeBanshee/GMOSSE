/*
Aimed bullet spread shot script by Alluro,
with modifications by BPzeBanshee
*/
/// @desc Shoots an arc of bullets aimed at the player. Written by Alluro, modified by BPzeBanshee.
/// @param {Real} origin_x
/// @param {Real} origin_y
/// @param {Asset.GMObject} bullettype
/// @param {Asset.GMSound} shootsound
/// @param {Real} arc
/// @param {Real} numbullets
/// @param {Real} bulletspeed
/// @param {Bool} imagedir
/// @param {Real} shootdir
function scr_spreadshot_aim(origin_x,origin_y,bullettype,shootsound,arc,numbullets,bulletspeed,imagedir,shootdir) {
	var arcstart;
	if numbullets > 1
	then arcstart = (shootdir - (arc / 2))
	else arcstart = shootdir;
    
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