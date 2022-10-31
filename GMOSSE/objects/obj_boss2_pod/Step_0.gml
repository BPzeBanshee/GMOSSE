// Initial/exit invulnerability
if image_alpha < 1 then enemyHP = enemyHP_max;
image_angle = direction;

// Flash
if (enemyHP > 200 && enemyHP < 225)
|| (enemyHP > 100 && enemyHP < 125)
    {
    flash_timer += 1;
    if flash_timer == 8
        {
        image_blend = c_red;
        flash_timer = 0;
        }
    if flash_timer == 2 then image_blend = c_white;   
    }
else image_blend = c_white;

// Pattern-specific behaviour
var ang;
if instance_exists(obj_hitbox)
    {
    var tar = instance_nearest(x,y,obj_hitbox);
    ang = point_direction(x,y,tar.x,tar.y);
    }
else ang = 270;
scr_turntoangle(ang,1);

switch mode
    {
    case 0:
        {
        if image_alpha == 1 then mode = 1;
        break;
        }
    case 1:
        {
        if enemyHP <= 200
            {
            scr_playsnd(snd_exp3,0);
            scr_create_exp(obj_explosion,360,18); 
            sprite_index = spr_boss2_orbB;
            scr_addscore(5000,180,1);
            mode = 2;
            }
        break;
        }
    case 2:
        {
        if enemyHP <= 100
            {
            scr_playsnd(snd_exp3,0);
            scr_create_exp(obj_explosion,360,18); 
            sprite_index = spr_boss2_orbC; 
            scr_addscore(5000,180,1);
            mode = 3;
            }
        break;
        }
    case 3: break;
    }

