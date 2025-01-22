/// @description  VIDEO OPTIONS MENU

// BEHAVIOUR
category_type = "VIDEO SETTINGS";//"[VIDEO]";
selection_max = 10; // amount of positions in the submenu
max_h = 0;

warning = "";
if selection == 6
	{
	max_h = 45;
	warning = "NOTE: WINDOW SIZE LIMITED\nTO DESKTOP RESOLUTION";
	}

// LEFT
if global.jleft && !hook
    {
    hook = true;
    switch selection
        {
        case 1: global.fullscreen = false; scr_fullscreen(global.fullscreen); break;
        case 2: global.vsync = false; scr_setdisplay(global.aa,global.vsync); break;
        case 3: if global.aa > 0 global.aa -= 1; scr_setdisplay(global.aa,global.vsync); break;
        case 4: global.rotation -= 90; if global.rotation < 0 global.rotation = 270; break;
        case 5: global.window_aspect -= 1; if global.window_aspect < 0 global.window_aspect = 3; break; 
        case 6: if global.window_size > 0 global.window_size -= 1; break; 
        case 7: global.scaling = false; break;
        case 8: global.use_wallpaper = false; break;
        }
    }
    
// RIGHT
if global.jright && !hook
    {
    hook = true;
    switch selection
        {
        case 1: global.fullscreen = true; scr_fullscreen(global.fullscreen); break;
        case 2: global.vsync = true; scr_setdisplay(global.aa,global.vsync); break;
        case 3: if global.aa < scr_max_aa() global.aa += 1; scr_setdisplay(global.aa,global.vsync); break;
        case 4: global.rotation += 90; if global.rotation > 270 global.rotation = 0; break;
        case 5: global.window_aspect += 1; if global.window_aspect > 3 global.window_aspect = 0; break;
        case 6: 
            {
			var max_size = array_length(obj_ctrl_render.m_array_w[global.window_aspect])-1
			if global.window_size < max_size global.window_size += 1;
            break;
            }
        case 7: global.scaling = true; break;
        case 8: global.use_wallpaper = true; break;
        }
    }
    
// BUTTON 1
if global.button1 && !hook 
    {
    hook = true;
    scr_snd_play(snd_click,true);
    if selection == selection_max - 1 // Filter Options
        {
        max_h = 0;
        selection = 1;
        category = 3;
        }
    if selection == selection_max // Return to Config Menu
        {
        max_h = 0;
        selection = selection_previous; 
        category = 0;
        }
    }

