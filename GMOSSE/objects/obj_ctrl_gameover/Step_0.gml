timer += 1;
scroll += 1;
if ready = 0 && !global.button1 
&& pos <= 3 && !global.levelend 
&& !global.button2
then ready = 1;

// Highscore submission
if newscore
    {
    // Flash text vars
    flash += 1;
    if flash > 14 then flash = 0;
    
    // Button press
    if (timer >= 50 && global.button1 && ready)
        { 
        pos += 1;
        if pos == 2 {lt2num = lt1num; letter2 = string(chr(lt2num));}
        if pos == 3 {lt3num = lt2num; letter3 = string(chr(lt3num));}
        ready = 0;
        if pos > 3 then event_user(0); // submit and exit when all letters are pressed
        }

    // input checking
    if (timer >= 20 && global.button2 && pos > 1 && ready) then pos -= 1;

    //up
    if (global.jup && scroll >= 8)
        {
        scroll = 0;
        // limit was 65-90
        if (pos == 1) 
            {
            if lt1num > 35 then lt1num -= 1
            else if lt1num == 35 then lt1num = 90;
            letter1 = string(chr(lt1num));
            }
        if (pos == 2)
            {
            if lt2num > 35 then lt2num -= 1
            else if lt2num == 35 then lt2num = 90;
            letter2 = string(chr(lt2num));
            }
        if (pos == 3)
            {
            if lt3num > 35 then lt3num -= 1
            else if lt3num == 35 then lt3num = 90;
            letter3 = string(chr(lt3num));
            }
        }

    //down
    if (global.jdown && scroll >= 8)
        {
        scroll = 0;
        if (pos == 1) 
            {
            if lt1num < 90 then lt1num += 1
            else if lt1num == 90 then lt1num = 35;
            letter1 = string(chr(lt1num));
            }
        if (pos == 2) 
            {
            if lt2num < 90 then lt2num += 1
            else if lt2num == 90 then lt2num = 35;
            letter2 = string(chr(lt2num));
            }
        if (pos == 3)
            {
            if lt3num < 90 then lt3num += 1
            else if lt3num == 90 then lt3num = 35;
            letter3 = string(chr(lt3num));
            }
        }
    }
else 
    {
    if (timer >= 50 && global.button1 && ready) then event_user(0);
    }


