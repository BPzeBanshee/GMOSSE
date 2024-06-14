// Get inputs
var up = global.jup[0];
var down = global.jdown[0];
var b1 = global.button1[0];
var b2 = global.button2[0];

timer += 1;
scroll += 1;
if !ready && !b1 
&& pos <= 3 && !global.levelend 
&& !b2
then ready = true;

// Highscore submission
if newscore
    {
    // Flash text vars
    flash += 1;
    if flash > 14 flash = 0;
    
    // Button press
    if (timer >= 50 && b1 && ready)
        { 
        pos += 1;
        if pos == 2 {lt2num = lt1num; letter2 = string(chr(lt2num));}
        if pos == 3 {lt3num = lt2num; letter3 = string(chr(lt3num));}
        ready = false;
        if pos > 3 event_user(0); // submit and exit when all letters are pressed
        }

    // input checking
    if (timer >= 20 && b2 && pos > 1 && ready) pos -= 1;

    //up
    if (up && scroll >= 8)
        {
        scroll = 0;
        // limit was 65-90
        if (pos == 1) 
            {
            if lt1num > 35 lt1num -= 1
            else if lt1num == 35 lt1num = 90;
            letter1 = string(chr(lt1num));
            }
        if (pos == 2)
            {
            if lt2num > 35 lt2num -= 1
            else if lt2num == 35 lt2num = 90;
            letter2 = string(chr(lt2num));
            }
        if (pos == 3)
            {
            if lt3num > 35 lt3num -= 1
            else if lt3num == 35 lt3num = 90;
            letter3 = string(chr(lt3num));
            }
        }

    //down
    if (down && scroll >= 8)
        {
        scroll = 0;
        if (pos == 1) 
            {
            if lt1num < 90 lt1num += 1
            else if lt1num == 90 lt1num = 35;
            letter1 = string(chr(lt1num));
            }
        if (pos == 2) 
            {
            if lt2num < 90 lt2num += 1
            else if lt2num == 90 lt2num = 35;
            letter2 = string(chr(lt2num));
            }
        if (pos == 3)
            {
            if lt3num < 90 lt3num += 1
            else if lt3num == 90 lt3num = 35;
            letter3 = string(chr(lt3num));
            }
        }
    }
else 
    {
    if (timer >= 50 && b1 && ready) event_user(0);
    }