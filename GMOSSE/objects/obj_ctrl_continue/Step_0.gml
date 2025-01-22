// AESTHETICS
if !has_chosen && alpha < 1
    {
    alpha += 0.05;
    exit;
    }
if has_chosen && alpha > 0
    {
    alpha -= 0.05;
    exit;
    }
    
limiter += 1;
if limiter > 5
    {
	// Feather disable once GM2016
    var top = instance_create_depth(random_range(xview,xview+240),yview,depth-1,obj_star);
	top.init(3);
    top.side = 1;
    var left = instance_create_depth(xview,random_range(yview,yview+320),depth-1,obj_star);
	left.init(3);
    left.side = 2;
    var bottom = instance_create_depth(random_range(xview,xview+240),random_range(yview+320,yview+325),depth-1,obj_star);
    bottom.init(3);
	bottom.side = 3;
    var right = instance_create_depth(random_range(xview+240,xview+245),random_range(yview,yview+320),depth-1,obj_star);
    right.init(3);
	right.side = 4;
    limiter = 0;
    }
    
// Get inputs
var up = global.jup;
var down = global.jdown;
var b1 = global.button1;

// BEHAVIOUR
// Scrolling up
if up && !hook
    {
    if selection > 1 selection -= 1;
    scr_snd_play(snd_click,true);
    hook = true;
    } 
    
// Scrolling down 
if down && !hook
    {
    if selection < 2 selection += 1;
    scr_snd_play(snd_click,true);
    hook = true;
    }
    
// Selecting an option
if b1 && !hook
    {
    has_chosen = true;
    hook = true;
    }
    
// Actions based on chosen option
if has_chosen && alpha <= 0
    {
    // Unpause and restore everything to look normal
    scr_unpause();
    visible = false; // don't capture continue screen if Game Overing
    
    // make the stars go away/go back to normal
    instance_destroy(obj_star);
    
    // Reboot the music
    with obj_ctrl_music 
		{
		event_user(5);	// call again to switch off
	    resume();		// Unpause whatever was playing before Continue
		}
    global.pausable = true;
    
    // Selection-specific stuff
    switch selection
        {
        case 1:
            { // Continue because you're a shit player :3
			global.player_data.continues += 1;
			with obj_hitbox invincible = 180;
			with obj_ctrl_game
				{
				mylives = 3;
				respawntimer = 1;
				countdown = 0;
				chain = 0;
				if global.player_data.continues < 9 
				myscore = global.player_data.continues
				else myscore = 9;
				}
            break;
            }
        case 2:
            { // Game over
            instance_create_layer(x,y,layer,obj_ctrl_gameover);
            break;
            }
        }
        
    // End of need for object, now die
    instance_destroy();
    }
    
// Hook reset
if !up && !down && !b1 
hook = false;