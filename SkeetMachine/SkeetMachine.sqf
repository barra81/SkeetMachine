
private ["_finished","_finishedTime","_posplr","_dirplr","_object"];

_engQTY={_x == "PartEngine"} count magazines player;
_barrelQTY={_x == "ItemFuelBarrel"} count magazines player;
_GenQTY={_x== "ItemGenerator"} count magazines player;
_ppQTY={_x== "30m_plot_kit"} count magazines player;

_engRQD=1;
_barrellRQD=2;
_GenRQD=1;
_ppRQD=1;
/*
if (_engQTY <_engRQD) exitWith{cutText [format["You need 1 Engine to build a Skeet-Machine"], "PLAIN DOWN"];};
if (_barrelQTY <_barrellRQD) exitWith{cutText [format["You need 2 Fuel Barrels to build a Skeet-Machine"], "PLAIN DOWN"];};
if (_GenQTY <_GenRQD) exitWith{cutText [format["You need 1 Generator to build a Skeet-Machine"], "PLAIN DOWN"];};
*/
if (_ppQTY <_ppRQD) exitWith{cutText [format["You need 1 PlotPole to build a Skeet-Machine"], "PLAIN DOWN"];};


if (dayz_combat == 1) then {
    cutText [format["You are in Combat and cannot build a Skeet-Machine."], "PLAIN DOWN"];
} else {player removeAction s_player_buildSkeet;
	player removeMagazine "30m_plot_kit";
       /*
        player removeMagazine "PartEngine";
        player removeMagazine "ItemGenerator";
        player removeMagazine "ItemFuelBarrel";
        player removeMagazine "ItemFuelBarrel";
       */

	player playActionNow "Medic";
	[player,"repair",0,false,10] call dayz_zombieSpeak;
	[player,10,true,(getPosATL player)] spawn player_alertZombies;

	r_interrupt = false;
	r_doLoop = true;

	_finished = false;
	_finishedTime = diag_tickTime+5;

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
                	
                _mypos = getpos player;
                 _dirplr = getDir player;
        
                
       

		_object = "SkeetMachine" createVehicle (position player);  //was _posplr
           
		_object setVariable ["ObjectID", "1", true];
		_object setVariable ["ObjectUID", "1", true];
               
           
             
                _object attachto [player,[0.0,1.0,0.5]];
                sleep 3;
                detach _object;
                player reveal _object;
                
                _object setVariable ["SkeetMachine",1,true]; 
                _object setVariable ["permaLoot",true];
		//_object setVariable ["Sarge",1,true];
            
		
                
                _dir= getDir _object;
                _pos= getPos _object;
                
                
                PVDZE_obj_Publish = [0,_object,[_dir,_pos ],"SkeetMachine"];  // 0 = keine Item Kombo 
                publicVariableServer "PVDZE_obj_Publish";                       


		cutText [format["You've build a Skeet-Machine."], "PLAIN DOWN"];
		sleep 3;
		
	} else {
		r_interrupt = false;
		player switchMove "";
		player playActionNow "stop";
                player addMagazine "30m_plot_kit";
               /*
		player addMagazine "PartEngine";
                player addMagazine "ItemGenerator";
                player addMagazine "ItemFuelBarrel";
                player addMagazine "ItemFuelBarrel";
            */
                
                
		cutText ["\n\nCanceled building a Skeet-Machine.", "PLAIN DOWN"];
	};
};