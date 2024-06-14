// COMPUSLORY EVENT
event_inherited();
if !instance_exists(myhitbox) exit;
var side = myctrl.side;
var b1 = global.button1[side];
var b2 = global.button2[side];

// TIMERS
if lsr_timer > 0 lsr_timer -= 1;
if bomb_timer > 0 bomb_timer -= 1;

// BUTTON 1 - SHOT/MISSILE
if (b1) 
    {
    // shot
    scr_snd_play(snd_xono_shot); 
    var shot = scr_basicshot(x,y,layer,obj_xono_shot,20,90+shot_angle);
    shot.image_index = shot_anim;
	shot.myctrl = myctrl;
    
    // anim frame for shot (aesthetics)
    shot_anim += 0.5;
    if shot_anim > 4 shot_anim = 0;
    
    // angle for shot
    if shot_angle_add == 1 shot_angle += 1 else shot_angle -= 1;
    if shot_angle > 5 || shot_angle < -5
        {
        shot_angle = 0; 
        shot_angle_add += 1;
        if shot_angle_add > 1 shot_angle_add = 0;
        }
        
    // laser
    if lsr_timer == 0 && instance_number(obj_xono_laser) < (4 * instance_number(obj_player))
        {
		var b[];
        b[0] = scr_basicshot(x,y,layer,obj_xono_laser,8,45);//direction+45
        b[1] = scr_basicshot(x,y,layer,obj_xono_laser,8,135);//direction+135
        b[2] = scr_basicshot(x,y,layer,obj_xono_laser,8,225);//direction+225
        b[3] = scr_basicshot(x,y,layer,obj_xono_laser,8,315);//direction+315
		for (var s=0;s<=3;s++) b[s].myctrl = myctrl;
        lsr_timer = 30;
        }
    }

// BUTTON 2 - BOMB
if (b2) && bomb_timer == 0 && bombs > 0
    {
    scr_snd_play(snd_exp1);
	var _ex;
	for (var i=0;i<360;i+=15)
		{
		_ex = instance_create_layer(x,y,layer,obj_xono_bomb);
		_ex.speed = 6;
		_ex.direction = i;
		_ex.myctrl = myctrl;
		}
    //scr_circleshot02(15,x,y,0,obj_xono_bomb,6,false);
    bomb_timer = 60;
    bombs -= 1;
    }