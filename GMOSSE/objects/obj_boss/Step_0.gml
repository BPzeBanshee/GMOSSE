/*************THE PLAN***********
*attack pattern 1*
There is no actual attacking involved. 
This is the spawn handling, where the main orb moves down 
and after a second (move_timer=60) creates the green outer orb, 
which will perform the REAL first attack pattern. 
The green orb will determine when to initiate
the main orb's second attack pattern.

*attack pattern 2*
This is the circle attack using S20-TBL's script, in turn 
based off some guy called GodHand from the YoyoGames forums. 
Red bullets will appear on the outer edges of the main orb 
and shoot 10 times before going to its next attack pattern immediately.

*attack pattern 3*
Again, no attack directly involved. 
It spawns the second, purple orb which will do the
attacking in co-ordination with the green orb. 
The purple orb will determine when to initiate the next attack pattern.

*attack pattern 4*
Launches special bullets in a loose circle pattern 
(like attack pattern 2 but less dense)
which due to passing the bullettype variable to the 
special bullets will explode into more bullets. 
Similar to DodonPachi Dai-Ou-Jou's Stage 1 boss canister attacks.*/

// Aesthetics
var thr = scr_basicshot(x,y,layer,obj_en_thr,irandom_range(5,7),irandom_range(240,300));
//thr.depth = depth + 1;
thr.image_xscale = irandom_range(2,4);
thr.image_yscale = thr.image_xscale;
thr.image_angle = random(360);
thr.image_speed = 0.5;

// Timeout
if timeout > 0 then timeout -= 1;
if timeout == 0 then phase = 7;

// Movement-related code
move_timer += 1;
if move_timer = 60 then vspeed = 0;
if move_timer < 60 then enemyHP = enemyHP_max;

// Attack behaviour
switch phase
    {
    case 0: // Entry onto screen, create first orb
        { 
        if move_timer == 60
            {
            orb1 = instance_create_layer(x,y,layer,obj_orb);
            orb1.hspeed = 2;
            made = 1;
            phase = 1; 
            }
        break;
        }
    case 1: // ##ATTACK PHASE 1##
        { 
        if instance_exists(orb1)
            {
            if orb1.timer >= 30 then orb1.phase = 1; // execute attack once spinning
            if orb1.count2 >= 4
                {
                orb1.phase = 0;
                phase = 2; // go to next phase
                }
            }
        else phase = 4; // if orb is destroyed fast, skip to fourth phase
        break;
        }
    case 2: // ##ATTACK PHASE 2##
        { 
        atk_timer += 1;
        if atk_timer == 60
            {
            scr_circleattack(36,x,y,0,obj_bullet2,obj_hitbox,6,false);
            scr_playsnd(snd_en_shot2,1);
            atk_timer = 30;
            count += 1;
            }
        if count == 10
            {
            atk_timer = 0;
            count = 0;
            if made < 2 then phase = 3 else phase = 4;
            }
        break;
        }
    case 3: // create second orb
        {
        orb2 = instance_create_layer(x,y,layer,obj_orb2); 
        orb2.hspeed = -2;
        made = 2;
        phase = 4;
        break;
        }
    case 4: // ##ATTACK PHASE 3##
        {
        if instance_exists(orb1) && instance_exists(orb2)
            {
            orb1.phase = 2;
            orb2.phase = 1;
            if orb1.count == 20 && orb2.count == 4
                {
                orb1.phase = 0;
                orb2.phase = 0;
                phase = 1;
                }
            }
        else
            {
            if instance_exists(orb1) then orb1.phase = 3;
            if instance_exists(orb2) then orb2.phase = 2;
            phase = 5;
            }
        break;
        }
    case 5: // ##ATTACK PHASE 4##
        {
        if !instance_exists(orb1) && !instance_exists(orb2) then phase = 6;
        break;
        }
    case 6: // ##FINAL ATTACK PHASE##
        { 
        global.omake_enabled = true;
        atk2_timer -= 1;
        if atk2_timer == 0
            {
            scr_circleattack(90,x,y,0,obj_bullet_shoot,obj_hitbox,10,false);
            with obj_bullet_shoot
                {
                btype = 2;
                friction = 0.4;
                }
            scr_playsnd(snd_exp1,1);
            atk2_timer = 180;
            }  
        break;
        }
    case 7: // TIMEOUT
        {
        y -= 1;
        if instance_exists(orb1)
            {
            orb1.phase = 4; 
            orb1.y -= 1;
            }
        if instance_exists(orb2)
            {
            orb2.phase = 3;
            orb2.y -= 1;
            }
        direction = 90;
        if y < yview-sprite_width/2 then instance_destroy();
        break;
        }
    }

/* */
/*  */
