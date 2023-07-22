/**********************STAGE COMPLETE HANDLING*************************/
if stage_time > 7650 
&& !instance_exists(obj_boss)
&& !instance_exists(obj_boss_dead)
&& !instance_exists(obj_omake1)
&& !obj_ctrl_music.fading_out
then completedelay += 1;
if completedelay == 120
    {
    instance_create_layer(x,y,global.lay_en_air,obj_ctrl_clear);
    with obj_rock instance_destroy();
    }

/**********************STAGE TIMELINE HANDLING*************************/
// This is the code that controls what happens in the stage, whether it be
// enemies, background effects, timing of music or boss initialisation.

if pop_count >= 26 then global.omake_enabled = true;

stage_time += 1;
switch stage_time
    {
    case 20:
        {
        scr_snd_play(snd_voice1);
        break;
        }
    case 300:
        {
        instance_create_layer(80,16,global.lay_en_air,obj_3Den3);
        instance_create_layer(120,16,global.lay_en_air,obj_3Den3);
        instance_create_layer(160,16,global.lay_en_air,obj_3Den3);
        instance_create_layer(200,16,global.lay_en_air,obj_3Den3);
        instance_create_layer(240,16,global.lay_en_air,obj_3Den3);
        break;
        }
    case 475:
        {
        instance_create_layer(160,-32,global.lay_en_air,obj_en_carrier);
        var planet1 = instance_create_layer(200,-320,global.lay_en_ground,obj_planet1);
        planet1.vspeed = 0.1;
        break;
        }
    case 650:
        {
        var enemy1 = instance_create_layer(160,-32,global.lay_en_air,obj_en1);
        enemy1.vspeed = 1.25;
        break;
        }
    case 700:
        {
        var enemy1r2 = instance_create_layer(80,-32,global.lay_en_air,obj_en1);
        enemy1r2.vspeed = 1.25;
        var enemy1r3 = instance_create_layer(240,-32,global.lay_en_air,obj_en1);
        enemy1r3.vspeed = 1.25;
        break;
        }
    case 900:
        {
        var enemy2 = instance_create_layer(-32,60,global.lay_en_air,obj_en2);
        enemy2.hspeed = 2;
        var enemy3 = instance_create_layer(xview+272,yview+60,global.lay_en_air,obj_3Den1_spawn);
        enemy3.direction = 180;
        break;
        }
    case 1100:
        {
        var enemy3b = instance_create_layer(342,60,global.lay_en_air,obj_en2);
        enemy3b.hspeed = -2;
        break;
        }
    case 1200: // Jumping jack 3D enemies spawn relative to your view position
        {
        var enemy3 = instance_create_layer(xview-32,yview+60,global.lay_en_air,obj_3Den1_spawn);
        enemy3.direction = 0;
        break;
        }
    case 1400:
        {
        instance_create_layer(60,20,global.lay_en_air,obj_3Den3);
        instance_create_layer(80,40,global.lay_en_air,obj_3Den3);
        instance_create_layer(100,60,global.lay_en_air,obj_3Den3);
        instance_create_layer(120,80,global.lay_en_air,obj_3Den3);
        instance_create_layer(200,80,global.lay_en_air,obj_3Den3);
        instance_create_layer(220,60,global.lay_en_air,obj_3Den3);
        instance_create_layer(240,40,global.lay_en_air,obj_3Den3);
        instance_create_layer(260,20,global.lay_en_air,obj_3Den3);
        break;
        }
    case 1600:
        {
        var enemy5 = instance_create_layer(160,-32,global.lay_en_air,obj_3Den2_spawn);
        enemy5.speed = 1.6;
        enemy5.direction = 270;
        break;
        }
    case 1650:
        {
        var pop1 = instance_create_layer(240,-32,global.lay_en_air,obj_en1);
        var pop2 = instance_create_layer(80,-32,global.lay_en_air,obj_en1);
        pop1.vspeed = 1.25;
        pop2.vspeed = 1.25;
        break;
        }
    case 1875:
        {
        var pop1 = instance_create_layer(240,-32,global.lay_en_air,obj_en1);
        var pop2 = instance_create_layer(80,-32,global.lay_en_air,obj_en1);
        pop1.vspeed = 2.5;
        pop2.vspeed = 2.5;
        break;
        }
    case 2100:
        {
        instance_create_layer(160,-32,global.lay_en_air,obj_en_plat);
        break;
        }
    case 2500:
        {
        scr_snd_play(snd_voice4);
        break;
        }
    case 2800:
        {
        instance_create_layer(90,-40,global.lay_en_air,obj_en_plat);
        break;
        }
    case 3200:
        {
        instance_create_layer(230,-40,global.lay_en_air,obj_en_plat);
        break;
        }
    case 3400:
        {
        instance_create_layer(120,40,global.lay_en_air,obj_3Den3);
        instance_create_layer(140,60,global.lay_en_air,obj_3Den3);
        instance_create_layer(160,80,global.lay_en_air,obj_3Den3);
        instance_create_layer(180,60,global.lay_en_air,obj_3Den3);
        instance_create_layer(200,40,global.lay_en_air,obj_3Den3);
        speed = 0;
        direction = 270;
        break;
        }
    case 3700:
        {
        jumper1 = instance_create_layer(xview-32,yview+60,global.lay_en_air,obj_3Den1_spawn);
        jumper2 = instance_create_layer(xview+272,yview+60,global.lay_en_air,obj_3Den1_spawn);
        jumper1.direction = 0;
        jumper2.direction = 180;
        break;
        }
    case 3900: case 3950: 
        {
        if !instance_exists(jumper1) && !en4_spawn1
            {
            var en4a = instance_create_layer(-32,60,global.lay_en_air,obj_en2);
            en4a.hspeed = 2;
            en4_spawn1 = true;
            }
        if !instance_exists(jumper2) && !en4_spawn2
            {
            var en4b = instance_create_layer(342,60,global.lay_en_air,obj_en2);
            en4b.hspeed = -2;
            en4_spawn2 = true;
            }
        //jumper3 = instance_create_layer(xview-32,yview+180,global.lay_en_air,obj_3Den1_spawn);
        //jumper4 = instance_create_layer(xview+272,yview+180,global.lay_en_air,obj_3Den1_spawn);
        //jumper3.direction = 0;
        //jumper4.direction = 180;
        break;
        }
    case 4100:
        {
        instance_create_layer(96,-20,global.lay_en_air,obj_en4);
        instance_create_layer(176,-20,global.lay_en_air,obj_en4);
        instance_create_layer(208,-20,global.lay_en_air,obj_en4);
        instance_create_layer(288,-20,global.lay_en_air,obj_en4);
        break;
        }
    case 4300:
        {
        instance_create_layer(160,-32,global.lay_en_air,obj_en_carrier);
        break;
        }
    case 4450:
        {
        instance_create_layer(50,80,global.lay_en_air,obj_3Den3);
        instance_create_layer(80,60,global.lay_en_air,obj_3Den3);
        instance_create_layer(110,40,global.lay_en_air,obj_3Den3);
        instance_create_layer(140,20,global.lay_en_air,obj_3Den3);
        instance_create_layer(180,20,global.lay_en_air,obj_3Den3);
        instance_create_layer(210,40,global.lay_en_air,obj_3Den3);
        instance_create_layer(240,60,global.lay_en_air,obj_3Den3);
        instance_create_layer(270,80,global.lay_en_air,obj_3Den3);
        break;
        }
    case 4650:
        {
        instance_create_layer(-16,120,global.lay_en_air,obj_en4);
        instance_create_layer(-16,170,global.lay_en_air,obj_en4);
        instance_create_layer(336,120,global.lay_en_air,obj_en4);
        instance_create_layer(336,170,global.lay_en_air,obj_en4);
        break;
        }
    case 5000:
        {
        var enemy5 = instance_create_layer(160,-32,global.lay_en_air,obj_3Den2_spawn);// was x=120
        enemy5.speed = 1.6;
        enemy5.direction = 270;
        /*enemy5b = instance_create_layer(200,-32,global.lay_en_air,obj_3Den2_spawn);
        enemy5b.speed = 1.6;
        enemy5b.direction = 270;*/
        break;
        }
    case 5200:
        {
        instance_create_layer(-22,70,global.lay_en_air,obj_en4);
        instance_create_layer(-22,110,global.lay_en_air,obj_en4);
        instance_create_layer(342,50,global.lay_en_air,obj_en4);
        instance_create_layer(342,90,global.lay_en_air,obj_en4);
        break;
        }
    case 6000:
        {
        with obj_ctrl_music fade_out(0.005);
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
        with obj_rock dead = true;
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
        instance_create_layer(160,340,global.lay_en_ground,obj_boss_trans);
        instance_create_layer(0,340,global.lay_en_ground,obj_orb_trans);
        instance_create_layer(320,340,global.lay_en_ground,obj_orb2_trans);
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
    if atk_timer == 30 then instance_create_layer(120,-32,global.lay_en_air,obj_rock_atk);
    if atk_timer == 60 then instance_create_layer(200,-32,global.lay_en_air,obj_rock_atk);
    if atk_timer == 90 then instance_create_layer(40,-32,global.lay_en_air,obj_rock_atk);
    if atk_timer == 120
        {
        instance_create_layer(280,-32,global.lay_en_air,obj_rock_atk);
        atk_timer = 0;
        }
    }
    
// ****** AESTHETICS ******
if stage_time > 6550 && !instance_exists(obj_omake1)
    {
	var l = layer_get_id("lay_bkg");
	var s = layer_get_vspeed(l);
	if s < 4 then layer_vspeed(l,s+0.1);
    }