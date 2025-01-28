draw_self();
if flash_hit == 2
    {
    var b = image_blend;
    if flash_low > 0 b = c_red;
    gpu_set_blendmode(bm_add);
    draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,b,image_alpha);
    gpu_set_blendmode(bm_normal);
    }