/// @description  Update laser beam surface
var s,h;
s = floor(b_subimg);
h = sprite_get_height(b_img);

if !surface_exists(surf) then surf = surface_create(320,h);
surface_set_target(surf);
draw_clear_alpha(c_white,0);
for (var i=0;i<320;i+=b_width)
    {
    draw_sprite(b_img,s,i,h/2);
    s += 1; if s > b_subimg_max then s = 0;
    }
surface_reset_target();

