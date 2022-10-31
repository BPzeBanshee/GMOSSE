/* |<||_|_3R <|_0\/\/|\| */
// Compulsory (health, z-handling, etc)
enemyHP = 1200; 
event_inherited();
timeout = 1200;
can_damage = 0;

// Enemy behaviour
phase = 0; count = 0;
atk_timer = 0;
thr_timer = 0;
direction = 90;
image_alpha = 0;

with obj_ctrl_music event_user(11);
scr_create_healthbar();

/* */
/*  */
