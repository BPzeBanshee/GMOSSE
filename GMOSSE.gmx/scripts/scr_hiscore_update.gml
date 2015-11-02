// SETTING SCORES
// adds your score to the arrays and sorts the table of values
// Note that only the external file method will allow for sprite-based display
// of what ship you used. This is because GM's default highscore system does not
// allow for any variables other than the name and score in the system - in more
// technical terms it is a two-dimensional array, whereas the external method
// uses three *separate* one-dimensional arrays.
// NOTE2: Must be used by obj_ctrl_gameover

for (i=10;i>0;i-=1) // see GM's manual for details on for-loops
    {
    if score > global.hiscore[i] // if score is more than the current array value
        {
        global.hiscore[i + 1] = global.hiscore[i]; // places value in next position down
        global.namescore[i + 1] = global.namescore[i]; // same as above, for name array
        global.shipscore[i + 1] = global.shipscore[i]; 
        // same as above, for ship array, note that default highscore only uses name and score
        // so adding a shiptype as a separate array is useless and will cause issues.
        position = i; // sets variable position to whatever i is at the moment
        }
    }
if score > global.hiscore[9] // if your score is more than the bottom highscore value
    {
    global.hiscore[position] = argument0;//score; // stores score in appropriate highscore section
    global.namescore[position] = argument1;//name; // asks for name
    global.shipscore[position] = argument2;//global.shipselect;
    // code for whatever ship you're using
    }
