// kill remaining turrets
for (var yy=0;yy<3;yy++)
    {
    for (var xx=0;xx<2;xx++)
        {
        if instance_exists(turret[xx,yy])
        then with turret[xx,yy] instance_destroy();
        }
    }
        
// only play 'big boom' if actually dying
if instance_exists(box) then with box instance_destroy()
else scr_snd_play(snd_exp3,true);