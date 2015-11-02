// Usage: scr_loadmusicini(inilocation,sectionofini)
if file_exists(argument0) && global.music_info[1] != "NONE" // if the file exists
    {
    ini_open(argument0); // open the file
    if ini_section_exists(argument1)
        {
        global.music_info[5] = ini_read_string(argument1,"Title",""); // reads title
        global.music_info[6] = ini_read_string(argument1,"Game",""); // reads game of origin/album
        global.music_info[7] = ini_read_string(argument1,"Artist",""); // reads artist/composer
        ini_close();
        return 0;
        }
    else
        {
        ini_close();
        show_message("Music Error: Couldn't find section");
        return -1;
        }
    }
else
    {
    return 666;
    }
