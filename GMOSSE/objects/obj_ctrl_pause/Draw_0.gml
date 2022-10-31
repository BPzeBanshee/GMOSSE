scr_pause_draw();

// Drawing the pause menu options and cursor
if !enabled exit;
scr_draw_vars(global.fnt_default,fa_left,8454016);
draw_set_alpha(1);

draw_sprite(spr_pause,-1,xview+120,yview+135);

draw_set_color(c_black); draw_set_alpha(0.5);
draw_rectangle(xview+30,yview+110,xview+210,yview+220,0);
draw_set_color(8454016); draw_set_alpha(1);

draw_text(xview+60,yview+160,"RESUME GAME");
if restart_locked = 1 then draw_set_color(c_red);
draw_text(xview+60,yview+170,"RESTART LEVEL");
if restart_locked = 1 then draw_set_color(8454016);
draw_text(xview+60,yview+180,"RETURN TO SHIP SELECT");
draw_text(xview+60,yview+190,"CONFIGURATION");
draw_text(xview+60,yview+200,"EXIT TO MAIN MENU");

switch selection 
    {
    case 1: draw_sprite(spr_shipselect,-1,xview+45,yview+165); break;
    case 2: draw_sprite(spr_shipselect,-1,xview+45,yview+175); break;
    case 3: draw_sprite(spr_shipselect,-1,xview+45,yview+185); break;
    case 4: draw_sprite(spr_shipselect,-1,xview+45,yview+195); break;
    case 5: draw_sprite(spr_shipselect,-1,xview+45,yview+205); break;
    }

