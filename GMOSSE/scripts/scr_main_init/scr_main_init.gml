function scr_main_init() {
	/*
	// Test code for parameters, can't think of any real uses at the moment
	if parameter_count() > 0 && parameter_string(1) != "-game"
	    {
	    var s;
	    s = "";
	    for (i=0;i<parameter_count();i++) s += parameter_string(i+1) + " ";
	    show_message(s);
	    }
	*/
	math_set_epsilon(0.0001);

	global.debug_text = "";
	instance_create_depth(0,0,-99999,obj_debug);

	/* INPUT */
	//Set vars and clear the joystick buttons
	global.jup = false;
	global.jdown = false;
	global.jleft = false;
	global.jright = false;
	global.button1 = false;
	global.button2 = false;
	global.button3 = false;
	global.button4 = false;
	global.joy_id = 0;
	global.joy_pref = 0;

	/* CONFIG */
	scr_config_load("config.ini");

	/* SCORES */
	scr_hiscore_load("score.gmes");

	/* FONTS */
	scr_fonts_init();

	/* CONTROLLERS */
	instance_create_layer(0,0,layer,obj_ctrl_input);
	//instance_create_layer(0,0,layer,obj_ctrl_input2); // for experimental replay support
	instance_create_layer(0,0,layer,obj_ctrl_music);
	if !audio_group_is_loaded(audiogroup_voice) then audio_group_load(audiogroup_voice);
	//instance_create_layer(0,0,layer,obj_ctrl_music_v2); // for loading all handles at once
	
	application_surface_draw_enable(true);
	if os_browser == browser_not_a_browser && os_type == os_windows
	then instance_create_layer(0,0,layer,obj_ctrl_render)
	else
	    {
	    device_mouse_dbclick_enable(false);
	    instance_create_layer(0,0,layer,obj_ctrl_render_mob);
	    }
    
	/* MISC. */
	global.pause = 0;
	global.pausable = false; // define pausable/unpausable rooms with this
	global.paused = false;
	global.levelend = false;
	global.nextroom = -1;  // used for transition control/preloading
	global.startstage = rm_stage1; // hidden menu function
	global.intro = true;

	global.myscore = 0;
	global.score_stored = 0;
	global.extend_number = 1;
	global.lives_stored = 3;
	global.init_bombs = 3;
	global.max_bombs = 5;
	global.bombs_stored = global.init_bombs;
	global.continues = 0;

	/* END */
	//scr_trans(rm_menu,2,c_black,1,1,0);
}