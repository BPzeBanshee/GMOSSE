/// @description scr_hiscore_load(file)
/// @param file
function scr_hiscore_load(argument0) {
	/*
	scr_hiscore_load(), by BPzeBanshee
	*/
	var a,c;
	c = "aLKJDalksjdalKJSDLKAJdLAJLKSDJlKASJdlkaJSDlkjakJLd";
	a = argument0;
	if !file_exists(a) // If the file isn't there
	    { // give the arrays their own default values
	    // Sets default values for each position in the highscore and name arrays
	    scr_hiscore_reset();
	    scr_hiscore_save(argument0);
	    exit;
	    }
	else // if the file is there, as expected
	    {
	    scorefile = file_text_open_read(argument0);
    
	    // Error checking
	    var str_a,str_b;
	    str_a = "The quick brown fox jumps over the lazy dog! 0123456789";
	    str_b = scr_decrypt(file_text_read_string(scorefile),c);
	    file_text_readln(scorefile);
	    if str_a != str_b
	        {
	        trace("Error loading file, likely corrupted. Resetting "+string(argument0));
	        file_text_close(scorefile);
	        file_rename(argument0,"broke_"+argument0);
	        scr_hiscore_reset();
	        scr_hiscore_save(argument0);
	        return -1;
	        }
    
	    // Normal Mode
	    for (var i=1; i<=10; i++) // Name
	        {
	        global.hiscore[i,0] = scr_decrypt(file_text_read_string(scorefile),c);
	        file_text_readln(scorefile);
	        }
	    for (var i=1; i<=10; i++) // Level Reached
	        {
	        global.hiscore[i,1] = real(scr_decrypt(file_text_read_string(scorefile),c));
	        //global.hiscore[i,1] = file_text_read_real(scorefile);
	        file_text_readln(scorefile);
	        }
	    for (var i=1; i<=10; i++) // Ship Used
	        {
	        global.hiscore[i,2] = real(scr_decrypt(file_text_read_string(scorefile),c));
	        file_text_readln(scorefile);
	        }
	    for (var i=1; i<=10; i++) // Score
	        {
	        global.hiscore[i,3] = real(scr_decrypt(file_text_read_string(scorefile),c));
	        file_text_readln(scorefile);
	        }
	    file_text_close(scorefile);
	    }



}
