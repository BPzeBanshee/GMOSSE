if l_delay > 0 then exit;
draw_set_alpha(1);

if m_wallpaper > 0
    {
    // TODO: Scale to aspect rather than squishing 1920x1080 images in 4:3 windows
    //draw_sprite_ext(l_wall_img[m_wallpaper-1],0,l_wall_x,l_wall_y,l_wall_s,l_wall_s,0,c_white,1);
    draw_sprite_stretched(l_wall_img[m_wallpaper-1],0,0,0,window_get_width(),window_get_height());
    draw_set_alpha(1 - min(0.9,global.wallbrightness/100));
    draw_sprite_stretched(spr_blackpixel,0,0,0,window_get_width(),window_get_height());
    draw_set_alpha(1);
    draw_sprite_ext(spr_outline,0,x,y,l_scale,l_scale,m_angle,c_white,1);
    }

if global.filter then gpu_set_texfilter(true);
gpu_set_blendmode_ext(bm_one,bm_zero);
draw_surface_ext(application_surface,round(xx),round(yy),l_scale,l_scale,m_angle,c_white,1);
gpu_set_blendmode(bm_normal);
if global.filter then gpu_set_texfilter(false);
//gpu_set_blendmode_ext(bm_src_alpha, bm_inv_src_alpha);

// Apply scanlines if necessary
if m_scanlines > 0
    {
    if !surface_exists(l_scan)
    then event_user(1)
    else draw_surface_ext(l_scan,round(xx),round(yy),1,1,m_angle,c_white,global.scanline_alpha/100);
    }
    


