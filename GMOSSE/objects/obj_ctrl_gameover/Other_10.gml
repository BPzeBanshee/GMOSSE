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

//go to highscore   
scr_trans(rm_scores,2,c_black,0.025,0.05,0);