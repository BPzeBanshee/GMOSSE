/// @description  Save config on exit, reenable main/pause
if instance_exists(obj_ctrl_menu) obj_ctrl_menu.enabled = true;
if instance_exists(obj_ctrl_pause) obj_ctrl_pause.enabled = true;
scr_config_save("config.ini");