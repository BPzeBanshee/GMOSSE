/**********************STAGE COMPLETE HANDLING*************************/
if stage_time > 7650 
&& !instance_exists(obj_boss)
&& !instance_exists(obj_boss_dead)
&& !instance_exists(obj_omake1)
&& !obj_ctrl_music.fading_out
completedelay += 1;
if completedelay == 120
    {
	instance_destroy(obj_rock);
    instance_create_layer(x,y,global.lay_en_air,obj_ctrl_clear);
    }

// **********************STAGE TIMELINE HANDLING*************************
// This is the code that controls what happens in the stage, whether it be
// enemies, background effects, timing of music or boss initialisation.

stage_time += 1;

switch stage_time
    {
    case 20:
        {
        scr_snd_play(snd_voice1);
        stage_time = 5100;
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
        var en1 = instance_create_layer(80,-30,global.lay_en_air,obj_en1);
        en1.vspeed = 1;
        with obj_ctrl_music event_user(1); // boss music
        break;
        }
    case 6610:
        {
        var en2 = instance_create_layer(160,-30,global.lay_en_air,obj_en1);
        en2.vspeed = 1;
        break;
        }
    case 6670:
        {
        var en3 = instance_create_layer(240,-30,global.lay_en_air,obj_en1);
        en3.vspeed = 1;
        break;
        }
    case 6790:
        {
        var sideenemy = instance_create_layer(-40,40,global.lay_en_air,obj_en2);
        sideenemy.hspeed = 1.5;
        var sideenemy2 = instance_create_layer(360,40,global.lay_en_air,obj_en2);
        sideenemy2.hspeed = -1.5;
        break;
        }
    case 6890:
        {
        instance_create_layer(160,-32,global.lay_en_air,obj_en_carrier);
        break;
        }
    case 7100:
        {
        instance_create_layer(160,340,global.lay_en_air,obj_boss_trans);
        instance_create_layer(0,340,global.lay_en_air,obj_orb_trans);
        instance_create_layer(320,340,global.lay_en_air,obj_orb2_trans);
        break;
        }
    case 7550:
        {
        instance_create_layer(160,-32,global.lay_en_air,obj_boss);
        break;
        }
    }
    
// CODE FOR ASTEROIDS
if (stage_time > 2650 && stage_time < 3200) 
|| (stage_time > 5400 && stage_time < 6500)
    {
    atk_timer += 1;
    if atk_timer == 30 instance_create_layer(120,-32,global.lay_en_air,obj_rock_atk);
    if atk_timer == 60 instance_create_layer(200,-32,global.lay_en_air,obj_rock_atk);
    if atk_timer == 90 instance_create_layer(40,-32,global.lay_en_air,obj_rock_atk);
    if atk_timer == 120
        {
        instance_create_layer(280,-32,global.lay_en_air,obj_rock_atk);
        atk_timer = 0;
        }
    }
    
// ****** AESTHETICS ******
if stage_time > 6550 && !instance_exists(obj_omake1)
    {
	var l = global.lay_bkg;//layer_get_id("lay_bkg");
	var s = layer_get_vspeed(l);
	if s < 4 layer_vspeed(l,s+0.1);
    }