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
        replay[# 0,2] = global.xonospr; 
        replay[# 0,3] = global.arxynespr;
        replay[# 0,4] = global.optiontype;
        replay[# 0,5] = global.weapontype;
        stagenum = 1;
        trace("replay[# 0,1] set to "+string(replay[# 0,1]));
        }
    else stagenum += 1;
    replay[# stagenum,2] = global.shipselect;
    replay[# stagenum,3] = global.lives_stored;
    replay[# stagenum,4] = global.score_stored;
    replay[# stagenum,5] = global.bombs_stored;
    
    if instance_exists(obj_ctrl_gameover)
        {
        replay[# 0,0] = global.myscore;
        trace("replay[# 0,0] set to score "+string(global.myscore));
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
        if global.myscore != replay[# 0,0] then
        show_message("DESYNC FAILED! replay[#0,0] did not match score "+string(global.myscore));
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
            global.shipselect = replay[# stagenum,2];
            global.extend_number = 1;
            global.continues = 0;
            global.optiontype = replay[# 0,4];
            global.weapontype = replay[# 0,5];
            }
        else stagenum += 1;
        global.lives_stored = replay[# stagenum,3];
        global.score_stored = replay[# stagenum,4];
        global.bombs_stored = replay[# stagenum,5];
        ds_list_read(input,replay[# stagenum,0]);
        if ds_list_size(input)>0 then trace("loading from replay grid to list successful.");
        }
    }

