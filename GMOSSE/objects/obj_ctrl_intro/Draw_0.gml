if c > 0 then draw_sprite_ext(spr_whitepixel,0,xview,yview,240,320,0,c_white,c);
draw_set_alpha(1-c);

if mode == 2 
    {
    scr_draw_vars(global.fnt_menu,fa_center,8454016);
    var st;
    st = "PRESS "+string(chr(global.keycode_button1))+" OR BUTTON 1\nTO START";
    draw_text(xview+120,yview+160,st);
    }