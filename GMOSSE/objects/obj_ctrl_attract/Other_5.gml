if global.nextroom == rm_menu then exit;
event_user(0); // Load global player ship select variables
var stagenum = choose(1,2,3); // see Create re: ds_map data, this is a hack
/*switch global.nextroom
    {
    case rm_stage1: stagenum = 1; break;
    case rm_stage2: stagenum = 2; break;
    case rm_stage3: stagenum = 3; break;
    case rm_boss1: stagenum = 6; break;
    case rm_boss2: stagenum = 7; break;
    }*/
ds_list_read(input,replay[#stagenum,0]);