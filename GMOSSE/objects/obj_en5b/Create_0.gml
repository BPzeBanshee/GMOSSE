// This is the health handling.
enemyHP = 20;
event_inherited();

// Misc. variables
if speed == 0 && !path_exists(path_index)
    {
    direction = 270;
    speed = 5;
    }
shot_timer = 0;
thr_timer = 0;
num_of_shots = 5;
mode = 0;