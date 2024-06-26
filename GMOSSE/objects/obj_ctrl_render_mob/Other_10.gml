///@desc Set Window size according to aspect etc

// First, update the maximum array iteration size
m_aspect = global.window_aspect;
var l_max_size = (browser_height / m_base_h);
if m_clean l_max_size = floor(l_max_size);

// Feather disable once GM1041
m_size = min(global.window_size,l_max_size);
if global.window_size > l_max_size global.window_size = l_max_size;

// Then pluck the array variables and adjust window size accordingly
var w = max(240,browser_width);
var h = max(320,browser_height - 4);
//w = clamp(m_base_w * m_size,m_base_w,browser_width);
//h = clamp(m_base_h * m_size,m_base_h,browser_height - 4);
window_set_size(w,h);
l_res = "WEB ("+string(w)+"x"+string(h)+")";
l_delay = 0;

// Restore filter use if applicable
alarm[1] = 10;