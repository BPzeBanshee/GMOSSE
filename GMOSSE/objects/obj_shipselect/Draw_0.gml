// Grey box
draw_sprite_stretched_ext(spr_greypixel,0,0,140,240,160,c_white,0.25);

// Ship name
scr_draw_vars(global.fnt_shipselect,fa_center,8454016);
draw_set_alpha(0.5);
draw_text(xview+120,yview+110,ship_info[2]);
draw_set_alpha(1);

// Ship portrait
if global.shipselect == 3 then // White border for Busterhawk
draw_sprite_ext(spr_bh_out,image_index/3,xview+120,yview+64,1.075,1.075,0,c_white,1);
if ship_info[0] > -1 then draw_sprite(ship_info[0],ship_info[1],xview+120,yview+64);

// Statistical bullshit info    
scr_draw_vars(global.fnt_default,fa_left,make_color_rgb(100,100,255));
draw_text(xview+1,yview+140,ship_info[3]);
draw_text(xview+1,yview+151,ship_info[4]);
draw_text(xview+1,yview+162,ship_info[5]);
draw_text(xview+1,yview+173,"Bombs: "+string(global.init_bombs)+"/"+string(global.max_bombs));

// Description text
draw_set_color(c_silver);
if text != "" then draw_text(xview+1,yview+184,text);
 
// Pointers   
if global.shipselect > 1 then draw_sprite_ext(spr_shipselect,-1,xview+16,yview+120,-1,1,0,c_white,1);
if global.shipselect < max_ships then draw_sprite_ext(spr_shipselect,-1,xview+224,yview+120,1,1,0,c_white,1);

