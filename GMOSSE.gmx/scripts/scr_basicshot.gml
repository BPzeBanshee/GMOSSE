/*
Basic bullet script for GMOSSE

Original script written by Rozyrg,
rewritten by BPzeBanshee.

Do not rename or delete without checking for usage first.
It's used quite extensively around GMOSSE to reduce
excessive lines of code.

Usage: 
scr_basicshot(origin_x,origin_y,object,speed,direction)
*/

bullet = instance_create(argument0,argument1,argument2);
bullet.speed = argument3;
bullet.direction = argument4;
bullet.image_angle = bullet.direction;
return bullet;
