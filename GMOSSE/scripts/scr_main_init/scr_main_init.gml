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

	// INPUT
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

	// CONFIG
	scr_config_load("config.ini");

	// SCORES
	scr_hiscore_load("score.gmes");

	// FONTS
	scr_fonts_init();

	// CONTROLLERS
	// Input
	instance_create_layer(0,0,layer,obj_ctrl_input);
	//instance_create_layer(0,0,layer,obj_ctrl_input2); // for experimental replay support
	
	// Music/Sounds
	instance_create_layer(0,0,layer,obj_ctrl_music);
	
	// Render
	globalvar xview,yview;
	xview = 0;
	yview = 0;
	application_surface_draw_enable(true);
	if os_get_type()=="gx" || os_browser != browser_not_a_browser
	then instance_create_layer(0,0,layer,obj_ctrl_render_mob)
	else instance_create_layer(0,0,layer,obj_ctrl_render);
    
	// MISC.
	// pause-related vars
	global.pausable = false; // define pausable/unpausable rooms with this
	global.paused = false;
	global.pause_img = -1;
	global.bkg_vspd[0] = 0; 
	global.bkg_hspd[0] = 0;
	global.bkg_alpha[0] = 0;
	
	// used for transition control/preloading
	global.levelend = false;
	global.nextroom = -1;  
	global.startstage = rm_stage1; // hidden menu function
	global.intro = true;

	// shipselect
	global.shipselect = 1; // ship ID
	global.optiontype = 1; // Busterhawk-specifc vars
	global.weapontype = 1;
	
	// ingame
	global.myscore = 0;
	global.medalvalue = 1;
	global.score_stored = 0;
	global.lives_stored = 3;
	global.bombs_stored = -1;
	global.extend_number = 1;
	global.continues = 0;

	/* END SCR_MAIN_INIT() - SEE OBJ_INIT FOR ROOM TRANSITION */
}