scr_draw_vars(global.fnt_little,fa_center,c_white);
draw_set_alpha(image_alpha);
draw_text(round(x),y,string(msg));

timeout -= 1;
y -= 0.2;
if timeout <= 0 then image_alpha -= 0.05;
if image_alpha <= 0 then instance_destroy();