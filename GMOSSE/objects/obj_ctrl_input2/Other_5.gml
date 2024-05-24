if recording == 1
    {
    if global.nextroom == -1
        {
        recording = 0;
        stagenum = 0;
        ds_grid_clear(replay,0);
        ds_list_clear(input);
        }
    //trace("global.nextroom = "+string(global.nextroom)+", global.startstage = "+string(global.startstage));
    if global.nextroom == global.startstage
        {
        trace("replay[# 0,0] thru [# 0,5] being set");
        replay[# 0,0] = 1;
        replay[# 0,1] = room_get_name(global.startstage); // starting room
		
        replay[# 0,2] = sprite_get_name(object_get_sprite(obj_xono));
        replay[# 0,3] = sprite_get_name(object_get_sprite(obj_arxyne));
		
        replay[# 0,4] = global.optiontype[global.myside];
        replay[# 0,5] = global.weapontype[global.myside];
        stagenum = 1;
        trace("replay[# 0,1] set to "+string(replay[# 0,1]));
        }
    else stagenum += 1;
    replay[# stagenum,2] = global.shipselect[global.myside];
    replay[# stagenum,3] = global.lives_stored[global.myside];
    replay[# stagenum,4] = global.score_stored[global.myside];
    replay[# stagenum,5] = global.bombs_stored[global.myside];
    
    if instance_exists(obj_ctrl_gameover)
        {
        replay[# 0,0] = obj_ctrl_game.myscore;
        trace("replay[# 0,0] set to score "+string(replay[# 0,0]));
        event_user(2);
        recording = 0;
        }
    if global.nextroom == rm_menu
        {
        recording = 0;
        stagenum = 0;
        ds_grid_clear(replay,0);
        ds_list_clear(input);
        }
    }

if replaying == 1
    {
    if instance_exists(obj_ctrl_gameover)
        {
        replaying = 0;
		var s = obj_ctrl_game.myscore;
        if s != replay[# 0,0] then
        show_message("DESYNC FAILED! replay[#0,0] did not match score "+string(s));
        //clipboard_set_text(sha1_string_utf8(log_str)+chr(10)+log_str);
        //log_str = "";
        stagenum = 0;
        ds_grid_clear(replay,0);
        ds_list_clear(input);
        }
    else 
        {
        if global.nextroom == global.startstage
            {
            stagenum = 1;
            global.shipselect[global.myside] = replay[# stagenum,2];
            global.extend_number[global.myside] = 1;
            global.continues[global.myside] = 0;
            global.optiontype[global.myside] = replay[# 0,4];
            global.weapontype[global.myside] = replay[# 0,5];
            }
        else stagenum += 1;
        global.lives_stored[0] = replay[# stagenum,3];
        global.score_stored[0] = replay[# stagenum,4];
        global.bombs_stored[0] = replay[# stagenum,5];
        ds_list_read(input,replay[# stagenum,0]);
        if ds_list_size(input)>0 then trace("loading from replay grid to list successful.");
        }
    }

