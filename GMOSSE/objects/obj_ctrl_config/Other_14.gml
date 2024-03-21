/// @description AUDIO OPTIONS MENU

// BEHAVIOUR
category_type = "AUDIO SETTINGS";
selection_max = 5; // amount of positions in the submenu
max_h = 0;

warning = "";
if selection == 4
	{
	max_h = 45;
	warning = "FOR SAFETY REASONS,\nCHANGING MUSIC CONFIG\nMID-GAME IS DISABLED.";
	}

// LEFT
if global.jleft && !hook
    {
    hook = true;
    switch selection
        {
        case 1: if global.music_volume > 0 then global.music_volume -= 10; break;
        case 2: if global.sfx_volume > 0 then global.sfx_volume -= 10; scr_snd_play(snd_click,true); break;
        case 3: if global.voice_volume > 0 then global.voice_volume -= 10; break;
        }
    with obj_ctrl_music set_volume();
    }
    
// RIGHT
if global.jright && !hook
    {
    hook = true;
    switch selection
        {
        case 1: if global.music_volume < 100 then global.music_volume += 10; break;
        case 2: if global.sfx_volume < 100 then global.sfx_volume += 10; scr_snd_play(snd_click,true); break;
        case 3: if global.voice_volume < 100 then global.voice_volume += 10; break;
        }
    with obj_ctrl_music set_volume();
    }
    
// BUTTON 1
if global.button1 && !hook 
    {
    hook = true;
    scr_snd_play(snd_click,true);
    switch selection
        {
        case 4:
            {
			if room != rm_menu then exit;
			
            // Hack to allow time to respond to window change
            if global.fullscreen then scr_fullscreen(0);
            alarm[0] = 10;
            break;
            }
        case 5:
            {
            selection = selection_previous; 
            category = 0;
            break;
            }
        }
    }

