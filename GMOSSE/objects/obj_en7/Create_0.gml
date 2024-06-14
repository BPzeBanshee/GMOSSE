// Compulsory
enemyHP = 120;//165; // Health
event_inherited();

// Misc. variables
phase = 0;
timer = 0;
thr_timer = 0;
atk_timer = 0;
made = 0;
tur[0] = noone;

// Definable vars
speed = 3.75;

// Turret position updating
update_positions = function(){
p[0,0] = x + lengthdir_x(17,direction-180) + lengthdir_x(7,direction-90);
p[0,1] = y + lengthdir_y(17,direction-180) + lengthdir_y(7,direction-90);

p[1,0] = x + lengthdir_x(17,direction-180) + lengthdir_x(7,direction+90);
p[1,1] = y + lengthdir_y(17,direction-180) + lengthdir_y(7,direction+90);

p[2,0] = x + lengthdir_x(7,direction) + lengthdir_x(7,direction-90);
p[2,1] = y + lengthdir_y(7,direction) + lengthdir_y(7,direction-90);

p[3,0] = x + lengthdir_x(7,direction) + lengthdir_x(7,direction+90);
p[3,1] = y + lengthdir_y(7,direction) + lengthdir_y(7,direction+90);

if made for(var i=0; i<4; i++)
    {
    tur[i].x = p[i,0];
    tur[i].y = p[i,1];
    } 
}
update_positions();