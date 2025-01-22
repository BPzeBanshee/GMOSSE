///@desc Resets the global struct that contains player data
function scr_playerdata_reset(){
	global.player_data = {
		shipselect: 1,
		optiontype: 1,
		weapontype: 1,
	
		myscore: 0,
		mylives: 3,
		mybombs: -1,
		extends: 0,
		continues: 0,
		hud_side: 0
		}
	}