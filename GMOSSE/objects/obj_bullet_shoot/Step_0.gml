//change bullet behavior depending on the btype variable.
switch btype
    {
    case 0: break;
    case 1:
        {
        // Somewhat similar to Evaccaneer DOOM's shooting bullets.
        if shoot == 1
            {
            var a = scr_basicshot(x,y,global.lay_bullets,obj_bullet1,0.25,direction-45);
            var b = scr_basicshot(x,y,global.lay_bullets,obj_bullet1,0.25,direction+45);
            a.friction = -0.025; b.friction = -0.025;
            shoot = 0;
            alarm[0] = 20;
            }
        break;
        }
    case 2: if speed == 0 instance_destroy(); break; //see destroy event for details
    case 3: if speed == 0 instance_destroy(); break; //see destroy event for details
    case 4: 
        {
        // More similar to Evaccaneer DOOM's shooting bullets.
		var _target = instance_nearest(x,y,obj_hitbox);
		var _direct = instance_exists(_target) ? point_direction(x,y,_target.x,_target.y) : 270;
        var _bullet = scr_basicshot(x,y,global.lay_bullets,obj_bullet1,0.5,_direct);
        _bullet.friction = -0.025;
        break;
        }
    }   

