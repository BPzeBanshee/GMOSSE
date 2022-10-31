/* AESTHETICS */
var thr1 = scr_basicshot(x,y,layer,obj_explosion,random(6),direction+180-45+random_range(-20,20));
var thr2 = scr_basicshot(x,y,layer,obj_explosion,random(6),direction+180+45+random_range(-20,20));
thr1.depth = depth + 1;
thr2.depth = depth + 1;
thr1.image_xscale = 0.75;
thr1.image_yscale = 0.75;
thr2.image_xscale = 0.75;
thr2.image_yscale = 0.75;

/* BEHAVIOUR */
enemyHP = timeout;
switch mode
    {
    case 0:
        {
        if speed > 0 then speed -= 0.2;
        if speed <= 0 then timer += 1;
        if timer == 30
            {
            vspeed = 0;
            timer = 0;
            hspeed = 5;
            mode = 1;
            }
        break;
        }
    case 1:
        {
        timer += 1;
        if instance_exists(obj_player) then scr_addscore(1000,0,0); // no logging
        
        // Move around very fast
        if x >= 320-64 || x <= 64 then hspeed = -hspeed;
        
        // Attack 1
        switch timer
            {
            case 10: case 20: case 30: case 40: case 50: case 60:
            case 70: case 80: case 90: case 100: case 110: case 120:
            scr_playsnd(snd_en_shot1,1);
            scr_spreadshot(x,y,obj_bullet1,-1,55,7,8,true); 
            break;
            }
            
        // Attack 2A
        if timer > 150 && timer < 200
            {
            scr_playsnd(snd_en_shot4,1);
            scr_basicshot(x,y,global.lay_bullets,obj_bullet4,6,d); // was 8, then 7
            d -= 10;
            }
        if timer = 200 then d = 270;
        
        // Attack 2B
        if timer > 230 && timer < 270
            {
            scr_playsnd(snd_en_shot2,1);
            scr_basicshot(x,y,global.lay_bullets,obj_bullet2,6,d); // was 8, then 7
            d += 10;
            }
        if timer == 320
            {
            timer = 0;
            d = 270;
            }
        //enemyHP = timeout;
        if timeout > 0 then timeout -= 1;
        if timeout == 0 && x == 160 then mode = 2;
        break;
        }
    case 2:
        {
        hspeed = 0;
        vspeed -= 0.2;
        if y < yview-(sprite_width/2) then instance_destroy();
        break;
        }
    }