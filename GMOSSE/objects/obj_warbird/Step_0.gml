// Compulsory
event_inherited();

// Timers
if shot_timer > 0 shot_timer -= 1;
if shot2_timer > 0 shot2_timer -= 1;
if bomb_timer > 0 bomb_timer -= 1;
if time_passed < 180 time_passed += 1;

var side = myctrl.side;
var b1 = global.button1[side];
var b2 = global.button2[side];

// Main Shot
if b1 && shot_timer == 0
    {
    scr_snd_play(snd_war_shot1,true);
	var s;
    s[0] = scr_basicshot(x-4,y,layer,obj_warbird_shot,20,90);
    s[1] = scr_basicshot(x+4,y,layer,obj_warbird_shot,20,90);
    s[2] = scr_basicshot(x-10,y,layer,obj_warbird_shot,20,96);
    s[3] = scr_basicshot(x+10,y,layer,obj_warbird_shot,20,84);
	for (var i=0;i<4;i++) s[i].myctrl = myctrl;
    shot_timer = 5;
    }
    
// Secondary Shot (lasers)
if b1 && shot2_timer == 0    
    {
    if instance_number(obj_warbird_laser) < limit
        {
        scr_snd_play(snd_war_shot2,true);
		var l;
        l[0] = scr_basicshot(x-10,y+4,layer,obj_warbird_laser,9,91);
        l[1] = scr_basicshot(x+10,y+4,layer,obj_warbird_laser,9,89);
		for (var i=0;i<2;i++) l[i].myctrl = myctrl;
        shot2_timer = 8;
        }
    }
    
// Bomb Deployment
if b2 && bomb_timer == 0 && bombs > 0
    {
    bombs -= 1;
    bomb_timer = 320;
    var b = instance_create_layer(x,y,layer,obj_warbird_bomb);
	b.myctrl = myctrl;
    scr_snd_play(snd_war_bomb);
    }
    
// Thruster
var t = instance_create_depth(x,y+8,depth+1,obj_en5_thr);
t.speed = 4;
t.direction = 270;