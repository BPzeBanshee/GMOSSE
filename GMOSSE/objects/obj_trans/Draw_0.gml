draw_set_color(input_sprite);
draw_set_halign(fa_left);
draw_set_alpha(alpha);

if mode == 1 then draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,image_alpha);
if mode == 2 then draw_rectangle(xview,yview,xview+240,yview+320,0);
if mode == 3
    {
    draw_rectangle(xview,yview,xview+240,yview+320,0);
    if alpha == 1 && draw_timer > 90 && global.levelend
        {
        scr_draw_vars(global.fnt_big,fa_center,c_white);
        draw_text(xview+120,yview+80,"STAGE "+scr_check_stage(global.nextroom)+" START");
        }
    }