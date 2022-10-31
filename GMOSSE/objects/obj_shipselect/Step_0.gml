// Scrolling text (string_copy is what does the scrolling)
chr1 += 1;
text = string_copy(ship_info[6],1,chr1);

// Left/right keys scroll through ship selection screen
if global.jleft && (global.shipselect > 1) && !hook
    {
    chr1 = 0;
    global.shipselect -= 1;
    scr_getshipinfo(global.shipselect);
    }
if global.jright && (global.shipselect < max_ships) && !hook
    {
    chr1 = 0;
    global.shipselect += 1;
    scr_getshipinfo(global.shipselect);
    }
    
// Hack for Arxyne
if global.shipselect == 1
    {
    if global.jup && global.xonospr < 3 && !hook
        {
        global.xonospr += 1;
        scr_getshipinfo(global.shipselect);
        }
    if global.jdown && global.xonospr > 1 && !hook
        {
        global.xonospr -= 1;
        scr_getshipinfo(global.shipselect);
        }
    }
if global.shipselect == 5
    {
    if global.jup && global.arxynespr == 2 && !hook
        {
        global.arxynespr = 1;
        scr_getshipinfo(global.shipselect);
        }
    if global.jdown && global.arxynespr == 1 && !hook
        {
        global.arxynespr = 2;
        scr_getshipinfo(global.shipselect);
        }
    }

// Start the actual damn game if you hit button 1
if global.button1 && !hook
    {
    if global.shipselect == 3
        {
        instance_create_layer(x,y,layer,obj_shipselect_bh); 
        instance_destroy();
        }
    else 
        {
        scr_trans(global.startstage,3,c_black,0.025,0.05,210);
        scr_fademusic(0.0055);
        }
    }

// hook handling (so you don't select anything twice)
if (global.button1) 
|| (global.jleft) 
|| (global.jright)
|| (global.jup)
|| (global.jdown) then hook = 1;

if !(global.button1) 
&& !(global.jleft) 
&& !(global.jright)
&& !(global.jup)
&& !(global.jdown)
&& !instance_exists(obj_trans) then hook = 0;