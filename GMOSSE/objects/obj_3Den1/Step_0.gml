image_angle += z_speed;
speed = 0;

jump_timer -= 1;
if jump_timer == 0
    {
    // time to jump, decide direction
    speed = 1;
    if x > 160 then direction = 180 else direction = 0;
    
    // increment jump count by 1
    jump_count += 1;
    if jump_count == 3 // 3 jumps, timeout to leave 
        {
        jump_timer = -1; 
        speed = 3; 
        direction = 270;
        }
        
    // Create object to do the "jump" and die
    var child = scr_basicshot(x,y,layer,obj_3Den1_alt,speed,direction);
    child.image_angle = image_angle;
    child.enemyHP = enemyHP;
    child.enemyHP_max = enemyHP_max;
    child.jump_count = jump_count;
    child.z_speed = z_speed;
    instance_destroy();
    }

if y > yview+330 then instance_destroy();

