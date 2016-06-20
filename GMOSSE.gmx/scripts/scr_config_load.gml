/*
scr_loadconfig(), by BPzeBanshee

Usage: scr_loadconfig();
Requirements: Ability to use external files
(so GM Pro and no Secure Mode bullshit)

Notes:

Change global variables according to what you need,
and do not keep the rest. Make sure the global vars
aren't used anywhere else though!

Make sure you define defaults. GMOSSE used to handle
defaults separately, but why do that when it can be
done here with less lines of code in a friendly way?
*/
if !file_exists(argument0)
then show_message("****"+string_upper(argument0)+" NOT FOUND****#Using defaults. Go to Options Menu to adjust settings.");

ini_open(argument0);
    
/* JOYSTICK */
// joystick button numbers
global.joy1 = ini_read_real("Joystick","joy1",1);
global.joy2 = ini_read_real("Joystick","joy2",2);
global.joy3 = ini_read_real("Joystick","joy3",3);
global.joy4 = ini_read_real("Joystick","joy4",7);
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
global.fullscreen = ini_read_real("Video","fullscreen",false); // Fullscreen mode
global.filter = ini_read_real("Video","filter",false); // Interpolation of colours between pixels
global.win_size = ini_read_real("Video","window_size",1); // Size factor to scale up window by
global.tate = ini_read_real("Video","tate",0); // TATE (screen orientation)
global.scanlines = ini_read_real("Video","scanlines",0); // scanlines
global.vsync = ini_read_real("Video","vsync",false); // vertical sync
global.aa = ini_read_real("Video","antialiasing",0); // Surfaces
global.hitbox_visible = ini_read_real("Video","hitboxvisible",true); // hitbox visibility
global.flicker = ini_read_real("Video","flicker",false); // explosion flicker

/* SOUND */
// Volume levels
global.music_volume = ini_read_real("Sound","music_volume",100);
global.sfx_volume = ini_read_real("Sound","sfx_volume",100);
global.voice_volume = ini_read_real("Sound","voice_volume",100);
    
// Music INI location
global.music_ini = ini_read_string("Sound","musicmodfile","music.ini");

/* MISC */
global.debug = ini_read_real("Misc","debug",true); // Debug display
global.fonttype = ini_read_real("Misc","fonttype",0); // Font set to use (0=default,1=alternate)
global.bulletcolour = ini_read_real("Misc","bulletcolour",2); // Bullet color (0=red,1=blue,2=hybridmode)
ini_close();
