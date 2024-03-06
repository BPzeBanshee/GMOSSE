///@desc INPUT BEHAVIOUR
if !enabled then exit;

// Up
if (global.jup && !hook)
    {
    hook = true;
    scr_snd_play(snd_click,true);
    selection -= 1;
    if selection < 1 then selection = 5;
    }
    
// Down
if (global.jdown && !hook)
    {
    hook = true;
    scr_snd_play(snd_click,true);
    selection += 1; 
    if selection > 5 then selection = 1; 
    }
    
// Left
if (global.jleft && !hook)
    {
    hook = true;
    if selection == 1
        {
        scr_snd_play(snd_click,true);
        if selection2 > 1 then selection2 -= 1;
        }
    }
    
// Right
if (global.jright && !hook)
    {
    hook = true;
    if selection == 1
        {
        scr_snd_play(snd_click,true);
        if selection2 < 3 then selection2 += 1;
        }
    }

// F12 (for viewing background only)        
if (keyboard_check(vk_f12) && !hook)
    {
    hook = true;
    visible = !visible;
    with obj_title visible = !visible;
    }
    
// Button 1
if (global.button1 && !global.levelend && !hook)
    {
    hook = true;
    scr_snd_play(snd_click,true);
    switch selection
        {
        case 0: break;
        case 1: // starting the damn game! :D
            {
            // Stage select
            switch selection2
                {
                case 1: global.startstage = rm_stage1; break;
                case 2: global.startstage = rm_boss1; break;
                //case 3: global.startstage = rm_omake1; break;
                case 3: global.startstage = rm_tutorial; break;
                }
            // transition handling
            scr_trans(rm_shipselect,2,c_black,0.025,0.05,0);
            break;
            }
        case 2: // Go To Options
            {
            instance_create_layer(x,y,layer,obj_ctrl_config);
            enabled = false;
            break;
            }
        case 3: // Show Credits
            {
            instance_create_layer(x,y,layer,obj_about);
            enabled = false;
            break;
            }
        case 4: // Go To High Scores
            {
            scr_trans(rm_scores,2,c_white,0.025,0.05,0);
            break;
            }
        case 5: // Exit Game
            {
            game_end();
            break;
            }
        }
    }
	
// Reset hook
if !global.jup 
&& !global.jdown
&& !global.jleft
&& !global.jright
&& !global.button1
&& !keyboard_check(vk_f12)
&& enabled
then hook = false;