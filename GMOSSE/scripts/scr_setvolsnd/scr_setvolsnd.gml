/// @description scr_setvolsnd()
function scr_setvolsnd() {

	// First, get a decimal value to work with based on global setting
	var vol = round(global.sfx_volume)/100;
	var vol2 = round(global.voice_volume/100);

	// Set most of the sounds to begin with
	audio_group_set_gain(audiogroup_default,vol,0);
	
	// Then the voice-specific ones...
	audio_sound_gain(snd_voice1,vol2,0);
	audio_sound_gain(snd_voice2,vol2,0);
	audio_sound_gain(snd_voice3,vol2,0);
	audio_sound_gain(snd_voice4,vol2,0);
	audio_sound_gain(snd_pain,vol2,0);

	// Then some sound-specific ones...
	audio_sound_gain(snd_click,0.9 * vol,0);
	audio_sound_gain(snd_en_shot3,0.75 * vol,0);

	// Especially for the player ships...
	audio_sound_gain(snd_xono_shot,0.15 * vol,0);
	audio_sound_gain(snd_war_shot1,0.4 * vol,0);
	audio_sound_gain(snd_war_shot2,0.4 * vol,0);
	audio_sound_gain(snd_war_bomb,1 * vol,0);
	audio_sound_gain(snd_bh_mainshot,0.25 * vol,0);
	audio_sound_gain(snd_bh_shot1,0.25 * vol,0);
	audio_sound_gain(snd_bh_shot2,0.25 * vol,0);
	audio_sound_gain(snd_bh_shot3,0.25 * vol,0);
	audio_sound_gain(snd_bh_shothit,0.2 * vol,0);
	audio_sound_gain(snd_sf_shot,0.2 * vol,0);
	audio_sound_gain(snd_sf_shothit,0.2 * vol,0);
	audio_sound_gain(snd_sf_laser,0.2 * vol,0);
	audio_sound_gain(snd_arx_shot1,0.2 * vol,0);
	audio_sound_gain(snd_arx_shot2,0.2 * vol,0);
	audio_sound_gain(snd_arx_shothit,0.2 * vol,0);
	// And done!
}