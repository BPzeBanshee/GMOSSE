///scr_unpause()
/*
scr_unpause()

"Unpauses" the game by reactivating everything,
setting the backgrounds back to normal and
deleting the stillscreen image to not be wasteful.
*/
for (i=0; i<=7; i+=1)
    {
    background_vspeed[i] = bkg_vspd[i];
    background_hspeed[i] = bkg_hspd[i];
    background_alpha[i] = bkg_alpha[i];
    }

if sprite_exists(pause_img) then sprite_delete(pause_img);
instance_activate_all();
