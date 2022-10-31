/// @description  Kick off stage clear event
if instance_exists(obj_player)
    {
    with obj_ctrl_music event_user(4); // stage clear music

    p = instance_create_layer(obj_player.x,obj_player.y,global.lay_player,obj_player_clear);
    p.sprite_index = obj_player.sprite_index;
    p.image_angle = obj_player.image_angle;
    p.image_speed = obj_player.image_speed;

    with obj_player instance_destroy();
    with obj_hitbox instance_destroy();
    enabled = 1;
    }
    
// Continue from here only if player is "disposed of"
if !enabled exit;

if bkg_alpha < 1 then bkg_alpha += 0.1;
if timer > 140 && txt_alpha < 1 then txt_alpha += 0.01;

timer += 1;
if timer == 390  
    {
    scr_basicshot(p.x,p.y,global.lay_player,obj_player_clear2,1.25,0);
    scr_basicshot(p.x,p.y,global.lay_player,obj_player_clear2,2,0);
    scr_basicshot(p.x,p.y,global.lay_player,obj_player_clear2,3,0);
    scr_basicshot(p.x,p.y,global.lay_player,obj_player_clear2,4,0);
    scr_basicshot(p.x,p.y,global.lay_player,obj_player_clear2,5,0);
    scr_basicshot(p.x,p.y,global.lay_player,obj_player_clear2,1.25,180);
    scr_basicshot(p.x,p.y,global.lay_player,obj_player_clear2,2,180);
    scr_basicshot(p.x,p.y,global.lay_player,obj_player_clear2,3,180);
    scr_basicshot(p.x,p.y,global.lay_player,obj_player_clear2,4,180);
    scr_basicshot(p.x,p.y,global.lay_player,obj_player_clear2,5,180);
    with obj_player_clear2 image_angle = 0;
    }
        
if timer == 550 
    {
    switch global.level
        {
        case -11:
            {
            scr_trans(rm_omake2,3,c_black,0.025,0.05,210);
            break;
            }
		case -22:
			{
			scr_trans(rm_omake3,3,c_black,0.025,0.05,210);
			break;
			}
        case -1: // Boss 1
            {
            scr_trans(rm_boss2,3,c_black,0.025,0.05,210);
            break;
            }
        case 1: // Stage 1
            {
            scr_trans(rm_stage2,3,c_black,0.025,0.05,210);
            break;
            }
        /*case 2: // Stage 2
            {
            scr_trans(rm_stage3,3,c_black,0.025,0.05,210);
            break;
            }*/
        default: // Test rooms, etc
            {
            instance_create_layer(x,y,layer,obj_ctrl_gameover);
            break;
            }
        }
    }  