if !enabled exit;
draw_set_alpha(clamp(alpha,0,1));

if alpha < 1 scr_pause_draw();

draw_set_color(c_black);
draw_rectangle(xview,yview,xview+240,yview+320,false);

scr_draw_vars(global.fnt_big,fa_center,c_white);
draw_text(xview+120,yview+96,"Continue?");

draw_set_halign(fa_left);
draw_set_font(global.fnt_default);

draw_set_color(make_color_rgb(150,150,255));
if selection==1 draw_set_color(make_color_rgb(220,220,255));
draw_text(xview+110,yview+130,"Yes");

draw_set_color(make_color_rgb(150,150,255));
if selection==2 draw_set_color(make_color_rgb(220,220,255));
draw_text(xview+110,yview+140,"No");

switch selection
    {
    case 1: draw_sprite(spr_shipselect,-1,xview+95,yview+135); break;
    case 2: draw_sprite(spr_shipselect,-1,xview+95,yview+145); break;
    }

