if (global.jup || global.jdown || global.jleft || global.jright) 
&& !global.button2
then moving = 1
else moving = 0;

if (global.jup && global.jdown) 
|| (global.jleft && global.jright) 
then moving = 0;

if global.button2 && !hook
    {
    program = !program;
    hook = 1;
    }
if !global.button2 then hook = 0;

if program = 1 then moving = 2;

event_user(1);

