///scr_hiscore_save(file)
/*
scr_hiscore_save(), by BPzeBanshee
*/

scorefile = file_text_open_write(argument0);
var c; c = "aLKJDalksjdalKJSDLKAJdLAJLKSDJlKASJdlkaJSDlkjakJLd";

// Test string
var s; s = "The quick brown fox jumps over the lazy dog! 0123456789";
file_text_write_string(scorefile,scr_encrypt(s,c)); 
file_text_writeln(scorefile);

// Main Game
for (i=1;i<=10;i+=1)
    {
    file_text_write_string(scorefile,scr_encrypt(global.hiscore[i,0],c));
    file_text_writeln(scorefile);
    }
for (i=1;i<=10;i+=1) // Level Reached
    {
    file_text_write_string(scorefile,scr_encrypt(string(global.hiscore[i,1]),c));
    file_text_writeln(scorefile);
    }
for (i=1;i<=10;i+=1) // Ship Used
    {
    file_text_write_string(scorefile,scr_encrypt(string(global.hiscore[i,2]),c));
    file_text_writeln(scorefile);
    }
for (i=1;i<=10;i+=1) // Score
    {
    file_text_write_string(scorefile,scr_encrypt(string(global.hiscore[i,3]),c));
    file_text_writeln(scorefile);
    }

file_text_close(scorefile);

if USE_SANDBOX=0
    {
    var a,b; 
    a = program_directory+"\"+argument0;
    b = global.main_dir+"\"+argument0;
    
    //if FS_file_exists(a) then FS_file_delete(a);
    //FS_file_copy(b,a);
    }
