ready = false; // hook
//choice = 1;

name_location[0] = "";
score_location[0] = "";
ship_used[0] = 0;
lvl[0] = 0;

// Exists mainly for separate hiscore arrays, not yet used in GMOSSE
update_table = function(){
var scores = global.hiscore;
//if choice == 1 scores = global.hiscore_normal
for (var i=1;i<=10;i+=1)
    {
    name_location[i] = string(scores[i,0]);
	lvl[i] = scores[i,1];
    ship_used[i] = scores[i,2];
    score_location[i] = string(scores[i,3]);
    }
}
update_table();