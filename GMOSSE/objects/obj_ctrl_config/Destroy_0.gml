/// @description  Save config on termination, reenable main/pause
if instance_exists(obj_ctrl_menu) then obj_ctrl_menu.enabled = 1;
if instance_exists(obj_ctrl_pause) then obj_ctrl_pause.enabled = 1;
scr_config_save("config.ini");

