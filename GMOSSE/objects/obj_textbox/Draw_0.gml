// This will draw the message
scr_draw_vars(global.fnt_little,fa_left,c_white);
draw_set_alpha(1);
x = xview;
y = yview+200;
draw_text(x+40,y,string_spacefix(text));
draw_sprite(spr_portraits,subimg,x,y);
draw_sprite_stretched_ext(spr_greypixel,-1,x,y,240,64,c_white,0.25);

