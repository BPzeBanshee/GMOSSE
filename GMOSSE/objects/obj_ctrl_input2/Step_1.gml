event_inherited();
 
var l_sim_running = stagenum > 0
&& !instance_exists(obj_ctrl_clear)
&& !instance_exists(obj_ctrl_gameover)
&& !instance_exists(obj_ctrl_pause);

if l_sim_running
	{
	if replaying
	    {
	    var l_input_value = 0;
		if l_step < ds_list_size(input) l_input_value = input[|l_step];
	    global.jup = (l_input_value & l_inp_up) == l_inp_up;
	    global.jdown = (l_input_value & l_inp_down) == l_inp_down;
	    global.jleft = (l_input_value & l_inp_left) == l_inp_left;
	    global.jright = (l_input_value & l_inp_right) == l_inp_right;
	    global.button1 = (l_input_value & l_inp_b1) == l_inp_b1;
	    global.button2 = (l_input_value & l_inp_b2) == l_inp_b2;
	    global.button3 = (l_input_value & l_inp_b3) == l_inp_b3;
	    l_step += 1;
	    }
	if recording
	    {
	    var l_input_value = 0;
	    if global.jup l_input_value += l_inp_up;
	    if global.jdown l_input_value += l_inp_down;
	    if global.jleft l_input_value += l_inp_left;
	    if global.jright l_input_value += l_inp_right;
	    if global.button1 l_input_value += l_inp_b1;
	    if global.button2 l_input_value += l_inp_b2;
	    if global.button3 l_input_value += l_inp_b3;
	    input[|l_step] = l_input_value;
	    l_step += 1;
	    }
	}