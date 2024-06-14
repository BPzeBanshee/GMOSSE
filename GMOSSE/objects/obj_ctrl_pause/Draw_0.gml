scr_pause_draw();

// Drawing the pause menu options and cursor
if !enabled exit;
scr_draw_vars(global.fnt_default,fa_left,8454016);
draw_set_alpha(1);

var xx = xview;
var yy = yview;

draw_sprite(spr_pause,-1,xx+120,yy+135);

draw_set_color(c_black); draw_set_alpha(0.5);
draw_rectangle(xx+30,yy+110,xx+210,yy+220,0);
draw_set_color(8454016); draw_set_alpha(1);

draw_text(xx+60,yy+160,"RESUME GAME");
if restart_locked draw_set_color(c_red);
draw_text(xx+60,yy+170,"RESTART LEVEL");
if restart_locked draw_set_color(8454016);
draw_text(xx+60,yy+180,"RETURN TO SHIP SELECT");
draw_text(xx+60,yy+190,"CONFIGURATION");
draw_text(xx+60,yy+200,"EXIT TO MAIN MENU");

var sy = yy+155+(10 * selection);
draw_sprite(spr_shipselect,-1,xx+45,sy);