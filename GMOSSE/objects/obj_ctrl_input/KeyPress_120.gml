/// @description  SAVE SCREENSHOT
var dir,f;
f = scr_timestr()+".png";
dir = working_directory+f; // program_directory is blocked even with sandbox turned off, facepalm
screen_save_part(dir,0,0,window_get_width(),window_get_height());