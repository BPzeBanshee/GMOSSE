// Scrolling text (string_copy is what does the scrolling)
chr1 += 1;
text = string_copy(ship_info[4],1,chr1);

// Do not pass here if ship skin menu is active
if disabled then exit;

// Left/right keys scroll through ship selection screen
if global.jleft && (selection > 1) && !hook
    {
    chr1 = 0;
    selection -= 1;
	scr_snd_play(snd_click,true);
    scr_getshipinfo(selection);
    }
if global.jright && (selection < max_ships) && !hook
    {
    chr1 = 0;
    selection += 1;
	scr_snd_play(snd_click,true);
    scr_getshipinfo(selection);
    }
    
// Start the actual damn game if you hit button 1
if global.button1 && !hook
    {
	scr_snd_play(snd_click,true);
	global.player_data[global.myside].shipselect = selection;
    if selection == 3
        {
        instance_create_layer(x,y,layer,obj_shipselect_bh); 
        instance_destroy();
        }
    else 
        {
        scr_trans(global.startstage,3,c_black,0.025,0.05,210);
        with obj_ctrl_music fade_out(3000);
        }
    }
if global.button2 && !hook
	{
	scr_snd_play(snd_click,true);
	scr_trans(rm_menu,2,c_white,0.025,0.05,0);
	with obj_ctrl_music fade_out(2000);
	}
if global.button3 && !hook
	{
	// Alternate Sprite Kludges (Xono/Arxyne)
	if selection == 1 or selection == 5
		{
		instance_create_depth(x,y,depth-1,obj_ctrl_shipskin);
		disabled = true;
		}
	}

// hook handling (so you don't select anything twice)
if (global.button1) 
|| (global.button2)
|| (global.button3)
|| (global.jleft) 
|| (global.jright)
|| (global.jup)
|| (global.jdown) then hook = true;

if !(global.button1) 
&& !(global.button2)
&& !(global.button3)
&& !(global.jleft) 
&& !(global.jright)
&& !(global.jup)
&& !(global.jdown)
&& !instance_exists(obj_trans) then hook = false;