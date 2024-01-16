/* AESTHETICS */
//instance_create_layer((room_width/2),(room_height/2),layer,obj_star);

// Test code for warp background
/*if keyboard_check_pressed(vk_space)
    {
    if obj_bkg_menu.visible = true
        {
        obj_bkg_menu.visible = false;
        obj_star.image_alpha = 1;
        }
    else 
        {
        obj_bkg_menu.visible = true;
        obj_star.image_alpha = 0.25;
        }
    }*/
	
var fx = layer_get_fx("lay_effect_parallax");
var a = fx_get_parameter(fx,"g_ParallaxPosition");
a[0] += 0.01; 
fx_set_parameter(fx,"g_ParallaxPosition",a);
with obj_star visible = false;
with obj_warp visible = false;

/* INPUT BEHAVIOUR */
if !enabled then exit;

// Reset hook
if !global.jup 
&& !global.jdown
&& !global.jleft
&& !global.jright
&& !global.button1
&& !keyboard_check(vk_f12)
&& enabled
then hook = 0;

// Up
if (global.jup && !hook && enabled)
    {
    hook = 1;
    scr_snd_play(snd_click,true);
    selection -= 1;
    if selection < 1 then selection = 5;
    }
    
// Down
if (global.jdown && !hook && enabled)
    {
    hook = 1;
    scr_snd_play(snd_click,true);
    selection += 1; 
    if selection > 5 then selection = 1; 
    }
    
// Left
if (global.jleft && !hook && enabled)
    {
    hook = 1;
    if selection == 1
        {
        scr_snd_play(snd_click,true);
        if selection2 > 1 then selection2 -= 1;
        }
    }
    
// Right
if (global.jright && !hook && enabled)
    {
    hook = 1;
    if selection == 1
        {
        scr_snd_play(snd_click,true);
        if selection2 < 3 then selection2 += 1;
        }
    }

// F12 (for viewing background only)        
if (keyboard_check(vk_f12) && !hook)
    {
    hook = 1;
    visible = !visible;
    with obj_title visible = !visible;
    }
    
// Button 1
if (global.button1 && !global.levelend && !hook && enabled)
    {
    hook = 1;
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