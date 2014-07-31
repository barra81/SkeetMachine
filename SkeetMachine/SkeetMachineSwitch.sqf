player removeAction s_player_startSkeet;
s_player_startSkeet = 0;
_sounddist = 5;  //was 30

          
      _shield1 = nearestObject [player, "SkeetMachine"];
      _PlyDis = player distance _shield1;  
     
     
while{_PlyDis < 40} do {
	
                
        _shield = nearestObject [player, "SkeetMachine"];
      _PlyDis = player distance _shield;  
       [nil,_shield,rSAY,["engine_12s", _sounddist]] call RE;
   

   _PlyDis1 = player distance _shield; 
   _timer = time;

    while {_PlyDis1 < 40 } do {                                                       //an entfernung spieler zu skeetmachine binden?
        _zombies = (getPosATL _shield) nearEntities ["zZombie_Base",35];
        _count = count _zombies;
       
        for "_i" from 0 to (_count -1) do {
            _zombie = _zombies select _i;
            _zombie setdamage 1;
            sleep 0.01;
               };
               if ((time - _timer) > 25) exitwith {};                                //loop was 10
           
};
    
    _soundList = ["PMC_ElectricBlast1","PMC_ElectricBlast2"] call BIS_fnc_selectRandom;
    [nil,_shield,rSAY,[_soundList, _sounddist]] call RE;
    
 };

 
if (_PlyDis > 40) then {  

cutText ["\n\nThe SkeetMachine has stopped!", "PLAIN DOWN"];
};
 