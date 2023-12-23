/// @desc Takes a string and automatically inserts linebreaks into it after a certain amount of characters.
/// @param {string} text string to automatically linebreak
/// @param {real} maxLength maximum length a line can be before breaking
/// @param {real} maxWordLength maximum length a word can be before the script gives up and starts a new line
/// @returns {string}
function scr_linebreak(text,maxLength,maxWordLength) {
	/*
	Created by Spasman
	spasman@spasmangames.com
	*/
	var insert = 0;
	var go = 0;
	var prev = 0;
	var str = "";
	repeat(string_length(text)) 
	    {
	    if insert > maxLength
	        {
	        while true 
	            {
	            str = string_char_at(text,go-prev);
	            if str != " " then prev += 1 else break;
	            if prev > maxWordLength
	                {
	                prev = 0;
	                break;
	                }
	            }
	        text = string_insert("\n",text,go-prev);
	        insert = 0;
	        }
	    insert += 1;
	    go += 1;
	    if string_char_at(text,go) == "\n" then insert = 0;
	    }
 
	return text;
}