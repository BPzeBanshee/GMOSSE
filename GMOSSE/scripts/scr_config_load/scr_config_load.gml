/// @description scr_config_load(location)
/// @param location
function scr_config_load(location) {
	/*
	scr_config_load(), by BPzeBanshee

	Requirements: Ability to use external files
	(so GM Pro and no Secure Mode bullshit)

	Notes:

	Change global variables according to what you need,
	and do not keep the rest. Make sure the global vars
	aren't used anywhere else though!
	*/
	if !file_exists(location)
	trace(string(location)+" not found, using defaults.\nGo to Options Menu to adjust settings.");

	ini_open(location);
    
	/* JOYSTICK */
	// joystick button numbers
	global.joy_pref[0] = ini_read_real("Joystick","joy_pref",0); // preferred joy id
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
	global.alternate_sync = ini_read_real("Video","alternate_sync",false); // alternate sync method
	global.sleep_margin = ini_read_real("Video","sleep_margin",10); // sleep margin when using alt timing
	global.fullscreen = ini_read_real("Video","fullscreen",false); // Fullscreen mode
	global.vsync = ini_read_real("Video","vsync",false); // vertical sync
	global.aa = ini_read_real("Video","antialiasing",0); // Anti-aliasing 

	global.window_aspect = ini_read_real("Video_Display","window_aspect",2); // window aspect ratio
	global.window_size = ini_read_real("Video_Display","window_size",5); // window size
	global.rotation = ini_read_real("Video_Display","rotation",0); // Screen orientation
	global.scaling = ini_read_real("Video_Display","scaling",1); // Scaling method
	global.use_wallpaper = ini_read_real("Video_Display","wallpaper",1); // draw wallpaper

	global.wallbrightness = ini_read_real("Video_Filters","wallbrightness",100); // Side art Brightness
	global.filter = ini_read_real("Video_Filters","filter",false); // Interpolation of colours between pixels
	global.scanlines = ini_read_real("Video_Filters","scanlines",0); // scanlines
	global.scanline_alpha = ini_read_real("Video_Filters","scanline_alpha",50); // scanline alpha

	/* SOUND */
	// Volume levels
	global.music_volume = ini_read_real("Sound","music_volume",70);
	global.sfx_volume = ini_read_real("Sound","sfx_volume",70);
	global.voice_volume = ini_read_real("Sound","voice_volume",70);

	// Music INI location
	global.music_ini = ini_read_string("Sound","musicmodfile","music.ini");

	/*
	TODO:
	// GAMEPLAY //
	global.bullet_color[0] = ini_read_real("Gameplay_Bullets","bullet1_color",0);
	global.bullet_color[1] = ini_read_real("Gameplay_Bullets","bullet2_color",0);
	global.bullet_color[2] = ini_read_real("Gameplay_Bullets","bullet3_color",0);
	global.bullet_color[3] = ini_read_real("Gameplay_Bullets","bullet4_color",0);
	*/

	/* MISC */
	global.debug = ini_read_real("Misc","debug",true); // Debug display
	global.hitbox_visible = ini_read_real("Misc","hitboxvisible",true); // hitbox visibility
	global.fonttype = ini_read_real("Misc","fonttype",0); // Font set to use (0=default,1=alternate)
	global.bulletcolour = ini_read_real("Misc","bulletcolour",2); // Bullet color (0=red,1=blue,2=hybridmode)
	global.flicker = ini_read_real("Misc","flicker",false); // explosion flicker
	ini_close();
}