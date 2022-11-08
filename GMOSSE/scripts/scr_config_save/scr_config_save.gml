function scr_config_save(argument0) {
	// Saves settings to config
	ini_open(argument0);

	// [JOYSTICK]
	ini_write_real("Joystick","joy_pref",global.joy_pref);
	ini_write_real("Joystick","joy1",global.joy1);
	ini_write_real("Joystick","joy2",global.joy2);
	ini_write_real("Joystick","joy3",global.joy3);
	ini_write_real("Joystick","joy4",global.joy4);
	ini_write_real("Joystick","deadzone",global.deadzone);
	ini_write_real("Joystick","joytype",global.joytype);

	// [KEYBOARD]
	ini_write_real("Keyboard","up",global.keycode_up);
	ini_write_real("Keyboard","down",global.keycode_down);
	ini_write_real("Keyboard","left",global.keycode_left);
	ini_write_real("Keyboard","right",global.keycode_right);
	ini_write_real("Keyboard","button1",global.keycode_button1);
	ini_write_real("Keyboard","button2",global.keycode_button2);
	ini_write_real("Keyboard","button3",global.keycode_button3);
	ini_write_real("Keyboard","button4",global.keycode_button4);

	// [VIDEO]
	ini_write_real("Video","alternate_sync",global.alternate_sync);
	ini_write_real("Video","sleep_margin",global.sleep_margin);
	ini_write_real("Video","fullscreen",global.fullscreen);
	ini_write_real("Video","vsync",global.vsync);
	ini_write_real("Video","antialiasing",global.aa);

	ini_write_real("Video_Display","window_aspect",global.window_aspect);
	ini_write_real("Video_Display","window_size",global.window_size);
	ini_write_real("Video_Display","rotation",global.rotation);
	ini_write_real("Video_Display","scaling",global.scaling);
	ini_write_real("Video_Display","wallpaper",global.use_wallpaper);

	ini_write_real("Video_Filters","wallbrightness",global.wallbrightness);
	ini_write_real("Video_Filters","filter",global.filter);
	ini_write_real("Video_Filters","scanlines",global.scanlines);
	ini_write_real("Video_Filters","scanline_alpha",global.scanline_alpha);

	/*
	// [GAMEPLAY]
	ini_write_real("Gameplay","hitboxvisible",global.hitbox_visible);
	ini_write_real("Gameplay","hitboxcolor",global.hitbox_color);

	ini_write_real("Gameplay_Bullets","bullet1_color",global.bullet_color[0]);
	ini_write_real("Gameplay_Bullets","bullet2_color",global.bullet_color[1]);
	ini_write_real("Gameplay_Bullets","bullet3_color",global.bullet_color[2]);
	ini_write_real("Gameplay_Bullets","bullet4_color",global.bullet_color[3]);
	*/

	// [SOUND]
	ini_write_real("Sound","music_volume",global.music_volume);
	ini_write_real("Sound","sfx_volume",global.sfx_volume);
	ini_write_real("Sound","voice_volume",global.voice_volume);
	ini_write_string("Sound","musicmodfile",global.music_ini);

	// [MISC]
	ini_write_real("Misc","debug",global.debug);
	ini_write_real("Misc","hitboxvisible",global.hitbox_visible);
	ini_write_real("Misc","fonttype",global.fonttype);
	ini_write_real("Misc","bulletcolour",global.bulletcolour);
	ini_write_real("Misc","flicker",global.flicker);
	ini_close();
}