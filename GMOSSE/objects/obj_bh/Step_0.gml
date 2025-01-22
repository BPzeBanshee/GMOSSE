// COMPUSLORY EVENT
event_inherited();
if !instance_exists(myhitbox) or !made exit;

// shoot code
// button 1
if shot_timer > 0 shot_timer -= 1 else can_shoot = true;
if shot2_timer > 0 shot2_timer -= 1 else can_shoot2 = true;
if b1
    {
    if can_shoot // Main shot
        {
        scr_snd_play(snd_bh_mainshot);
        var shot = scr_player_shot(x,y,obj_bh_mainshot,20,90+shot_angle);
        shot.image_blend = blend;

        if shot_angle_add == 1 shot_angle += 1 else shot_angle -= 1;
        if shot_angle > 3 || shot_angle < -3
            {
            shot_angle = 0;
            shot_angle_add = !shot_angle_add; // binary invert
            }
        shot_timer = 4;
		can_shoot = false;
        }
    if can_shoot2 // Side orb shot
        {
		// Invoke the options method fire_weapon()
		for (var i=0; i<num_options; i++) option[i].fire_weapon();
        switch weapontype
            {
            case 1: shot2_timer = 5; break;
            case 2: shot2_timer = 5; break;
            case 3: shot2_timer = 6; break;
            case 4: shot2_timer = 30; break;
            case 5: shot2_timer = 5; break;
            case 6: shot2_timer = 3; break;
            case 7: shot2_timer = 20; break;
            }
        can_shoot2 = false;
        }
    }
	
// Button 2 (Program setting)
if b2 && can_program
    {
    program = !program;
	for (var i=0; i<num_options; i++) option[i].program = program;
    can_program = false;
    }
if !b2 can_program = true;

// Button 3 (Speed gear setting)
if (b3 && can_speed) 
    {
    can_speed = false;
    if speed_up speed_gear += 1 else speed_gear -= 1;
    switch speed_gear
        {
        case 1: shipspeed = 2; thrust_scale = 0.25; speed_up = true; break;
        case 2: shipspeed = 3; thrust_scale = 0.5; break;
        case 3: shipspeed = 4; thrust_scale = 0.75; break;
        case 4: shipspeed = 5; thrust_scale = 1; speed_up = false; break;
        }
    slowshipspeed = shipspeed;
    }
if (!b3) can_speed = true;

// Image aesthetics
image_timer += 1;
if image_timer >= 5
    {
    var thrust = scr_basicshot(x,y+10,layer,obj_bh_thrust,4,270+random_range(-10,10));
    thrust.image_xscale = thrust_scale*2;
    thrust.image_yscale = thrust_scale*2;
    image_timer = 0;
    }