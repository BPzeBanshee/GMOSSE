ready = 0;

if newscore && !hassaved
    {
    name = letter1+letter2+letter3;
    scr_hiscore_update(name,global.level,global.shipselect,global.myscore);
    scr_hiscore_save("score.gmes");
    hassaved = 1;
    } 

//go to highscore   
scr_trans(rm_scores,2,c_black,0.025,0.05,0);

