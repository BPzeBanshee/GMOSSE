/// @description scr_linebreak(string,maxLength,maxWordLength)
/// @param string
/// @param maxLength
/// @param maxWordLength
function scr_linebreak(text,maxLength,maxWordLength) {
	//Takes a string and automatically inserts linebreaks into it after a certain amount of characters.
	//string = string to automatically linebreak
	//maxLength = maximum length a line can be before breaking
	//maxWordLength = maximum length a word can be before the script gives up and starts a new line
	//Created by Spasman
	//spasman@spasmangames.com
 
	var insert,go,prev,str;
	insert = 0;
	go = 0;
	prev = 0;
	str = "";
	repeat(string_length(text)) 
	    {
	    if insert > maxLength
	        {
	        while(1) 
	            {
	            str = string_char_at(text,go-prev);
	            if str != " " 
	                {
	                prev += 1;
	                }
	            else 
	                {
	                break;
	                }
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