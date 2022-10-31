// set draw position
var x2,y2;
x = xview+120;
y = yview+160;
x2 = x + random_range(-rnd,rnd);
y2 = y + random_range(-rnd,rnd);

// draw self
draw_sprite_ext(sprite_index,0,x,y,1,image_yscale,0,c_white,image_alpha);
draw_sprite_ext(spr_danger,0,x2,y2,1,1,0,c_white,alpha2);

// draw text
scr_draw_vars(global.fnt_menu,fa_center,make_color_rgb(255,75,75));
draw_set_alpha(alpha3);
draw_text(x,y+20,text);

