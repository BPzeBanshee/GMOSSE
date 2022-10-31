///scr_unpause()
/*
scr_unpause()

"Unpauses" the game by reactivating everything,
setting the backgrounds back to normal and
deleting the stillscreen image to not be wasteful.
*/
for (var i=0; i<=7; i+=1)
    {
    background_vspeed[i] = global.bkg_vspd[i];
    background_hspeed[i] = global.bkg_hspd[i];
    background_alpha[i] = global.bkg_alpha[i];
    }

if sprite_exists(global.pause_img) then sprite_delete(global.pause_img);
instance_activate_all();

global.paused = 0;
