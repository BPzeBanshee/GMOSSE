// debug line
//draw_self();

// laser draw stack
if image_xscale < 1 then exit;

if b_subimg = round(b_subimg) then event_user(0);
if surface_exists(surf)
    {
    var xx,yy;
    xx = x + lengthdir_x(8,image_angle+90);
    yy = y + lengthdir_y(8,image_angle+90);
    draw_surface_general(surf,0,0,image_xscale,16,xx,yy,1,1,image_angle,image_blend,image_blend,image_blend,image_blend,b_alpha);
    }
else event_user(0);

// laser head (end of laser)
var hl,hx,hy;
hl = image_xscale;
hx = x + lengthdir_x(hl, image_angle);
hy = y + lengthdir_y(hl, image_angle);
draw_sprite_ext(h_img,h_subimg,hx,hy,1,1,image_angle,image_blend,h_alpha);

// laser flash (start of laser)
if sprite_exists(f_img) then draw_sprite_ext(f_img,f_subimg,x,y,1,1,0,image_blend,f_alpha);

// Image indexes
b_subimg += 0.25; if b_subimg > b_subimg_max then b_subimg = 0; // beam
h_subimg += 0.25; if h_subimg > h_subimg_max then h_subimg = 0; // head
f_subimg += 0.25; if f_subimg > f_subimg_max then f_subimg = 2; // flash

