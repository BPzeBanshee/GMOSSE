subimg = 2;
switch mode
{
case 1: 

msg = @"Welcome to the tutorial for GMOSSE!
This tutorial will attempt to cover the basics
that will be required for getting anywhere
in this game.";
break;
    
case 2: 
msg = @"If you don't know what 'GMOSSE' is,
it stands for 'Game Maker Open-Source
Shmup Engine'. It's purpose is to serve
as a template that aspiring Game Maker
developers can use to create their own STG.";
break;

case 3: 
msg = @"If you don't know what a 'shmup' or 'STG' is,
leave now, burn in Hell, 
and leave this program alone.";
break;
    
case 4:
msg = @"With that out of the way, we may begin 
covering the basics of gameplay.
Move around with UP/DOWN/LEFT/RIGHT. 
These are set to the associated buttons
on the keyboard by default.";
break;

case 5:
msg = @"Well done. You can change the 
settings for it via the Options Menu.";
break;

case 6:
msg = @"This would not be a shmup if there 
wasn't shooting. As it happens, we have 
BUTTON 1 (set to Z by default) to fire
bullets at enemies and obstacles. 
Try it out.";
break;

case 7:
msg = @"Well done. By holding it down for 
a bit, you should notice the ship 
repeatedly shooting. This is commonly 
referred to as 'autofire', and most
ships in GMOSSE are built with it in mind.";
break;

case 8:
msg = @"For the moment that is all that
this tutorial will cover. It is quite
WIP at the moment - the full tutorial
will also cover scoring. Goodbye for now.";
break;
    
case 9:
msg = "";
instance_destroy();
break;
}

