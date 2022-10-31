/* COMPUSLORY EVENT */
event_inherited();

/* TIMERS */
if lsr_timer > 0 then lsr_timer -= 1;
if bomb_timer > 0 then bomb_timer -= 1;

/* BUTTON 1 - SHOT/MISSILE */
if (global.button1) 
    {
    // shot
    scr_playsnd(snd_xono_shot,0); 
    var shot = scr_basicshot(x,y,layer,obj_xono_shot,20,90+shot_angle);
    shot.image_index = shot_anim;
    
    // anim frame for shot (aesthetics)
    shot_anim += 0.5;
    if shot_anim > 4 then shot_anim = 0;
    
    // angle for shot
    if shot_angle_add == 1 then shot_angle += 1 else shot_angle -= 1;
    if shot_angle > 5 || shot_angle < -5
        {
        shot_angle = 0; 
        shot_angle_add += 1;
        if shot_angle_add > 1 then shot_angle_add = 0;
        }
        
    // laser
    if lsr_timer == 0 && instance_number(obj_xono_laser) < 4
        {
        scr_basicshot(x,y,layer,obj_xono_laser,8,45);//direction+45
        scr_basicshot(x,y,layer,obj_xono_laser,8,135);//direction+135
        scr_basicshot(x,y,layer,obj_xono_laser,8,225);//direction+225
        scr_basicshot(x,y,layer,obj_xono_laser,8,315);//direction+315
        lsr_timer = 30;
        }
    }

/* BUTTON 2 - BOMB */
if (global.button2) && bomb_timer == 0 && global.bombs > 0
    {
    scr_playsnd(snd_exp1,0);
	var _ex;
	for (var i=0;i<360;i+=15)
		{
		_ex = instance_create_layer(x,y,layer,obj_xono_bomb);
		_ex.speed = 6;
		_ex.direction = i;
		}
    //scr_circleshot02(15,x,y,0,obj_xono_bomb,6,false);
    
    bomb_timer = 60;
    global.bombs -= 1;
    }