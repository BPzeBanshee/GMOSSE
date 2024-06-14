/// @desc Kick off stage clear event
var coop_play = instance_number(obj_ctrl_game) == 2 ? true : false;
if !enabled
    {
    with obj_ctrl_music event_user(4); // stage clear music
	
	// retrieve instance ids, store bomb value for next level
	if coop_play
		{
		for (var i=0;i<2;i++) 
			{
			p[i] = global.player_data[i].myplayer;
			p[i].disabled = true;
			global.player_data[i].mybombs = p[i].bombs;
			}
		}
	else
		{
		var myplayer = global.player_data[0].myplayer;
		global.player_data[0].mybombs = myplayer.bombs;
		}

	// get rid of real ones
    instance_destroy(obj_hitbox);
    enabled = true;
    }
    
// Continue from here only if player is "disposed of"
if !enabled exit;

// Set x/y positions for players to move to
var xx;
if coop_play
	{
	xx[0] = -40; xx[1] = 40;
	}
else
	{
	xx[0] = 0; xx[1] = 0;
	}
for (var i=0;i<2;i++)
	{
	with p[i] step_towards_point(xview+120+xx[i],yview+160,1);
	}

if bkg_alpha < 1 bkg_alpha += 0.1;
if timer > 140 && txt_alpha < 1 txt_alpha += 0.01;

timer += 1;
if timer == 390  
    {
	var c,o;
	for (var i=0;i<2;i++)
		{
		if instance_exists(p[i])
			{
			// create ship effects
		    c[0] = scr_basicshot(p[i].x,p[i].y,global.lay_player,obj_player_clear2,1.25,0);
		    c[1] = scr_basicshot(p[i].x,p[i].y,global.lay_player,obj_player_clear2,2,0);
		    c[2] = scr_basicshot(p[i].x,p[i].y,global.lay_player,obj_player_clear2,3,0);
		    c[3] = scr_basicshot(p[i].x,p[i].y,global.lay_player,obj_player_clear2,4,0);
		    c[4] = scr_basicshot(p[i].x,p[i].y,global.lay_player,obj_player_clear2,5,0);
		    c[5] = scr_basicshot(p[i].x,p[i].y,global.lay_player,obj_player_clear2,1.25,180);
		    c[6] = scr_basicshot(p[i].x,p[i].y,global.lay_player,obj_player_clear2,2,180);
		    c[7] = scr_basicshot(p[i].x,p[i].y,global.lay_player,obj_player_clear2,3,180);
		    c[8] = scr_basicshot(p[i].x,p[i].y,global.lay_player,obj_player_clear2,4,180);
		    c[9] = scr_basicshot(p[i].x,p[i].y,global.lay_player,obj_player_clear2,5,180);
			
			// assign outline sprite index to ship effects
			switch global.player_data[i].shipselect
				{
				case 1: o = spr_xono_out; break;
			    case 2: o = spr_warbird_out; break;
			    case 3: o = spr_bh_out; break;
			    case 4: o = spr_trident_out; break;
			    case 5: o = spr_arxyne_out; break;
				}
			for (var j=0; j<=9; j++) 
				{
				c[j].sprite_index = o;
				c[j].image_angle = 0;
				}
			}
		}
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
        case 2: // Stage 2
            {
            scr_trans(rm_stage3,3,c_black,0.025,0.05,210);
            break;
            }
        default: // Test rooms, etc
            {
            instance_create_layer(x,y,layer,obj_ctrl_gameover);
            break;
            }
        }
    }  