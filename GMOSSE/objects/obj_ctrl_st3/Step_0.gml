/**********************STAGE COMPLETE HANDLING*************************/
if stage_time > 12000 
&& !instance_exists(obj_boss3)
//&& !instance_exists(obj_boss3_dead)
&& !instance_exists(obj_omake3)
&& !obj_ctrl_music.fading_out
then completedelay += 1;
if completedelay == 120
    {
    with obj_rain instance_destroy();
    with obj_cloud instance_destroy();
    with obj_light_gen instance_destroy();
    instance_create_layer(x,y,global.lay_en_air,obj_ctrl_clear);
    }

/**********************STAGE TIMELINE HANDLING*************************/
/*
This is the code that controls what happens in the stage, whether it be
enemies, background effects, timing of music or boss initialisation.
*/

stage_time += 1;
switch stage_time
    {
	//case 60: stage_time = start; break;
    case 120:
        {
        instance_create_layer(160,-64,global.lay_en_air,obj_en_carrier);
        break;
        }
    case 220:
        {
        instance_create_layer(100,-32,global.lay_en_air,obj_en5b);
        instance_create_layer(220,-32,global.lay_en_air,obj_en5b);
        break;
        }
    case 380:
        {
        var e1=instance_create_layer(80,-64,global.lay_en_air,obj_en7);
        e1.direction = 280;
        var e2=instance_create_layer(240,-64,global.lay_en_air,obj_en7);
        e2.direction = 260;
        //instance_create_layer(xview,yview,layer,obj_warning);
        break;
        }
    case 750:
        {
        var e=instance_create_layer(160,-200,global.lay_en_ground,obj_en_cruiser);
        e.p[4,2] = obj_en_tur2;
        e.p[5,2] = obj_en_tur2;
        e.spawner_en[3] = obj_en4;
        break;
        }
    case 2200:
        {
        var e=instance_create_layer(395,-100,global.lay_en_ground,obj_en_cruiser);
        e.hscroll=1;
        break;
        }
        
    case 4800:
        {
        with obj_ctrl_music fade_out(0.005);
        break;
        }
    case 5000:
        {
        instance_create_layer(xview,yview,layer,obj_warning); // different warning type
        break;
        }
    case 5350:
        {
        instance_create_layer(160,-240,global.lay_en_air,obj_boss3);
        with obj_ctrl_music event_user(2); // boss music
        break;
        }
    }
    
/* --- BACKGROUND STUFF --- */    
    
/* STAGE 3 SPACE PHASE */
var l = global.lay_bkg;
var lh = layer_get_hspeed(l);
if stage_time > 2200 && stage_time < 2400
    {
    if lh > -1 then layer_hspeed(l,lh - 0.01);
    }
if stage_time > 2400 && stage_time < 2600
    {
    if lh < 0 then layer_hspeed(l,lh + 0.01);
    }
    
/* STAGE 3 CLOUD PHASE */
// slow down to over planet Earth
if stage_time == start then instance_create_layer(160,yview-160,global.lay_en_ground,obj_planet3);
if stage_time > start && stage_time < start+200
    {
	var lv = layer_get_vspeed(l);
    if lv > 0 then layer_vspeed(l,lv - 0.015);
    }
    
if stage_time > start+200 && stage_time < start+900
    {
    // do some zoom code here of earth, followed by a fade to color
    with obj_planet3
        {
        image_xscale += 0.002;
        image_yscale += 0.002;
        }
        
    if stage_time == start+400
        {
		instance_create_layer(0,0,global.lay_en_air,obj_st3_bluefade);
        }
    }
    
if stage_time == start+900
    {
	with obj_st3_bluefade on = false;
	
    with obj_planet3 instance_destroy();
    
    // set up cloud layers, init lightning bkg code
    instance_create_layer(0,0,global.lay_en_ground,obj_light_gen);
	
	var l2 = global.lay_bkg;
	var lb = layer_background_get_id(l2);
	layer_background_sprite(lb,bkg_cloud);
	layer_background_visible(lb,true);
	layer_background_alpha(lb,0);
	layer_x(l2,40);
	layer_vspeed(l2,1);
    
    instance_create_layer(32,-48,global.lay_en_ground,obj_cloud);
    instance_create_layer(128,352,global.lay_en_ground,obj_cloud);
    instance_create_layer(288,160,global.lay_en_ground,obj_cloud);
	
    var xx,yy,dd,ss,ra;
    repeat 15
        {
        xx = random(320);
        yy = random(320);
        dd = random_range(260,280);
        ss = random_range(7,12);
        ra = scr_basicshot(xx,yy,global.lay_en_ground,obj_rain,ss,dd);
        //ra.depth = random_range(0,1500);
        ra.image_alpha = 0;
        }
    }
if stage_time > start+900 && stage_time < finish
    {
	var lb = layer_background_get_id(global.lay_bkg);//layer_get_id("lay_bkg"));
	var la = layer_background_get_alpha(lb);
	if la < 1 then layer_background_alpha(lb,la+0.005);
    with obj_rain 
		{
		if image_alpha < 1 then image_alpha += 0.005;
		}
    }