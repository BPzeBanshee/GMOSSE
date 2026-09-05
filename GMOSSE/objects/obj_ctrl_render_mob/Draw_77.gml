/*if l_delay > 0 exit;
draw_set_alpha(1);

if m_wallpaper && (m_aspect > 0 || (m_aspect == 0 && (m_angle == 90 || m_angle == 270)))
    {
    draw_sprite_stretched(bkg_wallpaper,0,0,0,window_get_width(),window_get_height());
    draw_sprite_ext(spr_outline,0,x,y,l_scale,l_scale,m_angle,c_white,1);
    }

gpu_set_blendmode_ext(bm_one,bm_zero);
draw_surface_ext(application_surface,xx,yy,l_scale,l_scale,m_angle,c_white,1);
gpu_set_blendmode(bm_normal);*/
event_inherited();
scr_draw_vars(global.fnt_little,fa_left,c_black);
var ww = window_get_width();
var s1 = "Win. Size: "+string(ww)+"x"+string(window_get_height());
var s2 = "GUI. Size: "+string(display_get_width())+"x"+string(display_get_height());
var s3 = "lwh. Size: "+string(lw_width)+"x"+string(lw_height);
draw_rectangle(0,0,string_width(s1+", "+s2),36,0);
draw_set_color(c_white);
draw_text(0,0,s1+", "+s2);
draw_text(0,12,s3);
draw_text(0,24,"FULL:"+string(window_get_fullscreen())+", FOCUS:"+string(window_has_focus()));