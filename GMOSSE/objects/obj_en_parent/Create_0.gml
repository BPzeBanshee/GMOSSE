/*
Heirarchy structure of enemies - 13/1/16

Simple diagram as follows:

obj_en_parent-----///-----obj_en_wall
     /\
    /  \
   /    \
  /      \
 /        \
air    ground

*en_parent* will handle initialisation of 
variables and handle things present in all enemies
(health management, flash on low health, etc).
Nothing else. If you want an enemy that you can 
collide with, without being dragged by the camera,
use this.

en_air will be dragged with camera to be in screen 
space in rooms larger than the view, this is the
old behaviour of obj_en_parent in previous releases.
For making simple objects that remain with the
screen use this.

*en_ground* will set can_collide to 0 on its Creation.
can_damage remains 1, which in effect will mean
you can fly over it and not die. For making ground
enemies use this, but beware it lives in absolute
world space and will not stay with the screen.

*en_wall* is its own object, and does not inherit
from obj_en_parent. This saves on collision event
checks and won't trip homing objects or anything
that iterates through enemies. This is
the sole exception to the branch.
*/
z = 128;
flash_hit = 0;
flash_low = 0;
hit_by_player = noone;
enemyHP_last = enemyHP;
enemyHP_max = enemyHP;
can_collide = true;
can_damage = true;
myctrl = instance_find(obj_ctrl_game,0);