global.debug_text = "";
instance_create(0,0,obj_debug);
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
global.main_dir = game_save_id;
globalvar USE_SANDBOX; 
USE_SANDBOX = 1;
if USE_SANDBOX = 0
    {
    /*
    TODO: find free non-sandboxed alternative,
    originally Team Grybanser Fox used GMFileSystem 
    which started having dependency issues with 
    Windows 10 so we switched to YellowAfterlife's NSFS
    which has a charge for using it.
    
    Note: GMS2 now allows sandbox to be switched off in
    project preferences. If migrating to GMS2 setting up
    a DLL to break out of sandbox will be a waste of time.
    */
    }
math_set_epsilon(0.01);

/* INPUT */
//Set vars and clear the joystick buttons
global.jup = 0;
global.jdown = 0;
global.jleft = 0;
global.jright = 0;
global.button1 = 0;
global.button2 = 0;
global.button3 = 0;
global.button4 = 0;
global.joy_id = 0;
global.joy_pref = 0;

/* CONFIG */
scr_config_load("config.ini");

/* SCORES */
scr_hiscore_load("score.gmes");

/* FONTS */
scr_fonts_init();

/* CONTROLLERS */
instance_create(0,0,obj_ctrl_input);
//instance_create(0,0,obj_ctrl_input2); // for experimental replay support
instance_create(0,0,obj_ctrl_music);
//instance_create(0,0,obj_ctrl_music_v2); // for loading all handles at once
application_surface_draw_enable(true);

if global.use_new_renderer
    {
    if os_browser = browser_not_a_browser && os_type = os_windows
    then instance_create(0,0,obj_ctrl_render)
    else
        {
        device_mouse_dbclick_enable(false);
        instance_create(0,0,obj_ctrl_render_mob);
        }
    }
else instance_create(0,0,obj_ctrl_render_old);
    
/* MISC. */
global.pause = 0;
global.pausable = 0; // define pausable/unpausable rooms with this
global.paused = 0;
global.levelend = 0;
global.nextroom = -1;  // used for transition control/preloading
global.startstage = rm_stage1; // hidden menu function
global.intro = 1;

global.score_stored = 0;
global.extend_number = 1;
global.lives_stored = 3;
global.init_bombs = 3;
global.max_bombs = 5;
global.bombs_stored = global.init_bombs;
global.continues = 0;
global.gamecomplete = 0;
global.version_str = "MK-X BETA";

globalvar xview,yview;
xview = view_xview[0];
yview = view_yview[0];

/* END */
//scr_trans(rm_menu,2,c_black,1,1,0);
