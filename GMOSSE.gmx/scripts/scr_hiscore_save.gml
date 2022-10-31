///scr_hiscore_save(file)
/*
scr_hiscore_save(), by BPzeBanshee
*/

scorefile = file_text_open_write(argument0);
var c = "aLKJDalksjdalKJSDLKAJdLAJLKSDJlKASJdlkaJSDlkjakJLd";

// Test string
var s = "The quick brown fox jumps over the lazy dog! 0123456789";
file_text_write_string(scorefile,scr_encrypt(s,c)); 
file_text_writeln(scorefile);

// Main Game
for (var i=1; i<=10; i++)
    {
    file_text_write_string(scorefile,scr_encrypt(global.hiscore[i,0],c));
    file_text_writeln(scorefile);
    }
for (var i=1; i<=10; i++) // Level Reached
    {
    file_text_write_string(scorefile,scr_encrypt(string(global.hiscore[i,1]),c));
    file_text_writeln(scorefile);
    }
for (var i=1; i<=10; i++) // Ship Used
    {
    file_text_write_string(scorefile,scr_encrypt(string(global.hiscore[i,2]),c));
    file_text_writeln(scorefile);
    }
for (var i=1; i<=10; i++) // Score
    {
    file_text_write_string(scorefile,scr_encrypt(string(global.hiscore[i,3]),c));
    file_text_writeln(scorefile);
    }

file_text_close(scorefile);
