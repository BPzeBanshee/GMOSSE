// READING FROM FILE
if !file_exists(argument0) // If the file isn't there
    { // give the arrays their own default values
    // Sets default values for each position in the highscore and name arrays
    show_message("High Score file not found or corrupted. Creating new default file.");
    scr_hiscore_reset();
    scr_hiscore_save(argument0);
    }
else // if the file is there, as expected
    { // see GM's manual for more info on text support - I think external files are Pro-only tho
    scr_crypt(argument0,"aLKJDalksjdalKJSDLKAJdLAJLKSDJlKASJdlkaJSDlkjakJLd",0);
    scorefile = file_text_open_read(argument0);
    for (i=1;i<=10;i+=1)
        {
        global.hiscore[i] = file_text_read_real(scorefile);
        file_text_readln(scorefile);
        }
    for (i=1;i<=10;i+=1)
        {
        global.namescore[i] = file_text_read_string(scorefile);
        file_text_readln(scorefile);
        }
    for (i=1;i<=10;i+=1)
        {
        global.shipscore[i] = file_text_read_real(scorefile);
        file_text_readln(scorefile);
        }
    file_text_close(scorefile);
    scr_crypt(argument0,"aLKJDalksjdalKJSDLKAJdLAJLKSDJlKASJdlkaJSDlkjakJLd",0);
    }
