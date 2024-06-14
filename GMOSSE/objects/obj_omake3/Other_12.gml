/// @description  PATTERN 2: TRYING TO BE LIKE XIISTAG ST2 BOSS
atk_timer += 1;
if atk_timer < 30 direction = image_angle else image_angle = direction;
if atk_timer == 30 speed = -2;
if atk_timer > 30 && atk_timer < 90
    {
    speed += 0.1;
    d1 += 0.5;
    d2 -= 0.5;
    }

if atk_timer == 90
    {
    if instance_exists(arm_left) with arm_left event_user(2);
    if instance_exists(arm_right) with arm_right event_user(2);
    speed_max = 2;
    speed = -speed;
    }
if atk_timer > 90
    {
    if d1 > 0 d1 -= 0.5;
    if d2 < 0 d2 += 0.5;
    if speed < speed_max speed += 0.1 else 
        {
        speed = 0;
        speed_max = 0;
        }
    }
if atk_timer == 150
    {
    atk_timer = 0;
    if !instance_exists(arm_left) && !instance_exists(arm_right)
        {
        timer = 0;
        phase = 3;
        }
    }

timer += 1;
if timer == 450
    {
    speed = 0;
    timer = 0;
    atk_timer = 0;
    phase = 1;
    }