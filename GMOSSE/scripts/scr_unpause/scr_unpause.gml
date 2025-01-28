// scr_unpause(), written by BPze
/**@desc 
Unpauses the game by reactivating everything,
setting the backgrounds back to normal and
deleting the stillscreen image to not be wasteful.
*/
function scr_unpause() {
	var back = layer_get_all();
	for (var i=0; i<array_length(back); i++)
		{
		if layer_get_name(back[i]) != "layer_bkg_brightness"// Reserved for background darkening
			{
			layer_background_alpha(layer_background_get_id(back[i]),global.bkg_alpha[i]);
			layer_vspeed(back[i],global.bkg_vspd[i]);
			layer_hspeed(back[i],global.bkg_hspd[i]);
			}
		}

	if sprite_exists(global.pause_img) sprite_delete(global.pause_img);
	instance_activate_all();
	global.paused = false;
}