// Scrolling text (string_copy is what does the scrolling)
chr1 += 1;
text = string_copy(ship_info[4],1,chr1);

// Do not pass here if ship skin menu is active
if disabled then exit;

// GET INPUTS
var left = global.jleft[0];
var right = global.jright[0];
var button1 = global.button1[0];
var button2 = global.button2[0];
var button3 = global.button3[0];

// Left/right keys scroll through ship selection screen
if left && (selection > 1) && !hook
    {
    chr1 = 0;
    selection -= 1;
	scr_snd_play(snd_click,true);
    scr_getshipinfo(selection);
    }
if right && (selection < max_ships) && !hook
    {
    chr1 = 0;
    selection += 1;
	scr_snd_play(snd_click,true);
    scr_getshipinfo(selection);
    }
    
// Start the actual damn game if you hit button 1
if button1 && !hook
    {
	scr_snd_play(snd_click,true);
	global.player_data[0].shipselect = selection;
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
if button2 && !hook
	{
	scr_snd_play(snd_click,true);
	scr_trans(rm_menu,2,c_white,0.025,0.05,0);
	with obj_ctrl_music fade_out(2000);
	}
if button3 && !hook
	{
	// Alternate Sprite Kludges (Xono/Arxyne)
	if selection == 1 or selection == 5
		{
		instance_create_depth(x,y,depth-1,obj_ctrl_shipskin);
		disabled = true;
		}
	}

// hook handling (so you don't select anything twice)
if (button1) 
|| (button2)
|| (button3)
|| (left) 
|| (right) then hook = true;

if !(button1) 
&& !(button2)
&& !(button3)
&& !(left) 
&& !(right)
&& !instance_exists(obj_trans) then hook = false;