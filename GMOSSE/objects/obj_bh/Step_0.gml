/* COMPUSLORY EVENT */
event_inherited();
    
// image aesthetics
image_timer += 1;
if image_timer >= 5
    {
    var thrust = scr_basicshot(x,y+10,layer,obj_bh_thrust,4,270+random_range(-10,10));
    thrust.image_xscale = thrust_scale*2;
    thrust.image_yscale = thrust_scale*2;
    image_timer = 0;
    }

// shoot code
// button 1
if global.button1
    {
    if can_shoot // Main shot
        {
        scr_snd_play(snd_bh_mainshot);
        var shot = scr_basicshot(x,y,global.lay_player_weapons,obj_bh_mainshot,20,90+shot_angle);
        shot.image_blend = blend;

        if shot_angle_add == 1 then shot_angle += 1 else shot_angle -= 1;
        if shot_angle > 3 || shot_angle < -3
            {
            shot_angle = 0;
            shot_angle_add = !shot_angle_add; // binary invert
            }
        can_shoot = false;
        alarm[0] = 4;
        }
    if can_shoot2 // Side orb shot
        {
		// Invoke the options method fire_weapon()
		with option1 fire_weapon();
		with option2 fire_weapon();
        switch weapon
            {
            case 1: alarm[1] = 5; break;
            case 2: alarm[1] = 5; break;
            case 3: alarm[1] = 6; break;
            case 4: alarm[1] = 30; break;
            case 5: alarm[1] = 5; break;
            case 6: alarm[1] = 3; break;
            case 7: alarm[1] = 20; break;
            }
        can_shoot2 = false;
        }
    }

//button 3 (speed gear setting)
if (global.button3 && can_speed) 
    {
    can_speed = false;
    if speed_up then speed_gear += 1 else speed_gear -= 1;
    switch speed_gear
        {
        case 1: shipspeed = 1; thrust_scale = 0.25; speed_up = true; break;
        case 2: shipspeed = 3; thrust_scale = 0.5; break;
        case 3: shipspeed = 5; thrust_scale = 0.75; break;
        case 4: shipspeed = 7; thrust_scale = 1; speed_up = false; break;
        }
    slowshipspeed = shipspeed;
    }
if (!global.button3) then can_speed = true;