image_angle += 8;

// Attack patterns
if phase < 5 then attack_timer += 1;
if attack_timer == 30
    {
    scr_spreadshot(x,y,obj_bullet2,-1,40,2,4,true);
    scr_playsnd(snd_en_shot2,1);
    attack_timer = 0;
    }
if attack_timer > 25
    {
    // lock aim into place
    if attack_timer == 26
		{
		var target = instance_nearest(x,y,obj_hitbox);
		if target == noone
		then aim = 270
		else aim = point_direction(x,y,target.x,target.y);
		}
    
    // take the shot
    scr_basicshot(x,y,global.lay_bullets,obj_bullet1,5,aim);
    scr_playsnd(snd_en_shot3,1);
    }

// Action timer
timer += 1;
if timer == 240
    {
    phase += 1;
    var child = instance_create_layer(x,y,layer,obj_3Den2_alt);
    child.enemyHP = enemyHP;
    child.enemyHP_max = enemyHP_max;
    child.phase = phase;
    child.image_angle = image_angle;
    child.z_speed = z_speed;
    instance_destroy();
    }

if phase == 5 
    {
    speed = 3; 
    direction = 270; 
    attack_timer = 0;
    }
if y > yview+320+(sprite_height/2) then instance_destroy();