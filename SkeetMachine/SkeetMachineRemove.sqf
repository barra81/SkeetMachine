private["_obj","_objectID","_objectUID","_dis","_sfx"];





if (dayz_combat == 1) then {
    cutText [format["You are in Combat and cannot build a Skeet-Machine."], "PLAIN DOWN"];
} else {player removeAction s_player_remSkeet;




	player playActionNow "Medic";
	[player,"repair",0,false,10] call dayz_zombieSpeak;
	[player,10,true,(getPosATL player)] spawn player_alertZombies;

	r_interrupt = false;
	r_doLoop = true;

	_finished = false;
	_finishedTime = diag_tickTime+10;

	while {r_doLoop} do {
		if (diag_tickTime >= _finishedTime) then {
			r_doLoop = false;
			_finished = true;
		};
		if (r_interrupt) then {
			r_doLoop = false;
		};
		sleep 0.1;
	};

	if (_finished) then {
_obj = nearestObject [player, "SkeetMachine"];
_objectID = _obj getVariable ["ObjectID", "0"];
_objectUID = _obj getVariable ["ObjectUID", "0"];

_dis=20;
_sfx = "repair";
[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
 
sleep 5;




PVDZE_obj_Delete = [_objectID, _objectUID, player];
publicVariableServer "PVDZE_obj_Delete";
deleteVehicle _obj;


} else {
		r_interrupt = false;
		player switchMove "";
		player playActionNow "stop";
                
                
                
		cutText ["\n\nCanceled destroying SkeetMachine.", "PLAIN DOWN"];
	};
};





















/*

 player removeAction s_player_remSkeet;
 s_player_remSkeet = 0;
_obj = nearestObject [player, "SkeetMachine"];
_objectID = _obj getVariable ["ObjectID", "0"];
_objectUID = _obj getVariable ["ObjectUID", "0"];


player playActionNow "Medic";
sleep 1;
 
_dis=20;
_sfx = "repair";
[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
 
sleep 5;




PVDZE_obj_Delete = [_objectID, _objectUID, player];
publicVariableServer "PVDZE_obj_Delete";
deleteVehicle _obj;

*/