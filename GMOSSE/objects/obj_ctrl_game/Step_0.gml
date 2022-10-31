// obj_ctrl_life
if respawntimer > 0
    {
    respawntimer -= 1;
    with obj_bullettarget 
        {
        var c = instance_create_layer(x,y,layer,obj_bulletcancel);
        c.direction = direction;
        c.speed = speed;
        instance_destroy();
        }
    }
if respawntimer == 0 
    {
    if lives > 0 then event_user(0) else
        {
        if instance_exists(obj_ctrl_music) then with obj_ctrl_music event_user(5);
        if !instance_exists(obj_ctrl_continue) then instance_create_layer(x,y,layer,obj_ctrl_continue);
        }
    respawntimer = -1;
    }
if lives == 0 
    {
    with obj_hitbox
        {
        invincibility = -1;
        visible = 0;
        }
    respawntimer += 0.5;
    }
    
// obj_ctrl_score
// Chain timer handling
if global.countdown > 0 then global.countdown -= 1;
if global.countdown > 180 then global.countdown = 180;
if global.countdown == 0 then global.chain = 0;

// Extends    
if global.myscore >= (3000000 * global.extend_number)
    {
    scr_playsnd(snd_1up,1);
    lives += 1;
    global.extend_number += 1;
    var a = instance_create_layer(x,y,global.lay_player,obj_popup);
    a.msg = "EXTEND";
    }
   
// Extend overflow (if you get more than 3 lives)
// You can just comment this out if you're not fussed about capacity 
if lives > 3
    {
    global.myscore += 500000;
    lives = 3;
    var a = instance_create_layer(x,y,global.lay_player,obj_popup);
    a.msg = "\n\nOVERFLOW BONUS\n+500000";
    }

