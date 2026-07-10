///@desc Loads a highscore table from a file in the save directory.
function scr_hiscore_load() {
	/*
	scr_hiscore_load(), by BPzeBanshee
	*/
	var c = "aLKJDalksjdalKJSDLKAJdLAJLKSDJlKASJdlkaJSDlkjakJLd";
	var file_name = game_save_id+SCORE_STR;
	if !file_exists(file_name) // If the file isn't there
	    {
	    // Sets default values for each position in the highscore and name arrays
	    scr_hiscore_reset();
	    exit;
	    }
	else // if the file is there, as expected
	    {
	    var scorefile = file_text_open_read(file_name);
    
	    // Error checking
	    var str_a = "The quick brown fox jumps over the lazy dog! 0123456789";
	    var str_b = scr_decrypt(file_text_read_string(scorefile),c);
	    file_text_readln(scorefile);
	    if str_a != str_b
	        {
	        trace("Error loading file, likely corrupted. Resetting "+SCORE_STR);
	        file_text_close(scorefile);
	        file_rename(file_name,string_replace(file_name,SCORE_STR,"broke_"+SCORE_STR));
	        scr_hiscore_reset();
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