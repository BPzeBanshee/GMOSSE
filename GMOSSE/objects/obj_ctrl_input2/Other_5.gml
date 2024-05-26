if recording
    {
    if global.nextroom == -1
        {
        recording = false;
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
		
		// TODO: better way?
        replay[# 0,2] = sprite_get_name(object_get_sprite(obj_xono));
        replay[# 0,3] = sprite_get_name(object_get_sprite(obj_arxyne));
		
        replay[# 0,4] = global.player_data[global.myside].optiontype;
        replay[# 0,5] = global.player_data[global.myside].weapontype;
        stagenum = 1;
        trace("replay[# 0,1] set to "+string(replay[# 0,1]));
        }
    else stagenum += 1;
    replay[# stagenum,2] = global.player_data[global.myside].shipselect;
    replay[# stagenum,3] = global.player_data[global.myside].mylives;
    replay[# stagenum,4] = global.player_data[global.myside].myscore;
    replay[# stagenum,5] = global.player_data[global.myside].mybombs;
    
    if instance_exists(obj_ctrl_gameover)
        {
        replay[# 0,0] = global.player_data[global.myside].myscore;
        trace("replay[# 0,0] set to score "+string(replay[# 0,0]));
        event_user(2);
        recording = false;
        }
    if global.nextroom == rm_menu
        {
        recording = true;
        stagenum = 0;
        ds_grid_clear(replay,0);
        ds_list_clear(input);
        }
    }

if replaying == true
    {
    if instance_exists(obj_ctrl_gameover)
        {
        replaying = false;
		var s = global.player_data[global.myside].myscore;
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
            global.player_data[global.myside].shipselect = replay[# stagenum,2];
            global.player_data[global.myside].extend_number = 1;
            global.player_data[global.myside].continues = 0;
            global.player_data[global.myside].optiontype = replay[# 0,4];
            global.player_data[global.myside].weapontype = replay[# 0,5];
            }
        else stagenum += 1;
        global.player_data[global.myside].mylives = replay[# stagenum,3];
        global.player_data[global.myside].myscore = replay[# stagenum,4];
        global.player_data[global.myside].mybombs = replay[# stagenum,5];
        ds_list_read(input,replay[# stagenum,0]);
        if ds_list_size(input)>0 then trace("loading from replay grid to list successful.");
        }
    }