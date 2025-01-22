///@desc TEST 1
scr_playerdata_reset();
global.startstage = rm_test1;
scr_trans(global.startstage,2,c_black,0.025,0.05,0);
with obj_ctrl_music fade_out(3000);