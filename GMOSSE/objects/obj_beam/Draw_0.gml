// debug line
//draw_self();

// laser draw stack
if image_xscale < 1 then exit;

var in = floor(b_subimg);
var xx,yy;
for(var i=0; i<image_xscale-32;i+=b_width)
    {
    xx = x + lengthdir_x(i, image_angle);
    yy = y + lengthdir_y(i, image_angle);
    draw_sprite_ext(b_img,in,xx,yy,1,image_yscale,image_angle,image_blend,b_alpha);
    in += 1; if in > b_subimg_max then in = 0;
    }

// laser head (end of laser)
var hl,hx,hy;
if image_xscale > sprite_get_width(h_img)-sprite_get_xoffset(h_img)
    {
    // Drawing head at end of laser as per normal
    hl = image_xscale-sprite_get_xoffset(h_img);
    hx = x + lengthdir_x(hl, image_angle);
    hy = y + lengthdir_y(hl, image_angle);
    draw_sprite_ext(h_img,h_subimg,hx,hy,1,1,image_angle,image_blend,h_alpha);
    }
else
    {
    // If laser is smaller than the head, draw only part of the head
    // Because of draw_sprite_general not using sprite offsets we do it manually
    // If you don't care for this minute detail you could probably get rid of this bit
    hl = image_xscale-sprite_get_xoffset(h_img);
    hx = x + lengthdir_x(hl, image_angle) - lengthdir_x(sprite_get_xoffset(h_img)/2,image_angle - 90);
    hy = y + lengthdir_y(hl, image_angle) - lengthdir_y(sprite_get_yoffset(h_img)/2,image_angle - 90);
    draw_sprite_general(h_img,h_subimg,clamp(36-image_xscale,0,36),0,clamp(image_xscale,0,36),20,hx,hy,1,1,image_angle,image_blend,image_blend,image_blend,image_blend,h_alpha);
    }

// laser flash (start of laser)
if sprite_exists(f_img) then draw_sprite_ext(f_img,f_subimg,x,y,1,1,image_angle,image_blend,f_alpha);

// Image indexes
b_subimg += 0.25; if b_subimg > b_subimg_max then b_subimg = 0; // beam
h_subimg += 0.25; if h_subimg > h_subimg_max then h_subimg = 0; // head
f_subimg += 0.25; if f_subimg > f_subimg_max then f_subimg = 2; // flash

