/// @description scr_create_healthbar()
function scr_create_healthbar() {
	/*
	scr_create_healthbar(), by BPzeBanshee

	What it does:
	Creates a health bar object for an enemy that you define.

	Requires:
	timeout variable set in enemy's Create event
	(used to display time left when debug display is switched on)

	Usage: 
	scr_create_healthbar()
	*/

	if instance_exists(obj_ctrl_healthbar) then instance_destroy(obj_ctrl_healthbar);
   
	var bar = instance_create_layer(xview,yview,global.lay_ctrl,obj_ctrl_healthbar);
	bar.boss = (self).id;
	return bar;
}
