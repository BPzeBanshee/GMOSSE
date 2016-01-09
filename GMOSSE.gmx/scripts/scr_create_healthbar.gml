///scr_create_healthbar()
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

if instance_exists(obj_ctrl_healthbar)
then with obj_ctrl_healthbar instance_destroy();
   
bar = instance_create(xview,yview,obj_ctrl_healthbar);
bar.boss = (self).id;
return bar;
