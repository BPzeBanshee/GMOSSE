// Scrolling text (string_copy is what does the scrolling)
chr1 += 1;
text = string_copy(ship_info[6],1,chr1);

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
    
// Alternate Sprite Kludges (Xono/Arxyne)
if selection == 1
    {
    if global.jup && global.xonospr < 3 && !hook
        {
        global.xonospr += 1;
		scr_snd_play(snd_click,true);
        scr_getshipinfo(selection);
        }
    if global.jdown && global.xonospr > 1 && !hook
        {
        global.xonospr -= 1;
		scr_snd_play(snd_click,true);
        scr_getshipinfo(selection);
        }
    }
if selection == 5
    {
    if global.jup && global.arxynespr == 2 && !hook
        {
        global.arxynespr = 1;
		scr_snd_play(snd_click,true);
        scr_getshipinfo(selection);
        }
    if global.jdown && global.arxynespr == 1 && !hook
        {
        global.arxynespr = 2;
		scr_snd_play(snd_click,true);
        scr_getshipinfo(selection);
        }
    }

// Start the actual damn game if you hit button 1
if global.button1 && !hook
    {
	scr_snd_play(snd_click,true);
	global.shipselect = selection;
    if global.shipselect == 3
        {
        instance_create_layer(x,y,layer,obj_shipselect_bh); 
        instance_destroy();
        }
    else 
        {
        scr_trans(global.startstage,3,c_black,0.025,0.05,210);
        with obj_ctrl_music fade_out(0.0055);
        }
    }
if global.button2 && !hook
	{
	scr_snd_play(snd_click,true);
	scr_trans(rm_menu,2,c_white,0.025,0.05,0);
	with obj_ctrl_music fade_out(0.05);
	}

// hook handling (so you don't select anything twice)
if (global.button1) 
|| (global.button2)
|| (global.jleft) 
|| (global.jright)
|| (global.jup)
|| (global.jdown) then hook = true;

if !(global.button1) 
&& !(global.button2)
&& !(global.jleft) 
&& !(global.jright)
&& !(global.jup)
&& !(global.jdown)
&& !instance_exists(obj_trans) then hook = false;