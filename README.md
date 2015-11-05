# G.M.O.S.S.E #
## The Game Maker Open-Source Shmup Engine ##
###  Created and primarily maintained by BPzeBanshee with contributions from many various members of the community at shmups.system11.org. ###

This game utilizes the FMOD Sound System, copyright Firelight Technologies Pty, Ltd., 1994-2007. 
FMOD Ex API version: 4.23.0

## Controls: ##
* Arrow Keys to move
* SHIFT to slow down
* Z to shoot
* X to bomb
* F2 to reset game
* F4 to go fullscreen, or toggle it in Options Menu
* ENTER to pause, and access Options Menu
* F9 to take a screenshot

## Debug controls: ##
* F12 while in Main Menu room to disable all text besides debug (cause the background's really cool)
* Left/Right while hovered over 'Start Game' to pick stages/boss/test rooms

## FAQ ##

### What the hell is a GMOSSE? What a weird name. ###

GMOSSE is an acronym. It stands for 'Game Maker Open-Source Shmup Engine'.
If you don't know what a shmup is go and look up Raiden Fighters JET on Youtube.

### Okay that's great, what's the point of this? ###

Ah, now you've hit a good question. For a long time now this hasn't been
very clear but I'll try my best to explain it here.

GMOSSE serves to be the leading example of how to create a shmup in Game Maker.
 
A lot of shmups that have been made in recent years haven't been the best, and 
ignore a lot of basic convention such as hitbox size, pattern placement but most 
importantly (in my opinion) functionality. 

GMOSSE will show you how a shmup should be made, with every function a shmup player 
and developer could possibly ask for within the limitations of GM implemented.

Naturally in order to show any of this off it also has to be a fully functional game. 
It is for this reason, and GM's structure, that this isn't another Danmakufu or 
Dezaemon Plus - it's a prebaked shmup engine powered by GM ready for you to edit *directly*. 

### So how are you going about this? You make anything willy nilly? ###

Hell no. Doing that is exactly what has gotten people laughed out of the forum 
to oblivion for ignoring. GMOSSE attempts to follow 3 major principles which I 
follow to the letter and highly recommend every shmup developer to approximately where possible:

**1. GMOSSE serves to perform at 60 FPS at all times**

When this project started it was running at fullspeed on a machine dated from 1997. 
The legacy PC in question had a 1Ghz Pentium III and a 32MB AGP graphics card with 
some 256 MB of RAM or something pathetic. There are notebooks/netbooks that perform 
worse than this machine in some areas though, thus performance on lesser machines 
is a big concern for this project.

**2. GMOSSE serves to provide all the functionality a shmup should have**

This rule mainly focuses on engine functionality, from input replays to hitbox visibility 
and joystick/keyboard configuration and anything a shmup enthusiast could possibly 
want within the limits of GM itself and Rule #1. 

**3. GMOSSE serves to be the typical baseline shmup**

This one's a bit more broad. Basically I'm not going Akashicverse in terms of how 
things are designed. Everything is standardised based on good shmup titles that have 
defined the genre. Controls are standardised, screen size is standardised, everything is. 
This is why the game borrows a lot of design choices not only from Advanced Busterhawk 
Gleylancer but also a lot of games from the 90s including Cave games and also the 
best series in the world, Raiden.

### So is it just you working on this? ###

I'm the main guy but I haven't been the sole contributor. From time to time others have 
contributed in various ways, whether it be via programming something in or providing 
sprites or fonts or testing or just providing good advice.

## Thanks ##
This project makes use of multiple scripts created as examples of 'bullet engines' 
by members of the shmups.system11.org online forum. Specifically this project 
wouldnt've been possible without the members at the "Game Maker oddity" 
topic at Shmups Forums that answered my questions, as well as their programs 
and projects as a result of other's hard work, specifically (in no particular order):

* Kaiser		Invaluable suggestions towards to project, and awesome sprites!
* S20-TBL		contributed heaps regarding attack scripts and bullet behaviour + CONTRA YAGAWACORPS 			EXPLOSHUNS BY MICHAEL BAY!
* GodHand		coded basis of S20-TBL's circle attack scripts
* Alluro	 	posted his spread shot script from Xeno Fighters R, and inspiration for various 			functions. Even Xeno Fighters R in itself was an inspiration
* Rozyrg		contributed a lot towards GMOSSE discussion wise, showed various alternate methods of 			doing things
* worstplayer	helped out tons in original 'TATE in GML (Game Maker)' thread using views/surfaces
* MegaGamer	neat scrolling text engine in Game Maker that I could understand
* iluvfuz 	GMLBuddy helped me tons in getting started
* DrPetter	sfxr (for the neat shmuppy sound effects)
* Nimitz		Excellent joystick support (once I fixed it and added configurable deadzones :P).
* YoyoGames	Cause finding solutions via Google always got results from their forum :D
* Emerald Master	Alternate awesome fonts!
* DJ Incompetent	Tested the game as the sounds got reinternalised
* MathU		Keyboard control customisation advocate, reminded me to get onto adding this function!
* mjclark		Joystick testing with him was very helpful for Development and  inspiration from 			doujins! UNBAN THE MAN NAO!
* Pieterator	Developer of Aero Flux, solution to TATE distortion bug & various helpful advice.
* railslave	Excellent music mod
* trap15		Explosion flicker idea, testing for VirtualBox and WINE
* Parlamat	Paul's Iced Coffee

If I left anyone out please don't kill me, let me know so I'll add you to the list. :D