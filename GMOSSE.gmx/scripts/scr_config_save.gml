// Saves settings to config
ini_open(argument0);

// [JOYSTICK]
ini_write_real("Joystick","joy1",global.joy1);
ini_write_real("Joystick","joy2",global.joy2);
ini_write_real("Joystick","joy3",global.joy3);
ini_write_real("Joystick","joy4",global.joy4);
ini_write_real("Joystick","deadzone",global.deadzone);

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
ini_write_real("Video","fullscreen",global.fullscreen);
ini_write_real("Video","filter",global.filter);
ini_write_real("Video","window_size",global.win_size);
ini_write_real("Video","tate",global.tate);
ini_write_real("Video","hitboxvisible",global.hitbox_visible);
ini_write_real("Video","scanlines",global.scanlines);
ini_write_real("Video","vsync",global.vsync);
ini_write_real("Video","antialiasing",global.aa);
ini_write_real("Video","flicker",global.flicker);

// [SOUND]
ini_write_real("Sound","music_volume",global.music_volume);
ini_write_real("Sound","sfx_volume",global.sfx_volume);
ini_write_real("Sound","voice_volume",global.voice_volume);
ini_write_string("Sound","musicmodfile",global.music_ini);

// [MISC]
ini_write_real("Misc","debug",global.debug);
ini_write_real("Misc","fonttype",global.fonttype);
ini_write_real("Misc","bulletcolour",global.bulletcolour);
ini_close();
