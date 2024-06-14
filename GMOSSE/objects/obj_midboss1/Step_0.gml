// Aesthetics
image_angle += 1;

// *************ATTACK PATTERN CODE**************
switch mode
    {
    case 0:
        {
        if y > (yview-sprite_width/2)
            {
            scr_create_healthbar();
            mode = 1;
            }
        break;
        }
    case 1: 
        {
        // Intro
        speed -= 0.05;
        if speed < 0.05
            {
            speed = 0;
            mode = 2;
            }
        break;
        }
    case 2: 
        {
        // Attack Patterns
        timer += 1; 
        if timer == 60
            {
            var b = scr_basicshot(x,y,global.lay_bullets,obj_bullet_shoot,0,270);
            b.btype = 3;
            scr_snd_play(snd_en_shot2,true);
            timer = 0;
            }
            
        // Boss Timeout
        timeout -= 1;    
        if timeout <= 0 mode = 3;
        break;
        }
    case 3:
        {
        // Timeout Behaviour
        speed += 0.05;
        if y > yview+320+(sprite_width/2) instance_destroy();
        break;
        }
    }

