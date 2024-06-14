/// @description  PATTERN 1: WAVE FORMATION
// Reposition if necessary
if x != 160 || y != yview+65 step_towards_point(160,yview+65,0.5);//mp_linear_step(160,yview+65,0.5,0);

timer += 1;
if timer < 180
    {
    // Handle arm directions
    if !b d1 += 1 else d1 -= 1;
    if d1 > 30 b = true;
    if d1 < -30 b = false;
    d2 = -d1;

    // Attack timing
    atk_timer += 1;
    if atk_timer == 8
        {
        if instance_exists(arm_right) with arm_right event_user(1);
        if instance_exists(arm_left) with arm_left event_user(1);
        if instance_exists(arm_right) || instance_exists(arm_left)
        scr_snd_play(snd_en_shot1,true);
        atk_timer = 0;
        }
    }
else
    {
    if d1 > 0 d1 -= 1 else d1 += 1;
    d2 = -d1;
    // Decide when to go to next pattern
    if d1 == 0
        {
        timer = 0;
        atk_timer = 0;
        phase = 2;
        }
    }
    
if !instance_exists(arm_left) && !instance_exists(arm_right)
    {
    timer = 0;
    atk_timer = 0;
    phase = 3;
    }