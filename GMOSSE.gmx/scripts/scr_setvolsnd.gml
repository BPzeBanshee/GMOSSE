///scr_setvolsnd()
/* SET VOLUME FOR GENERIC SOUNDS */
var vol;
vol = round(global.sfx_volume)/100;
audio_sound_gain(snd_click,0.9*vol,0);

// Sounds
audio_sound_gain(snd_1up,vol,0);
audio_sound_gain(snd_exp1,vol,0);
audio_sound_gain(snd_exp2,vol,0);
audio_sound_gain(snd_exp3,vol,0);
audio_sound_gain(snd_en_shot1,vol,0);
audio_sound_gain(snd_en_shot2,vol,0);
audio_sound_gain(snd_en_shot3,vol,0);
audio_sound_gain(snd_en_shot4,vol,0);

// Voices
audio_sound_gain(snd_voice1,vol,0);
audio_sound_gain(snd_voice2,vol,0);
audio_sound_gain(snd_voice3,vol,0);
audio_sound_gain(snd_voice4,vol,0);

/* 
Why don't I use sound_global_volume?
Differentiation between voices and sounds of course! 
*/

/* SHIP-SPECIFIC SOUND VOLUME HANDLING */
audio_sound_gain(snd_xono_shot,0.15 * vol,0);
audio_sound_gain(snd_war_shot1,0.4 * vol,0);
audio_sound_gain(snd_war_shot2,0.4 * vol,0);
audio_sound_gain(snd_war_bomb,1 * vol,0);
audio_sound_gain(snd_bh_mainshot,0.25 * vol,0);
audio_sound_gain(snd_bh_shot1,0.25 * vol,0);
audio_sound_gain(snd_bh_shot2,0.25 * vol,0);
audio_sound_gain(snd_bh_shot3,0.25 * vol,0);
audio_sound_gain(snd_bh_shothit,0.25 * vol,0);
audio_sound_gain(snd_sf_shot,0.2 * vol,0);
audio_sound_gain(snd_sf_shothit,0.2 * vol,0);
audio_sound_gain(snd_sf_laser,0.2 * vol,0);
audio_sound_gain(snd_arx_shot1,0.2 * vol,0);
audio_sound_gain(snd_arx_shot2,0.2 * vol,0);
audio_sound_gain(snd_arx_shothit,0.2 * vol,0);
