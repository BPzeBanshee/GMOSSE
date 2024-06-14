/* STAGE TIMELINE */
stage_time += 1;
switch stage_time
    {
    case 120:
        {
        instance_create_layer(x,y,layer,obj_textbox);
        break;
        }
    }
    
if stage_time > 120 
&& !instance_exists(obj_textbox)
&& !instance_exists(obj_trans) 
scr_trans(rm_stage1,3,c_black,0.025,0.05,210);