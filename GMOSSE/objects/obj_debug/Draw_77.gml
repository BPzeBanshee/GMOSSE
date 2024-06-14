/// @description  DRAW DEBUG TEXT (HTML5/ANDROID)
/// @param HTML5/ANDROID
if os_browser == browser_not_a_browser || os_type == os_windows exit;
if window_get_width() < 640 exit;
scr_draw_vars(global.fnt_default,fa_left,c_white);
draw_set_alpha(1);
draw_text(0,0,txt);

