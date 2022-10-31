// set draw position
x = xview+120;
y = yview+160;
var x2 = x + random_range(-rnd,rnd);
var y2 = y + random_range(-rnd,rnd);

// draw self
draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_white,image_alpha);
draw_sprite_ext(spr_warning,0,x2,y2,1,1,0,c_white,alpha2);

// draw text 
draw_set_font(global.fnt_menu);
draw_set_color(make_color_rgb(255,75,75));
draw_set_halign(fa_center);
draw_set_alpha(alpha3);
draw_text(x,y+20,text);

