// kill remaining turrets
for (var i=0;i<=2;i+=1) //turret[i]
    {
    for (var j=0;j<=m[i];j+=1) //turret[i,j]
        {
        if instance_exists(turret[i,j])
        then with turret[i,j] instance_destroy();
        }
    }
        
// only play 'big boom' if actually dying
if instance_exists(box) then with box instance_destroy()
else scr_snd_play(snd_exp3,true);

