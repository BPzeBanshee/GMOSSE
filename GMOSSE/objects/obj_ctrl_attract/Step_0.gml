// With obj_ctrl_input effectively disabled we need a way to go back to main menu
// with button inputs, this will do for now until obj_ctrl_input is properly refactored
if (keyboard_check(global.keycode_button1)) event_user(15);
if global.joy_id[0] >= 0
    {
    if (gamepad_button_check(global.joy_id[0],global.joy1)) event_user(15);
    }
    
// The magic replay code!
if room != rm_menu 
&& !instance_exists(obj_ctrl_clear) 
&& !instance_exists(obj_ctrl_gameover) 
&& !instance_exists(obj_trans)
    {
    if l_step < ds_list_size(input)-1
        {
        var l_input_value = input[|l_step];
        global.jup[0] = ((l_input_value & l_inp_up)==l_inp_up);
        global.jdown[0] = ((l_input_value & l_inp_down)==l_inp_down);
        global.jleft[0] = ((l_input_value & l_inp_left)==l_inp_left);
        global.jright[0] = ((l_input_value & l_inp_right)==l_inp_right);
        global.button1[0] = ((l_input_value & l_inp_b1)==l_inp_b1);
        global.button2[0] = ((l_input_value & l_inp_b2)==l_inp_b2);
        global.button3[0] = ((l_input_value & l_inp_b3)==l_inp_b3);
        l_step += 1;
        // placeholder line for logging if necessary
        }
    else timer += 1;
    if timer >= 120 event_user(15);
    }

