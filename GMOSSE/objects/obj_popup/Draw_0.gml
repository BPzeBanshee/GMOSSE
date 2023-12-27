scr_draw_vars(global.fnt_little,fa_center,c_white);
var oa = draw_get_alpha();
draw_set_alpha(image_alpha);
draw_text(round(x),y,string(msg));
draw_set_alpha(oa);

timeout -= 1;
y -= 0.2;
if timeout <= 0 then image_alpha -= 0.05;
if image_alpha <= 0 then instance_destroy();