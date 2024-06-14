scr_draw_vars(global.fnt_big,fa_center,c_white);
draw_set_alpha(1);
scr_pause_draw();
draw_text(xview+120,yview+130,str);
if newscore
    {
    draw_text(xview+120,yview+150,"Enter Initials");
    draw_set_halign(fa_left);
    if (pos == 1)
        {
        if flash > 5 draw_text(xview+90,yview+170,letter1);
        draw_text(xview+110,yview+170,letter2);
        draw_text(xview+130,yview+170,letter3);
        }
    if (pos == 2)
        {
        draw_text(xview+90,yview+170,letter1);
        if flash > 5 draw_text(xview+110,yview+170,letter2);
        draw_text(xview+130,yview+170,letter3);
        }
    if (pos == 3)
        {
        draw_text(xview+90,yview+170,letter1);
        draw_text(xview+110,yview+170,letter2);
        if flash > 5 draw_text(xview+130,yview+170,letter3);
        }
    }

