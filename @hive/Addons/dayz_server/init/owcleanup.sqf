if (isServer) then {
	[] spawn {
		while {true} do {
			sleep 200;
			_objects1 = (allMissionObjects "ReammoBox");
			_objects2 = (allMissionObjects "Sound_Flies");
			_objects3 = (allMissionObjects "Land_Fire_DZ");
			_objectsX = _objects1 + _objects2 + _objects3 + alldead;
			
			_tmpObjects = [];
			{
				_nearby = {isPlayer _x} count (_x nearEntities [["CAManBase"], 500]);
				_keep = _x getVariable ["permaLoot",false];
				if ((_nearby == 0) && (!_keep) && !(_x in alldead)) then 
				{
					_tmpObjects = _tmpObjects + [_x];
				};
				_nearby = {isPlayer _x} count (_x nearEntities [["CAManBase"], 250]);
				if ((_nearby == 0) && (_x in alldead) && (_x isKindOf "zZombie_Base")) then 
				{
					deleteVehicle _x;
				};
			} foreach _objectsX;
			sleep 100;
			
			{
				_nearby = {isPlayer _x} count (_x nearEntities [["CAManBase"], 500]);
				_keep = _x getVariable ["permaLoot",false];
				if ((_nearby == 0) && (!_keep) && !(_x in alldead)) then 
				{
					deleteVehicle _x;
				};
			} forEach _tmpObjects;
		};
	};
};