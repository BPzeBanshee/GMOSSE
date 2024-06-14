// Position anchors
var xx = 0;
var yy = 0;

// Grey box
draw_sprite_stretched_ext(spr_greypixel,0,xx,yy+140,240,160,c_white,0.25);

// Ship name
scr_draw_vars(global.fnt_shipselect,fa_center,8454016);
draw_set_alpha(0.5);
draw_text(xx+120,yy+110,ship_info[0]);
draw_set_alpha(1);

// Ship portrait
if selection == 3 // White border for Busterhawk
draw_sprite_ext(spr_bh_out,image_index/3,xx+120,yy+64,1,1,0,c_white,1);
if ship_spr != -1 draw_sprite(ship_spr,ship_index,xx+120,yy+64);

// Statistical bullshit info    
scr_draw_vars(global.fnt_default,fa_left,make_color_rgb(100,100,255));
draw_text(xx+1,yy+140,"ATK: "+ship_info[1]);
draw_text(xx+1,yy+151,"SPD: "+ship_info[2]);
draw_text(xx+1,yy+162,"COV: "+ship_info[3]);
draw_text(xx+1,yy+173,"BOMBS: "+string(init_bombs)+"/"+string(max_bombs));

// Description text
draw_set_color(c_silver);
if text != "" draw_text(xx+1,yy+184,text);
 
// Pointers   
if selection > 1 draw_sprite_ext(spr_shipselect,-1,xx+16,yy+120,-1,1,0,c_white,1);
if selection < max_ships draw_sprite_ext(spr_shipselect,-1,xx+224,yy+120,1,1,0,c_white,1);