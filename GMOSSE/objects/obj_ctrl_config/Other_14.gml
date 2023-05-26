/// @description  VOLUME OPTIONS MENU

// BEHAVIOUR
category_type = "AUDIO SETTINGS";
selection_max = 5; // amount of positions in the submenu
max_h = 0;

// LEFT
if global.jleft && !hook
    {
    hook = 1;
    switch selection
        {
        case 1: if global.music_volume > 0 then global.music_volume -= 10; break;
        case 2: if global.sfx_volume > 0 then global.sfx_volume -= 10; break;
        case 3: if global.voice_volume > 0 then global.voice_volume -= 10; break;
        }
    with obj_ctrl_music 
		{
		scr_setvolmusic(music);
	    scr_setvolsnd();    
		}
    }
    
// RIGHT
if global.jright && !hook
    {
    hook = 1;
    switch selection
        {
        case 1: if global.music_volume < 100 then global.music_volume += 10; break;
        case 2: if global.sfx_volume < 100 then global.sfx_volume += 10; break;
        case 3: if global.voice_volume < 100 then global.voice_volume += 10; break;
        }
    with obj_ctrl_music 
		{
		scr_setvolmusic(music);
	    scr_setvolsnd();
		}
    }
    
// BUTTON 1
if global.button1 && !hook 
    {
    hook = 1;
    scr_playsnd(snd_click,1);
    switch selection
        {
        case 4:
            {
            // Hack to allow time to respond to window change
            if global.fullscreen then scr_fullscreen(0);
            alarm[0]=10;
            break;
            }
        case 5:
            {
            selection = 1; 
            category = 0;
            break;
            }
        }
    }

