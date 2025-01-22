event_inherited();
if !instance_exists(myhitbox) exit;

// TIMERS
if shot1_timer > 0 shot1_timer -= 1;
if shot2_timer > 0 shot2_timer -= 1;
if shot3_timer > 0 shot3_timer -= 1;
if bomb_timer > 0 bomb_timer -= 1;

// BUTTON 1 - MAIN SHOT
if (b1)
    {
    // MAIN SHOT
    if shot1_timer == 0
        {
        scr_snd_play(snd_arx_shot1,true);
        scr_player_shot(x+6,y,obj_arxyne_shot,15,85);
        scr_player_shot(x-6,y,obj_arxyne_shot,15,95);
        scr_player_shot(x+6,y+4,obj_arxyne_shot,15,65);
        scr_player_shot(x-6,y+4,obj_arxyne_shot,15,115);
        shot1_timer = 5;
        }
        
    // CENTER SHOT
    if shot2_timer == 0
        {
        for (var i=y; i>yview-16; i-=32) scr_player_shot(x,i,obj_arxyne_bolt,0,0,0);
        shot2_timer = 32;
        }
        
    // HOMING LASERS
    if shot3_timer == 0 && instance_number(obj_arxyne_shot2a) < 3
        {
        scr_snd_play(snd_arx_shot2,true);
		scr_player_shot(x,y+12,obj_arxyne_shot2a,5,230);
        scr_player_shot(x,y+12,obj_arxyne_shot2a,5,310);
        shot3_timer = 45;
        }
    }
    
// BUTTON 2 - BOMB
if (b2) && bomb_timer == 0 && bombs > 0
    {
    scr_snd_play(snd_exp1);
	for (var i=0; i<360; i+=15) scr_player_shot(x,y,obj_xono_bomb,6,i,false);
    bomb_timer = 60;
    bombs -= 1;
    }