// Compulsory Parent/Child Functions
event_inherited();
if !instance_exists(obj_hitbox) then exit;

// Weapon Timers
if shot_timer > 0 then shot_timer -= 1;
if bomb_timer > 0 then bomb_timer -= 1;

// Button 1 Event
if (global.button1)
    { 
    if shot_timer == 0 && !instance_exists(obj_trident_bomb)
        {
        scr_snd_play(snd_sf_shot,true);
        var shot[];
		shot[0] = instance_create_layer(x,y,layer,obj_trident_shot);
        shot[1] = instance_create_layer(x-2,y,layer,obj_trident_shot);  
        shot[2] = instance_create_layer(x-4,y,layer,obj_trident_shot);
        shot[3] = instance_create_layer(x+2,y,layer,obj_trident_shot);
        shot[4] = instance_create_layer(x+4,y,layer,obj_trident_shot);
        if (global.button3)
            {
            shot[1].direction = 60;
            shot[2].direction = 50;
            shot[3].direction = 120;
            shot[4].direction = 130;
            }
        else
            {
            shot[1].direction = 50;
            shot[2].direction = 30;
            shot[3].direction = 130;
            shot[4].direction = 150;
            }
		for (var i=0; i<5; i++) shot[i].myctrl = myctrl;
        shot_timer = 8;
        }
    }
    
// Button 2 Event
if (global.button2)
    {
    if bomb_timer == 0 && bombs > 0
        {
        var mybomb = instance_create_layer(x,y-20,global.lay_player_weapons,obj_trident_bomb);
		mybomb.parent_id = id;
		mybomb.myctrl = myctrl;
        bombs -= 1;
        bomb_timer = 240;
        }
    }
	
// Image Aesthetics  
image_index = round(img);
if (global.jleft && img > 0) then img -= img_bank_spd;
if (global.jright && img < 4) then img += img_bank_spd;
if (!global.jleft && !global.jright)
    {
    if img > 2 then img -= img_bank_spd;
    if img < 2 then img += img_bank_spd;
    }