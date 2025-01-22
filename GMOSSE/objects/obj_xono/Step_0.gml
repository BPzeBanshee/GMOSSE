// COMPUSLORY EVENT
event_inherited();
if !instance_exists(myhitbox) exit;

// TIMERS
if lsr_timer > 0 lsr_timer -= 1;
if bomb_timer > 0 bomb_timer -= 1;

// BUTTON 1 - SHOT/MISSILE
if (b1) 
    {
    // shot
    scr_snd_play(snd_xono_shot); 
    var shot = scr_player_shot(x,y,obj_xono_shot,20,90+shot_angle);
    shot.image_index = shot_anim;
    
    // anim frame for shot (aesthetics)
    shot_anim += 0.5;
    if shot_anim > 4 shot_anim = 0;
    
    // angle for shot
    if shot_angle_add == 1 shot_angle += 1 else shot_angle -= 1;
    if shot_angle > 5 || shot_angle < -5
        {
        shot_angle = 0; 
        shot_angle_add += 1;
        if shot_angle_add > 1 shot_angle_add = 0;
        }
        
    // laser
    if lsr_timer == 0 && instance_number(obj_xono_laser) < (4 * instance_number(obj_player))
        {
        scr_player_shot(x,y,obj_xono_laser,8,45);
        scr_player_shot(x,y,obj_xono_laser,8,135);
        scr_player_shot(x,y,obj_xono_laser,8,225);
        scr_player_shot(x,y,obj_xono_laser,8,315);
        lsr_timer = 30;
        }
    }

// BUTTON 2 - BOMB
if (b2) && bomb_timer == 0 && bombs > 0
    {
    scr_snd_play(snd_exp1);
	for (var i=0;i<360;i+=15) scr_player_shot(x,y,obj_xono_bomb,6,i,false);
    bomb_timer = 60;
    bombs -= 1;
    }