/**********************STAGE COMPLETE HANDLING*************************/
if stage_time > 8500 
&& !instance_exists(obj_boss2)
&& !instance_exists(obj_boss2_dead)
&& !instance_exists(obj_omake2)
&& !obj_ctrl_music.fading_out
then completedelay += 1;
if completedelay == 120 instance_create_layer(x,y,global.lay_en_air,obj_ctrl_clear);

/*****************OBJECT SCROLLING/SPAWN HANDLING**********************/
/*
This is here because the room is larger than the view on the screen,
and as such the view scrolls upwards. The last thing we need is for
the player ship to retain its original position and appear to just
go under and out of the screen. Same thing with bullets and enemies
(unless the enemies are designed to do that, of course).
*/

if yview <= 3000 && spd_y < -1
    {
    scr_camera_spd(0,-1);
	layer_vspeed(l1,-0.99);
	layer_vspeed(l2,-0.99);
    }
if yview <= 680 && spd_y == -1
    {
    scr_camera_spd(0,-0.5);
	
	layer_vspeed(l1,-0.495);
	layer_vspeed(l2,-0.495);
    }
if yview < 1
    {
    scr_camera_spd(0,0);
	layer_vspeed(l1,0.01);
	layer_vspeed(l2,0.01);
    }
    
/* 
Now with that being said we also don't want enemies off-screen to remain
as resource hogs, so for stuff like walls they all get deactivated in
the Room Creation code event (located in rm_stage2 > Settings tab).
This line of code reactivates anything that is deactivated and is
entering our view.
*/
if instance_exists(obj_ctrl_continue) trace("why am I still alive?");
if global.paused exit;
// TODO: deactivating these only once and on scr_unpause() worked in XFR
// let's try that here sometime
instance_deactivate_object(obj_en_wall);
instance_deactivate_object(obj_en_parent);
instance_activate_region(-48,yview-48,368,368,true);


/**********************STAGE TIMELINE HANDLING*************************/
/*
This is the code that controls what happens in the stage, whether it be
enemies, background effects, timing of music or boss initialisation.
*/

stage_time += 1;
switch stage_time
    {
    case 340:
        {
        scr_camera_spd(0,-1);
        layer_vspeed(l1,-0.99);
		layer_vspeed(l2,-0.99);
        break;
        }
    case 460:
        {
        scr_camera_spd(0,-2);
		layer_vspeed(l1,-1.98);
		layer_vspeed(l2,-1.98);
        break;
        }
    case 6000:
        {
        with obj_ctrl_music fade_out(3000);
        break;
        }
    case 6200:
        {
        instance_create_layer(xview,yview,layer,obj_warning);
        break;
        }
    case 6550:
        {
        with obj_ctrl_music event_user(1); // boss music
        break;
        }
    }