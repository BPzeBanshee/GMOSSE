if l_delay > 0 then exit;
draw_set_alpha(1);

if m_wallpaper && (m_aspect > 0 || (m_aspect == 0 && (m_angle == 90 || m_angle == 270)))
    {
    draw_sprite_stretched(bkg_wallpaper,0,0,0,window_get_width(),window_get_height());
    draw_sprite_ext(spr_outline,0,x,y,l_scale,l_scale,m_angle,c_white,1);
    }

gpu_set_blendmode_ext(bm_one,bm_zero);
draw_surface_ext(application_surface,xx,yy,l_scale,l_scale,m_angle,c_white,1);
gpu_set_blendmode(bm_normal);

scr_draw_vars(global.fnt_little,fa_right,c_black);
var s1 = "Win. Size: "+string(window_get_width())+"x"+string(window_get_height());
var s2 = "GUI. Size: "+string(display_get_width())+"x"+string(display_get_height());
draw_rectangle(window_get_width()-string_width(s1),0,window_get_width(),12,0);
draw_set_color(c_white);
draw_text(window_get_width(),0,s1);
draw_text(window_get_width(),12,s2);