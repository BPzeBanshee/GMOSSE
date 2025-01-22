///@desc Creates a health bar HUD object for the calling object.
///@returns {Id.Instance} 
function scr_create_healthbar() {
	/*
	scr_create_healthbar(), by BPzeBanshee

	Requires:
	'timeout', 'enemyHP' and 'enemyHP_max' variable set in enemy's Create event
	*/

	if instance_exists(obj_ctrl_healthbar) instance_destroy(obj_ctrl_healthbar);
   
	var bar = instance_create_layer(xview,yview,global.lay_ctrl,obj_ctrl_healthbar);
	bar.boss = id;
	return bar;
}