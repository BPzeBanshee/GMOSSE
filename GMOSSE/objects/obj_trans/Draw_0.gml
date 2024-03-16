draw_set_color(input_color);
draw_set_halign(fa_left);
draw_set_alpha(alpha);

if mode == 1 then draw_self();
if mode >= 2 then draw_rectangle(xview,yview,xview+240,yview+320,false);
if mode == 3
    {
    if alpha == 1 && timer > 90 && global.levelend
        {
        scr_draw_vars(global.fnt_big,fa_center,c_white);
        draw_text(xview+120,yview+80,"STAGE "+scr_check_stage(global.nextroom)+" START");
        }
    }