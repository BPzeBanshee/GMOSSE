// variable initialisation
control = 1; // overridden by obj_ctrl_config
mode = 1;
timer = 0;
msg = "";
desc = "";
joy_key = -1;
pad_list[0] = 0;
rect_h = 20;
with obj_ctrl_input enabled = false;

// shut up Feather
old_id = -1;
old_pr = -1;
min_s = 1;
max_s = 1;
select = 1;