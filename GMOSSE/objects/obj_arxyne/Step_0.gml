event_inherited();

// TIMERS
if shot1_timer > 0 then shot1_timer -= 1;
if shot2_timer > 0 then shot2_timer -= 1;
if shot3_timer > 0 then shot3_timer -= 1;
if bomb_timer > 0 then bomb_timer -= 1;

// BUTTON 1 - MAIN SHOT
if (global.button1)
    {
    // MAIN SHOT
    if shot1_timer == 0
        {
        scr_snd_play(snd_arx_shot1,true);
        scr_basicshot(x+6,y,layer,obj_arxyne_shot,15,85);
        scr_basicshot(x-6,y,layer,obj_arxyne_shot,15,95);
        scr_basicshot(x+6,y+4,layer,obj_arxyne_shot,15,65);
        scr_basicshot(x-6,y+4,layer,obj_arxyne_shot,15,115);
        shot1_timer = 5;
        }
        
    // CENTER SHOT
    if shot2_timer == 0
        {
        for (var i=y; i>yview-16; i-=32) instance_create_layer(x,i,layer,obj_arxyne_bolt);
        shot2_timer = 32;
        }
        
    // HOMING LASERS
    if shot3_timer == 0 && instance_number(obj_arxyne_shot2a) < 3
        {
        scr_snd_play(snd_arx_shot2,true);
        scr_basicshot(x,y+12,layer,obj_arxyne_shot2a,5,230);
        scr_basicshot(x,y+12,layer,obj_arxyne_shot2a,5,310);
        shot3_timer = 45;
        }
    }
    
/* BUTTON 2 - BOMB */
if (global.button2) && bomb_timer == 0 && bombs > 0
    {
    scr_snd_play(snd_exp1);
	for (var i=0; i<360; i+=15) scr_basicshot(x,y,layer,obj_xono_bomb,6,i);
    bomb_timer = 60;
    bombs -= 1;
    }