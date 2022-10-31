// This changes the orb from its current form to its death object which handles things such
// as bonuses to chains and score. This event is called by its parent object, which all enemy
// objects share: obj_enemytarget.
instance_create_layer(x,y,layer,obj_boss_dead);
scr_addscore(100000,180,1);
instance_destroy();