// Compulsory Parent/Child Functions
event_inherited();
if !instance_exists(myhitbox) exit;

// Weapon Timers
if shot_timer > 0 shot_timer -= 1;
if bomb_timer > 0 bomb_timer -= 1;

// Button 1 Event
if (b1)
    { 
    if shot_timer == 0 && !instance_exists(obj_trident_bomb)
        {
        scr_snd_play(snd_sf_shot,true);
        var shot[];
		shot[0] = scr_player_shot(x,y,obj_trident_shot,10,90);
        shot[1] = scr_player_shot(x-2,y,obj_trident_shot,10,50); 
        shot[2] = scr_player_shot(x-4,y,obj_trident_shot,10,30);
        shot[3] = scr_player_shot(x+2,y,obj_trident_shot,10,130);
        shot[4] = scr_player_shot(x+4,y,obj_trident_shot,10,150);
        if (b3)
            {
            shot[1].direction = 60;
            shot[2].direction = 50;
            shot[3].direction = 120;
            shot[4].direction = 130;
            }
        shot_timer = 8;
        }
    }
    
// Button 2 Event
if (b2)
    {
    if bomb_timer == 0 && bombs > 0
        {
        scr_player_shot(x,y-20,obj_trident_bomb,0,0,false);
        bombs -= 1;
        bomb_timer = 240;
        }
    }
	
// Image Aesthetics  
image_index = round(img);
if (left && img > 0) img -= img_bank_spd;
if (right && img < 4) img += img_bank_spd;
if (!left && !right)
    {
    if img > 2 img -= img_bank_spd;
    if img < 2 img += img_bank_spd;
    }