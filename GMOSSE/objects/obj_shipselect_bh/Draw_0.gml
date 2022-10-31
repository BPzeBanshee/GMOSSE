/* SHIP PORTRAIT */
draw_sprite_ext(spr_bh_out,image_index/3,120,64,1,1,0,blend,1);
//draw_sprite_ext(spr_bh_out,image_index/3,120,64,1.075,1.075,0,blend,1);
draw_sprite(spr_bh,-1,120,64);

/* SIDE CURSORS */
if selection < 7 then
draw_sprite_ext(spr_shipselect,image_index,224,120,1,1,270,c_white,1);
if selection > 1 then
draw_sprite_ext(spr_shipselect,image_index,16,120,-1,1,270,c_white,1);

/* TITLE TEXT */
scr_draw_vars(global.fnt_shipselect,fa_center,8454016);
draw_set_alpha(0.5);

/* OPTION SELECTION MENU */
if menu == 1
    {
    draw_text(120,90,"Select Option Type");
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
	draw_text(120,110,option_str);
    }
  
/* WEAPON SELECTION MENU */ 
if menu == 2
    {
    draw_sprite_ext(spr_bh_orb,image_index/2,90,64,1,1,90,blend,1);
    draw_sprite_ext(spr_bh_orb,image_index/2,150,64,1,1,90,blend,1);
    draw_text(120,90,"Select Weapon Type");
	var weapon_str;
    switch selection 
        {
        case 1: blend = 16744576;	weapon_str = "Twin Shot";	break;
        case 2: blend = 15724527;	weapon_str = "Laser";		break;
        case 3: blend = 11140992;	weapon_str = "Bound Shot";	break;
        case 4: blend = 1776572;	weapon_str = "Spread Bomb"; break;
        case 5: blend = 4227327;	weapon_str = "Saber";		break;
        case 6: blend = 16776960;	weapon_str = "Burner";		break;
        case 7: blend = 16744703;	weapon_str = "Five-Wave";	break;
        }
		
	draw_text(120,110,weapon_str);
    }
    
/* DESCRIPTION TEXT */
draw_sprite_stretched_ext(spr_greypixel,0,0,140,240,160,c_white,0.25);
scr_draw_vars(global.fnt_default,fa_left,c_silver);
draw_set_alpha(1);
draw_text(1,140,text);