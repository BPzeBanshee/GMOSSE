function string_with_env(full_str){
	var parsed_str,str_start,str_end,str_to_replace,new_str;
	parsed_str = full_str;
	while string_count("%",parsed_str) > 0
		{
		// Get start and end positions of %env% string
		str_start = string_pos_ext("%",parsed_str,0);
		str_end = string_pos_ext("%",parsed_str,str_start);
		
		// if not an %env%/multiple of 2, just get the end of the string
		if str_end == 0
			{
			str_to_replace = string_copy(parsed_str,str_start,1);
			new_str = "";
			}
		else
			{
			//show_message("str_start: "+string(str_start)+", str_end: "+string(str_end));
		
			// finally, start replacing string
			str_to_replace = string_copy(parsed_str,str_start,str_end - (str_start-1));
			//show_message("str_to_replace: "+str_to_replace);
			new_str = environment_get_variable(string_replace_all(str_to_replace,"%",""));
			}
		//show_message("new_str: "+new_str);
		parsed_str = string_replace(parsed_str,str_to_replace,new_str);
		}
	return parsed_str;
}