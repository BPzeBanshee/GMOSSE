/*
scr_displayinput, by BPzeBanshee

THIS IS NOT USED ANYWHERE AND IS NOT NEEDED.
USE ONLY FOR TESTING INPUTS IN DEBUGGING.
*/

// Setting font/color/alignment
draw_set_font(global.fnt_default);
draw_set_halign(fa_left);
draw_set_color(c_white);
xview = view_xview[0] + x_o;
yview = view_yview[0] + y_o;

// Drawing text
draw_text(xview,yview+40,"Up: "+string(global.jup));
draw_text(xview,yview+48,"Down: "+string(global.jdown));
draw_text(xview,yview+56,"Left: "+string(global.jleft));
draw_text(xview,yview+64,"Right: "+string(global.jright));
draw_text(xview,yview+72,"B1: "+string(global.button1));
draw_text(xview,yview+80,"B2: "+string(global.button2));
draw_text(xview,yview+88,"B3: "+string(global.button3));

// Drawing debug variables
// make a separate object call this to determine variable transfer lag
draw_text(xview,yview+96,"Step: "+string(global.step));
