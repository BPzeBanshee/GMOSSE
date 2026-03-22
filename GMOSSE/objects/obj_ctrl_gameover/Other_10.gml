ready = false;

if newscore && !hassaved
    {
    name = letter1 + letter2 + letter3;
    scr_hiscore_update(name,
						global.level,
						global.player_data.shipselect,
						global.player_data.myscore);
    scr_hiscore_save("score.gmes");
    hassaved = true;
    } 

//go to main menu  
scr_trans(rm_menu,2,c_white,0.025,0.05,0);