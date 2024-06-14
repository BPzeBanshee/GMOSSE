// Aesthetics
image_angle = direction;

// Attack phases + entry and exit
switch mode
    {
    case 0: 
        { // Intro
        speed -= 0.05; 
        if speed < 0.05
            {
            speed = 0;
            mode += 1;
            } 
        break;
        }
    case 1:
        {
        // Attack pattern
		var target = instance_nearest(x,y,obj_hitbox);
		var angle = 270;
		if target != noone angle = point_direction(x,y,target.x,target.y);
        scr_turntoangle(angle,2);
        shot_timer += 1;
        if shot_timer == 180
            {
            scr_basicshot(x,y,global.lay_bullets,obj_bullet3,3.5,direction); //4
            scr_snd_play(snd_en_shot4,true);
            shot_timer = 0;
            num_of_shots -= 1;
            }
            
        // Timeout/Get the fuck out of the wall's way
        if num_of_shots == 0
        || collision_point(x,y-64,obj_wall,0,0)
        mode = 2;
        break;
        }
    case 2:
        { // Timeout
        scr_turntoangle(270,2);
        if direction == 270 speed += 0.05;
        if y > yview+320+sprite_height instance_destroy();
        break;
        }
    }
    
// AESTHETICS //
var x1,y1,x2,y2;
x1 = x+lengthdir_x(8,direction+90)+lengthdir_x(14,direction+180); // left thruster (top-left of sprite)
y1 = y+lengthdir_y(8,direction+90)+lengthdir_y(14,direction+180);
x2 = x+lengthdir_x(8,direction+270)+lengthdir_x(14,direction+180); // right thruster (bottom-left of sprite)
y2 = y+lengthdir_y(8,direction+270)+lengthdir_y(14,direction+180);

thr_timer += 1;
if thr_timer == 5
    {
    scr_basicshot(x1,y1,layer,obj_en5_thr,3,direction+180);
    scr_basicshot(x2,y2,layer,obj_en5_thr,3,direction+180);
    thr_timer = 0;
    }