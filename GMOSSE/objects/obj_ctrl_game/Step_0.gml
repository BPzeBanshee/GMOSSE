// Player life handling
if respawntimer > 0
    {
    respawntimer -= 1;
    with obj_bullettarget 
        {
        scr_basicshot(x,y,layer,obj_bulletcancel,speed,direction);
        instance_destroy();
        }
    }
if respawntimer == 0 
    {
    if mylives > 0 then event_user(0) else
        {
        if !instance_exists(obj_ctrl_continue) 
		then instance_create_layer(x,y,layer,obj_ctrl_continue);
        }
    respawntimer = -1;
    }
if mylives == 0 
    {
    with obj_hitbox
        {
        invincible = -1;
        visible = false;
        }
    respawntimer += 0.5;
    }
    
// Player score handling
// Chain timer handling
if countdown > 0 then countdown -= 1;
if countdown > 180 then countdown = 180;
if countdown == 0 then chain = 0;

// Extends    
if myscore >= (3000000 * global.extend_number)
    {
    scr_snd_play(snd_1up);
    mylives += 1;
    global.extend_number += 1;
    var a = instance_create_layer(x,y,global.lay_player,obj_popup);
    a.msg = "EXTEND";
    }
   
// Extend overflow (if you get more than 3 lives)
// You can just comment this out if you're not fussed about capacity 
if mylives > 3
    {
    myscore += 500000;
    mylives = 3;
    var a = instance_create_layer(x,y,global.lay_player,obj_popup);
    a.msg = "\n\nOVERFLOW BONUS\n+500000";
    }

