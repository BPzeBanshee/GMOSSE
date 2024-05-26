// kill remaining turrets
for (var yy=0;yy<3;yy++)
    {
    for (var xx=0;xx<2;xx++)
        {
        if instance_exists(turret[xx,yy])
        then instance_destroy(turret[xx,yy]);
        }
    }
        
// only play 'big boom' if actually dying
if instance_exists(box) 
then instance_destroy(box)
else scr_snd_play(snd_exp3,true);