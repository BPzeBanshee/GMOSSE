// Compulsory
event_inherited();
if !instance_exists(myhitbox) exit;

// Timers
if shot_timer > 0 shot_timer -= 1;
if shot2_timer > 0 shot2_timer -= 1;
if bomb_timer > 0 bomb_timer -= 1;
if time_passed < 180 time_passed += 1;

if b1
    {
	// Main Shot
	if shot_timer == 0
		{
	    scr_snd_play(snd_war_shot1,true);
	    scr_player_shot(x-4,y,obj_warbird_shot,20,90);
	    scr_player_shot(x+4,y,obj_warbird_shot,20,90);
	    scr_player_shot(x-10,y,obj_warbird_shot,20,96);
	    scr_player_shot(x+10,y,obj_warbird_shot,20,84);
	    shot_timer = 5;
		}
		
	// Secondary Shot (lasers)
	if shot2_timer == 0 && instance_number(obj_warbird_laser) < limit
        {
        scr_snd_play(snd_war_shot2,true);
        scr_player_shot(x-10,y+4,obj_warbird_laser,9,91);
        scr_player_shot(x+10,y+4,obj_warbird_laser,9,89);
        shot2_timer = 8;
        }
    }
    
// Bomb Deployment
if b2 && bomb_timer == 0 && bombs > 0
    {
    bombs -= 1;
    bomb_timer = 320;
    instance_create_layer(x,y,layer,obj_warbird_bomb);
    scr_snd_play(snd_war_bomb);
    }