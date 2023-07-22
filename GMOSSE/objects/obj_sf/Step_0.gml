// Compulsory Parent/Child Functions
event_inherited();

// Weapon Timers
if shot_timer > 0 then shot_timer -= 1;
if bomb_timer > 0 then bomb_timer -= 1;

// Button 1 Event
if (global.button1)
    { 
    if shot_timer == 0 && !instance_exists(obj_sf_bomb)
        {
        scr_snd_play(snd_sf_shot,true);
        
		var lshot1,lshot2,rshot1,rshot2;
		instance_create_layer(x,y,layer,obj_sf_shot);
        lshot1 = instance_create_layer(x-2,y,layer,obj_sf_shot);  
        lshot2 = instance_create_layer(x-4,y,layer,obj_sf_shot);
        rshot1 = instance_create_layer(x+2,y,layer,obj_sf_shot);
        rshot2 = instance_create_layer(x+4,y,layer,obj_sf_shot);
        if (global.button3)
            {
            lshot1.direction = 60;
            lshot2.direction = 50;
            rshot1.direction = 120;
            rshot2.direction = 130;
            }
        else
            {
            lshot1.direction = 50;
            lshot2.direction = 30;
            rshot1.direction = 130;
            rshot2.direction = 150;
            }
        shot_timer = 8;
        }
    }
    
// Button 2 Event
if (global.button2)
    {
    if bomb_timer == 0 && global.bombs > 0
        {
        instance_create_layer(x,y-20,layer,obj_sf_bomb);
        global.bombs -= 1;
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