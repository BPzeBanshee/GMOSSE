/// @description  MISC. SETTINGS MENU

// BEHAVIOUR
category_type = "MISC. SETTINGS";
selection_max = 8; // amount of positions in the submenu
max_h = 30;
if timer > 0 then timer -= 1;

// LEFT
if global.jleft[0] && !hook
    {
    hook = true;
    switch selection
        {
        case 1: global.debug = false; break;
        case 2: global.hitbox_visible = false; break;
        case 3: global.fonttype = false; scr_fonts_set(); break;
        case 4: if global.bulletcolour > 1 then global.bulletcolour -= 1;  break;
        case 5: global.flicker = false; break;
        }
    }
    
// RIGHT
if global.jright[0] && !hook
    {
    hook = true;
    switch selection
        {
        case 1: global.debug = true; break;
        case 2: global.hitbox_visible = true; break;
        case 3: global.fonttype = true; scr_fonts_set(); break;
        case 4: if global.bulletcolour < 3 then global.bulletcolour += 1;  break;
        case 5: global.flicker = true; break;
        }
    }
    
// BUTTON 1
if global.button1[0] && !hook 
    {
    hook = true;
    scr_snd_play(snd_click,true);
    switch selection
        {
        case 6:
            {
            timer = 90;
            scr_hiscore_reset();
            scr_hiscore_save("score.gmes");
			reset_msg = "HIGH SCORES RESET!";
            break;
            }
		case 7:
			{
			timer = 90;
			scr_config_reset("config.ini");
			reset_msg = "CONFIG RESET!";
			break;
			}
        case 8:
            {
            timer = 0;
            selection = selection_previous; 
            category = 0;
            break;
            }
        }
    }

