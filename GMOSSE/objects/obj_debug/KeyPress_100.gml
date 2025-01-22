///@desc OMAKE 1
scr_playerdata_reset();
global.startstage = rm_omake1;
scr_trans(global.startstage,3,c_black,0.025,0.05,210);
with obj_ctrl_music fade_out(3000);