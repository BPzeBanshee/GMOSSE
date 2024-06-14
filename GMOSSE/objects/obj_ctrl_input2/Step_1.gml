event_inherited();

if replaying && stagenum > 0
    {
    if instance_exists(obj_ctrl_clear) 
    || instance_exists(obj_ctrl_gameover)
    || instance_exists(obj_ctrl_pause)
    exit;
    
    var l_input_value = input[|l_step];
    global.jup[0] = round((l_input_value & l_inp_up)==l_inp_up);
    global.jdown[0] = round((l_input_value & l_inp_down)==l_inp_down);
    global.jleft[0] = round((l_input_value & l_inp_left)==l_inp_left);
    global.jright[0] = round((l_input_value & l_inp_right)==l_inp_right);
    global.button1[0] = round((l_input_value & l_inp_b1)==l_inp_b1);
    global.button2[0] = round((l_input_value & l_inp_b2)==l_inp_b2);
    global.button3[0] = round((l_input_value & l_inp_b3)==l_inp_b3);
    
    if l_step < ds_list_size(input)-1
        {
        l_step += 1;
        l_step = round(l_step);
        // logging
        /*if l_input_value > 0 
        then log_str += string(room_get_name(room))+" - "
        +string(l_step)+":"+string(l_input_value)
        +" (x:"+string(obj_player.x)+",y:"+string(obj_player.y)
        +",rng:"+string(random_get_seed())+")"+chr(10);*/
        }
    }
else
    {
    if recording && stagenum > 0
        {
        if !instance_exists(obj_ctrl_clear) && !instance_exists(obj_ctrl_gameover)
        && !instance_exists(obj_ctrl_pause)
            {
            var l_input_value = 0;
            if global.jup[0] l_input_value += l_inp_up;
            if global.jdown[0] l_input_value += l_inp_down;
            if global.jleft[0] l_input_value += l_inp_left;
            if global.jright[0] l_input_value += l_inp_right;
            if global.button1[0] l_input_value += l_inp_b1;
            if global.button2[0] l_input_value += l_inp_b2;
            if global.button3[0] l_input_value += l_inp_b3;
            input[|l_step] = round(l_input_value);
            l_step += 1;
            l_step = round(l_step);
			
            // logging
            /*if l_input_value > 0 then 
            log_str += string(room_get_name(room))+" - "
            +string(l_step)+":"+string(l_input_value)
            +" (x:"+string(obj_player.x)+",y:"+string(obj_player.y)
            +",rng:"+string(random_get_seed())+")"+chr(10);*/
            }
        else
            {
            if !is_string(replay[# stagenum,0])
                {
                replay[# stagenum,0] = ds_list_write(input);
                trace("Writing replay input to list");
                }
            }
        }
    }