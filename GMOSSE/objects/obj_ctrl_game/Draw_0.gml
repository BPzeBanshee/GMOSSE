scr_hud_player(xview,yview,side);
if instance_number(object_index) == 2
then x = obj_ctrl_stage.x+160+(side ? 80 : -80)
else x = obj_ctrl_stage.x+160;
y = yview+240;