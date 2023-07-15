///@desc scr_layer_vars() 
// Assigns the IDs of the stage's layers to globalvars - called by the stage controller
function scr_layer_vars() {
	global.lay_ctrl = layer_get_id("lay_ctrl");
	global.lay_bullets = layer_get_id("lay_bullets");
	//global.lay_medals = layer_get_id("layer_medals");
	global.lay_player = layer_get_id("lay_player");
	global.lay_en_air = layer_get_id("lay_en_air");
	global.lay_en_ground = layer_get_id("lay_en_ground");
	global.lay_bkg = layer_get_id("lay_bkg");
	//global.lay_bkg2 = layer_get_id("lay_bkg2");
	//global.lay_bkg3 = layer_get_id("lay_bkg3");
}