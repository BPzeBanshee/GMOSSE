if room == rm_menu then exit;
scr_draw_vars(global.fnt_menu,fa_center,8454016);
draw_set_alpha(1);
var st = "DEMONSTRATION";
//st = "PRESS "+string(chr(global.keycode_button1))+" OR BUTTON 1# TO START";
draw_text(xview+120,yview+160,st);