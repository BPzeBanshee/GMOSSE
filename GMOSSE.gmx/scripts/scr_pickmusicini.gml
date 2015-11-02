load_name=get_open_filename('.ini|*.ini*|','');
if not(load_name == '')//only load if there was a file chosen
    {
    if filename_ext(load_name)=".ini"//check the extension
        {
        global.music_ini = string_replace(load_name,string(working_directory)+"\","");//if it has the extension then open it
        }
    else
        {
        global.music_ini = string_replace(load_name,string(working_directory)+"\","")+".ini";//if they forgot the ext, add it on and open the file
        }
    }
