draw_self();
if flash_hit == 2
    {
    var b;
    if flash_low > 0 b = c_red else b = image_blend;
    gpu_set_blendmode(bm_add);
    draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,b,image_alpha);
    gpu_set_blendmode(bm_normal);
    }