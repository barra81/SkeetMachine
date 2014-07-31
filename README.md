SkeetMachine
============


The SkeetMachine is a player buildable ZombieShield.

the recipelist is :

1 30m_plot_kit
1 PartEngine
1 ItemGenerator
2 ItemFuelBarrel


Since you have at least the 30m_plot_kit at your inventory, the scroll menu will show you the "Build SkeetMachine" option.

After the SkeetMachine is build, it have two buttons "Start SkeetMachine" and "Destroy SkeetMachine"

If the SkeetMachine is started it will kill all Zombies in a 50m radius, the SkeetMachine will stop when the activating player
leaves the 50m radius.



HOW TO INSTALL:

copy the SkeetMachine folder into yourmissionfile.pbo


____________________________________________________________________________________________________________________________

in your fn_selfactions.sqf

ADD


//------------------------------SkeetMachine-------------------------------------------
///////////Build
_itemsPlayer = items player;
_mags = magazines player;
_hasStuff = "ItemToolbox" in _itemsPlayer;
_hasPPole = "30m_plot_kit" in _mags;
if (_canDo && (speed player <= 1) && _hasStuff && _hasPPole) then {
	if (s_player_buildSkeet < 0) then {
		s_player_buildSkeet = player addaction[("<t color=""#FFFF00"">" + ("Build SkeetMachine") +"</t>"),"external\SkeetMachine.sqf","",5,false,true,"", ""];
	};
} else {
	player removeAction s_player_buildSkeet;
	s_player_buildSkeet = -1;
};
////////Switches/Removes
_allowedDistance2 = 2;

if (!isNull cursorTarget and !_inVehicle and !_isPZombie and (player distance cursorTarget < _allowedDistance2) and _canDo) then {
if((speed player <= 1) && (_typeOfCursorTarget == "SkeetMachine")) then {
	if (s_player_startSkeet < 0)  then {
		s_player_startSkeet = player addaction [("<t color=""#FFFF00"">" + ("Start SkeetMachine") +"</t>"),"SkeetMachine\SkeetMachineSwitch.sqf","",5,false,true,"",""];  
	};
} else {
	player removeAction s_player_startSkeet;
	s_player_startSkeet = -1;
};
 
if((speed player <= 1) && (_typeOfCursorTarget == "SkeetMachine")) then {
	if ( s_player_remSkeet < 0) then {
		s_player_remSkeet = player addaction[("<t color=""#FFFF00"">" + ("Destroy SkeetMachine") +"</t>"),"SkeetMachine\SkeetMachineRemove.sqf","",5,false,true,"", ""];
	};
} else {
	player removeAction s_player_remSkeet;
	s_player_remSkeet = -1;
};

} else {
	player removeAction s_player_startSkeet;
	s_player_startSkeet = -1;
	player removeAction s_player_remSkeet;
	s_player_remSkeet = -1;
};
//--------------------------SkeetMachine END------------------------------------------------



ABOVE


//Start Generator




_____________________________________________________________________________________________________________________

in the variables.sqf


ADD



"SkeetMachine"




to the following arrays:



dayz_reveal =

dayz_allowedObjects =

dayz_maintainObjects =


