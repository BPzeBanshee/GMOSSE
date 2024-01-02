// POSITION ANCHORS
var xx = 0;
var yy = 0;

// SHIP PORTRAIT
draw_sprite_ext(spr_bh_out,image_index/3,xx+120,yy+64,1,1,0,blend,1);
draw_sprite(spr_bh,-1,xx+120,yy+64);

// TITLE TEXT
scr_draw_vars(global.fnt_shipselect,fa_center,8454016);
draw_set_alpha(0.5);

// OPTION SELECTION MENU 
if menu == 1
    {
    draw_text(xx+120,yy+90,"Select Option Type");
	var option_str;
    switch selection 
        {
        case 1: option_str = "Normal"; break;
        case 2: option_str = "Reverse"; break;
        case 3: option_str = "Search"; break;
        case 4: option_str = "Multi"; break;
        case 5: option_str = "Multi-R"; break;
        case 6: option_str = "Shadow"; break;
        case 7: option_str = "Roll"; break;
        }
	draw_text(xx+120,yy+110,option_str);
    }
  
// WEAPON SELECTION MENU
if menu == 2
    {
    draw_sprite_ext(spr_bh_orb,image_index/2,xx+90,yy+64,1,1,90,blend,1);
    draw_sprite_ext(spr_bh_orb,image_index/2,xx+150,yy+64,1,1,90,blend,1);
    draw_text(xx+120,yy+90,"Select Weapon Type");
	draw_text(xx+120,yy+110,weapon_str);
    }
    
// DESCRIPTION TEXT
draw_sprite_stretched_ext(spr_greypixel,0,xx,yy+140,240,160,c_white,0.25);
scr_draw_vars(global.fnt_default,fa_left,c_silver);
draw_set_alpha(1);
draw_text(xx+1,yy+140,text);

// SIDE CURSORS
if selection > 1 then draw_sprite_ext(spr_shipselect,image_index,xx+16,yy+120,-1,1,0,c_white,1);
if selection < 7 then draw_sprite_ext(spr_shipselect,image_index,xx+224,yy+120,1,1,0,c_white,1);