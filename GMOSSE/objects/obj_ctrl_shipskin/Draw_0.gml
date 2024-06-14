var xx = xview;
var yy = yview;
var wx = ship_totalwidth+20;
var wy = 60;

draw_set_alpha(0.75);
draw_set_color(c_black);
draw_rectangle(xx+120-(wx/2),yy+130,xx+120+(wx/2),yy+210,false);
//x-(wx/2),y-(wy/2),ship_totalwidth+20,60
draw_set_alpha(1);

scr_draw_vars(global.fnt_default,fa_center,c_white);
draw_text(xx+120,yy+135,"SELECT SKIN");

// TODO: Adjust this to actually center properly
var sx = (xx+120) - (ship_totalwidth/2) + 20;
var ii = 2;
var iw = 40;
for (var i=0; i<arrlen; i++)
	{
	ii = floor(ship_index[i]/2);
	draw_sprite(ship_img[i],ii,sx+(i*iw),yy+170);
	if choice == i draw_sprite_ext(spr_shipselect,-1,sx+(choice*iw),yy+200,1,1,90,c_white,1);
	}