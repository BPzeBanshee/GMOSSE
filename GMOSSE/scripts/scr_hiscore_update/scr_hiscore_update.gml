/// @description scr_hiscore_update(name,stage,shipused,score)
/// @param name
/// @param stage
/// @param shipused
/// @param score
function scr_hiscore_update(argument0, argument1, argument2, argument3) {
	// SETTING SCORES
	var p,n,l,sh,sc;
	n = string(argument0);
	l = argument1;
	sh = argument2;
	sc = argument3;//global.myscore;

	for (var i=10;i>0;i-=1) // see GM's manual for details on for-loops
	    {
	    if sc > global.hiscore[i,3] // if score is more than the current array value
	        {
	        global.hiscore[i+1,0] = global.hiscore[i,0]; // name
	        global.hiscore[i+1,1] = global.hiscore[i,1]; // stage
	        global.hiscore[i+1,2] = global.hiscore[i,2]; // ship used
	        global.hiscore[i+1,3] = global.hiscore[i,3]; // score
	        p = i;
	        }
	    }
	if sc > global.hiscore[9,3] // if your score is more than the bottom highscore value
	    {
	    global.hiscore[p,0] = n; // name
	    global.hiscore[p,1] = l; // stage
	    global.hiscore[p,2] = sh; // ship used
	    global.hiscore[p,3] = sc; // score
	    }



}
