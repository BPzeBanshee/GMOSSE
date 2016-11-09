///scr_config_load(ini)
/*
scr_config_load(), by BPzeBanshee

Requirements: Ability to use external files
(so GM Pro and no Secure Mode bullshit)

Notes:

Change global variables according to what you need,
and do not keep the rest. Make sure the global vars
aren't used anywhere else though!
*/
if !file_exists(argument0)
then show_message("****"+string_upper(argument0)+" NOT FOUND****#Using defaults. Go to Options Menu to adjust settings.");

ini_open(argument0);
    
/* JOYSTICK */
// joystick button numbers
global.joy_pref = ini_read_real("Joystick","joy_pref",0); // preferred joy id
global.joy1 = ini_read_real("Joystick","joy1",gp_face1);
global.joy2 = ini_read_real("Joystick","joy2",gp_face2);
global.joy3 = ini_read_real("Joystick","joy3",gp_face3);
global.joy4 = ini_read_real("Joystick","joy4",gp_start);
global.deadzone = ini_read_real("Joystick","deadzone",0.3); // joystick deadzone
global.joytype = ini_read_real("Joystick","joytype",2);// direction input to use

/* KEYBOARD */
// keyboard codes
global.keycode_up = ini_read_real("Keyboard","up",vk_up);
global.keycode_down = ini_read_real("Keyboard","down",vk_down);
global.keycode_left = ini_read_real("Keyboard","left",vk_left);
global.keycode_right = ini_read_real("Keyboard","right",vk_right);
global.keycode_button1 = ini_read_real("Keyboard","button1",ord("Z"));
global.keycode_button2 = ini_read_real("Keyboard","button2",ord("X"));
global.keycode_button3 = ini_read_real("Keyboard","button3",vk_shift);
global.keycode_button4 = ini_read_real("Keyboard","button4",vk_enter);
     
/* VIDEO */
global.use_new_renderer = ini_read_real("Video","use_new_renderer",1); // Render method
global.fullscreen = ini_read_real("Video","fullscreen",false); // Fullscreen mode
global.window_aspect = ini_read_real("Video","window_aspect",1); // window aspect ratio
global.window_size = ini_read_real("Video","window_size",1); // window size
global.rotation = ini_read_real("Video","rotation",0); // Screen orientation
global.scaling = ini_read_real("Video","scaling",0); // Scaling method
global.use_wallpaper = ini_read_real("Video","wallpaper",1); // draw wallpaper
      
global.filter = ini_read_real("Video","filter",false); // Interpolation of colours between pixels
global.scanlines = ini_read_real("Video","scanlines",0); // scanlines
global.vsync = ini_read_real("Video","vsync",false); // vertical sync
global.aa = ini_read_real("Video","antialiasing",0); // Surfaces
global.vertex_buffer_method = ini_read_real("Video","vertex_buffer_method",2); // vertex buffer method
global.alternate_sync = ini_read_real("Video","alternate_sync",0); // alternate sync method (windows only)
  
/* SOUND */
// Volume levels
global.music_volume = ini_read_real("Sound","music_volume",100);
global.sfx_volume = ini_read_real("Sound","sfx_volume",100);
global.voice_volume = ini_read_real("Sound","voice_volume",100);
    
// Music INI location
global.music_ini = ini_read_string("Sound","musicmodfile","music.ini");

/* MISC */
global.debug = ini_read_real("Misc","debug",true); // Debug display
global.hitbox_visible = ini_read_real("Misc","hitboxvisible",true); // hitbox visibility
global.fonttype = ini_read_real("Misc","fonttype",0); // Font set to use (0=default,1=alternate)
global.bulletcolour = ini_read_real("Misc","bulletcolour",2); // Bullet color (0=red,1=blue,2=hybridmode)
global.flicker = ini_read_real("Misc","flicker",false); // explosion flicker
ini_close();
