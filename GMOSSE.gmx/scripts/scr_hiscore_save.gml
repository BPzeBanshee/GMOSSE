// WRITING TO FILE
if file_exists(argument0) then scr_crypt(argument0,"aLKJDalksjdalKJSDLKAJdLAJLKSDJlKASJdlkaJSDlkjakJLd",0);
scorefile = file_text_open_write(argument0);
for (i=1;i<=10;i+=1)
    {
    file_text_write_real(scorefile,global.hiscore[i]);
    file_text_writeln(scorefile);
    }
for (i=1;i<=10;i+=1)
    {
    file_text_write_string(scorefile,global.namescore[i]);
    file_text_writeln(scorefile);
    }
for (i=1;i<=10;i+=1)
    {
    file_text_write_real(scorefile,global.shipscore[i]);
    file_text_writeln(scorefile);
    }
file_text_close(scorefile);
scr_crypt(argument0,"aLKJDalksjdalKJSDLKAJdLAJLKSDJlKASJdlkaJSDlkjakJLd",0);
