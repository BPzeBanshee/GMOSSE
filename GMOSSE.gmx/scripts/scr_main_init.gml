scr_draw_vars(fnt_init,fa_left,c_white);
instance_create(0,0,obj_debug);
draw_text(0,10,"PLEASE WAIT...");

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
global.joy_id = 1;
instance_create(0,0,obj_ctrl_input);

/* CONFIG */

scr_config_load("config.ini");

/* SCREEN */
scr_screen_init();

/* SCORES */
scr_hiscore_load("score.gmes");

/* FONTS */
scr_fonts_init();

/* DLL CONTROLLERS */
instance_create(0,0,obj_ctrl_music);
    
/* MISC. */
global.pause = 0;
global.update = 0;
global.pausable = 0; // define pausable/unpausable rooms with this
global.nextroom = 0;  // used for transition control/preloading
global.startstage = rm_stage1; // hidden menu function
global.TATE2 = 0; // used by options menu for TATE
global.intro = 1;
/* END */
scr_trans(rm_menu,2,c_black,0.5,1,0);
