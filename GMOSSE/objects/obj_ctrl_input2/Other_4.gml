l_step = 0;
l_input_value = 0;

if stagenum == 0 exit;
if replaying
    {
    random_set_seed(replay[# stagenum,1]);
    }
if recording
    {
    replay[# stagenum,0] = 0;
    replay[# stagenum,1] = random_get_seed(); // rng seed
    trace("replay["+string(stagenum)+",2] returning "+string(replay[# stagenum,2]));
    }

