///@desc Resets the global struct that contains player data
function scr_playerdata_reset(){
	for (var i=0;i<2;i++) {
		global.player_data[i] = {
		myctrl: noone,
		myplayer: noone,
		myhitbox: noone,
	
		shipselect: 1,
		optiontype: 1,
		weapontype: 1,
	
		myscore: 0,
		mylives: 3,
		mybombs: 3,
		extends: 0,
		continues: 0
		}
	}
}