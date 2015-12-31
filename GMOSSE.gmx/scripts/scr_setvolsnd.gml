/* SET VOLUME FOR GENERIC SOUNDS */
audio_sound_gain(snd_click,0.9*global.sfx_volume,0);

//if sfx_normal_loaded = 1
//    {
    // Sounds
    audio_sound_gain(snd_1up,global.sfx_volume,0);
    audio_sound_gain(snd_exp1,global.sfx_volume,0);
    audio_sound_gain(snd_exp2,global.sfx_volume,0);
    audio_sound_gain(snd_exp3,global.sfx_volume,0);
    audio_sound_gain(snd_en_shot1,global.sfx_volume,0);
    audio_sound_gain(snd_en_shot2,global.sfx_volume,0);
    audio_sound_gain(snd_en_shot3,global.sfx_volume,0);
    audio_sound_gain(snd_en_shot4,global.sfx_volume,0);

    // Voices
    audio_sound_gain(snd_voice1,global.voice_volume,0);
    audio_sound_gain(snd_voice2,global.voice_volume,0);
    audio_sound_gain(snd_voice3,global.voice_volume,0);
    audio_sound_gain(snd_voice4,global.voice_volume,0);
//    }
/* 
Why don't I use sound_global_volume?
Differentiation between voices and sounds of course! 
*/

/* SHIP-SPECIFIC SOUND VOLUME HANDLING */
audio_sound_gain(snd_xono_shot,0.15 * global.sfx_volume,0);
audio_sound_gain(snd_war_shot1,0.4 * global.sfx_volume,0);
audio_sound_gain(snd_war_shot2,0.4 * global.sfx_volume,0);
audio_sound_gain(snd_war_bomb,1 * global.sfx_volume,0);
audio_sound_gain(snd_bh_mainshot,0.8 * global.sfx_volume,0);
audio_sound_gain(snd_bh_shot1,0.85 * global.sfx_volume,0);
audio_sound_gain(snd_bh_shot2,0.9 * global.sfx_volume,0);
audio_sound_gain(snd_bh_shot3,0.9 * global.sfx_volume,0);
audio_sound_gain(snd_bh_shothit,0.9 * global.sfx_volume,0);
audio_sound_gain(snd_sf_shot,0.78 * global.sfx_volume,0); //0.8
audio_sound_gain(snd_sf_shothit,0.75 * global.sfx_volume,0); //0.78
audio_sound_gain(snd_sf_laser,0.78 * global.sfx_volume,0); //0.9
audio_sound_gain(snd_arx_shot1,0.76 * global.sfx_volume,0);
audio_sound_gain(snd_arx_shot2,0.81 * global.sfx_volume,0);
audio_sound_gain(snd_arx_shothit,0.78 * global.sfx_volume,0);
//if sfx_player_loaded != 0 then 
/*switch global.shipselect
    {
    case 1: // Xonochrome
        {
        audio_sound_gain(snd_xono_shot,0.74 * global.sfx_volume,0);
        break;
        }
    case 2: // Iron Warbird
        {
        audio_sound_gain(snd_war_shot1,0.77 * global.sfx_volume,0);
        audio_sound_gain(snd_war_shot2,0.77 * global.sfx_volume,0);
        audio_sound_gain(snd_war_bomb,1 * global.sfx_volume,0);
        break;
        }
    case 3: // Busterhawk
        {
        audio_sound_gain(snd_bh_mainshot,0.8 * global.sfx_volume,0);
        audio_sound_gain(snd_bh_shot1,0.85 * global.sfx_volume,0);
        audio_sound_gain(snd_bh_shot2,0.9 * global.sfx_volume,0);
        audio_sound_gain(snd_bh_shot3,0.9 * global.sfx_volume,0);
        audio_sound_gain(snd_bh_shothit,0.9 * global.sfx_volume,0);
        break;
        }
    case 4: // Swordfish
        {
        audio_sound_gain(snd_sf_shot,0.78 * global.sfx_volume,0); //0.8
        audio_sound_gain(snd_sf_shothit,0.75 * global.sfx_volume,0); //0.78
        audio_sound_gain(snd_sf_laser,0.78 * global.sfx_volume,0); //0.9
        break;
        }
    case 5: // Arxyne
        {
        audio_sound_gain(snd_arx_shot1,0.76 * global.sfx_volume,0);
        audio_sound_gain(snd_arx_shot2,0.81 * global.sfx_volume,0);
        audio_sound_gain(snd_arx_shothit,0.78 * global.sfx_volume,0);
        break;
        }
    }
