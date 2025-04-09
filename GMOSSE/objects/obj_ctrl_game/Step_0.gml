// Player life handling
if respawntimer > 0
    {
	// ternary operator: if mylives is zero, increment half, else one per frame
	var increment = mylives == 0 ? 0.5 : 1;
    respawntimer -= increment;
    with obj_bullet_parent 
        {
        scr_basicshot(x,y,layer,obj_bulletcancel,speed,direction);
        instance_destroy();
        }
    }
if respawntimer == 0 
    {
    if mylives == 0
		{
		global.player_data.myscore = myscore;
	    if !instance_exists(obj_ctrl_continue) 
		instance_create_layer(x,y,layer,obj_ctrl_continue);
		}
	else event_user(0);
    respawntimer = -1;
    }
if mylives == 0 
    {
	countdown = 0;
	chain = 0;
    }
    
// Player score handling
// Chain timer handling
if countdown > 0 countdown -= 1;
if countdown > 180 countdown = 180;
if countdown == 0 chain = 0;

// Extends    
if myscore >= (3000000 * (global.player_data.extends+1))
    {
    scr_snd_play(snd_1up);
    mylives += 1;
    global.player_data.extends += 1;
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