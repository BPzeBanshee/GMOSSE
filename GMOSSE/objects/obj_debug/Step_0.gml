rfps_timer += 1;
rfps_avg += max(0,fps_real);
if rfps_timer == 60
    {
    rfps_txt = string(round(rfps_avg/60));
    rfps_avg = 0;
    rfps_timer = 0;
    }

if instance_exists(obj_ctrl_pause) exit;

if instance_exists(obj_ctrl_stage) 
global.step = obj_ctrl_stage.stage_time 
else global.step += 1;