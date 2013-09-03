// Dayz Overwatch cleanup script

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
				if !(isNull _x) then {
					_nearby = {isPlayer _x} count (_x nearEntities [["CAManBase"], 400]);
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
				};
			} foreach _objectsX;
			sleep 100;
			
			{
				if !(isNull _x) then {
					_nearby = {isPlayer _x} count (_x nearEntities [["CAManBase"], 400]);
					if ((_nearby == 0)) then 
					{
						deleteVehicle _x;
					};
				};
			} forEach _tmpObjects;
		};
	};
	[] spawn
	{
		waitUntil {!(isNil "sm_done")};

		_lastUpdate = diag_tickTime;
		_lastZombieCheck = diag_tickTime;
		_lastNeedUpdate = diag_tickTime;
		_lastDeadCheck = diag_tickTime;
		_lastFPSCleanup = diag_tickTime;
		_lastItemCheck = diag_tickTime;

		while {true} do {
			if (((diag_tickTime - _lastUpdate) > 300)) then
			{
				_lastUpdate = diag_tickTime;
				private ["_date","_dateNum","_diff","_result","_outcome"];
				_result = "CHILD:307:" call server_hiveReadWrite;
				_outcome = _result select 0;
				if(_outcome == "PASS") then {
					_date = _result select 1; 
					_dateNum = dateToNumber(_date); 
					_diff = ( _dateNum - dateToNumber (date) )*365*24*60;
					if ( abs(_diff)>5 ) then {
						setDate _date;
						dayzSetDate = _date;
						publicVariable "dayzSetDate";
					};
				};
			};
			if ((count needUpdate_objects) > 0 && (diag_tickTime -_lastNeedUpdate>40)) then
			{
				_lastNeedUpdate = diag_tickTime;
				{
					needUpdate_objects = needUpdate_objects - [_x];
					[_x,"all"] call server_updateObject;

				} forEach needUpdate_objects;
			};
			if ((diag_tickTime - _lastDeadCheck) > 60) then {
				_lastDeadCheck = diag_tickTime;
				private ["_modeldex","_myGroupX"];
				
				//Cleanup Dead Bodies
				{
					_modeldex = typeOf _x;
					_myGroupX = group _x;

					_x removeAllMPEventHandlers "mpkilled";
					_x removeAllMPEventHandlers "mphit";
					_x removeAllMPEventHandlers "mprespawn";
					_x removeAllEventHandlers "FiredNear";
					_x removeAllEventHandlers "HandleDamage";
					_x removeAllEventHandlers "Killed";
					_x removeAllEventHandlers "Fired";
					_x removeAllEventHandlers "GetOut";
					_x removeAllEventHandlers "Local";
					clearVehicleInit _x;
					deleteVehicle _x;
					deleteGroup _myGroupX;
					_x = nil;			
				} forEach allDead;
				{
					_myGroupX = group _x;
					_x removeAllMPEventHandlers "mpkilled";
					_x removeAllMPEventHandlers "mphit";
					_x removeAllMPEventHandlers "mprespawn";
					_x removeAllEventHandlers "FiredNear";
					_x removeAllEventHandlers "HandleDamage";
					_x removeAllEventHandlers "Killed";
					_x removeAllEventHandlers "Fired";
					_x removeAllEventHandlers "GetOut";
					_x removeAllEventHandlers "Local";
					clearVehicleInit _x;
					deleteVehicle _x;
					deleteGroup _myGroupX;
					_x = nil;
				} forEach entities "Seagull";
			};
			if ((diag_tickTime - _lastZombieCheck) > 180) then {
				_lastZombieCheck = diag_tickTime;
				{
					if (local _x) then {
						_x enableSimulation false;
						_myGroupX = group _x;
						_x removeAllMPEventHandlers "mpkilled";
						_x removeAllMPEventHandlers "mphit";
						_x removeAllMPEventHandlers "mprespawn";
						_x removeAllEventHandlers "FiredNear";
						_x removeAllEventHandlers "HandleDamage";
						_x removeAllEventHandlers "Killed";
						_x removeAllEventHandlers "Fired";
						_x removeAllEventHandlers "GetOut";
						_x removeAllEventHandlers "Local";
						clearVehicleInit _x;
						deleteVehicle _x;
						deleteGroup _myGroupX;
						_x = nil;
					};
				} forEach allMissionObjects "Animal";

				//Delete Hacker Boxes
				 /*{
					 if (((count ((getWeaponCargo _x) select 1))+(count ((getMagazineCargo _x) select 1))) > 80) then {
						clearVehicleInit _x;
						deleteVehicle _x;
						_x = nil;
					 };
				 } forEach allMissionObjects "All";
				 */

				//Disable Zombie Server Side Simulation
				{
					if (isPlayer _x) then {
						_myGroupX = group _x;
						 _x removeAllMPEventHandlers "mpkilled";
						_x removeAllMPEventHandlers "mphit";
						_x removeAllMPEventHandlers "mprespawn";
						_x removeAllEventHandlers "FiredNear";
						_x removeAllEventHandlers "HandleDamage";
						_x removeAllEventHandlers "Killed";
						_x removeAllEventHandlers "Fired";
						_x removeAllEventHandlers "GetOut";
						_x removeAllEventHandlers "Local";
						clearVehicleInit _x;
						deleteVehicle _x;
						deleteGroup _myGroupX;
						 _x = nil;
					} else {
						_x enableSimulation false;
					};

				} forEach entities "zZombie_Base";
			};
			
			if (((diag_tickTime - _lastItemCheck) > 900)) then
			{
				_lastItemCheck = diag_tickTime;
				private ["_delQty","_keep","_nearby","_myGroupX","_delQtyAnimalR","_delQtyAnimal","_xtypeanimal","_missionObjs","_qty","_animaltype"];

				//Server Cleanup
				_missionObjs = allMissionObjects "ReammoBox";
				_qty = count _missionObjs;
				{
					if ((local _x) or (_qty > 500)) then {
						_keep = _x getVariable ["permaLoot",false];
								_nearby = {isPlayer _x} count (_x nearEntities [["CAManBase"], 100]);
						if ( (!_keep) && (_nearby==0) ) then {
							deleteVehicle _x;
							_x = nil;
						};
					};
				} forEach _missionObjs;

				_animaltype = [];
				{
					_xtypeanimal = typeof _x;
					if(_xtypeanimal=="Rabbit") then {
							  _myGroupX = group _x;
									_x removeAllMPEventHandlers "mpkilled";
									_x removeAllMPEventHandlers "mphit";
									_x removeAllMPEventHandlers "mprespawn";
									_x removeAllEventHandlers "FiredNear";
									_x removeAllEventHandlers "HandleDamage";
									_x removeAllEventHandlers "Killed";
									_x removeAllEventHandlers "Fired";
									_x removeAllEventHandlers "GetOut";
									_x removeAllEventHandlers "Local";
									clearVehicleInit _x; //let's clear all PICs
									deleteVehicle _x;
									deleteGroup _myGroupX;
									_x = nil;
					} else {
						if !(isNull _x) then {
							_nearby = {isPlayer _x} count (_x nearEntities [AllPlayers, 100]);
							
							if (!(_xtypeanimal in _animaltype)) then { _animaltype set [(count _animaltype),(typeOf _x)]; };

							if (_nearby==0) then {
								_myGroupX = group _x;
								_x removeAllMPEventHandlers "mpkilled";
								_x removeAllMPEventHandlers "mphit";
								_x removeAllMPEventHandlers "mprespawn";
								_x removeAllEventHandlers "FiredNear";
								_x removeAllEventHandlers "HandleDamage";
								_x removeAllEventHandlers "Killed";
								_x removeAllEventHandlers "Fired";
								_x removeAllEventHandlers "GetOut";
								_x removeAllEventHandlers "Local";
								clearVehicleInit _x;
								deleteVehicle _x;
								deleteGroup _myGroupX;
								_x = nil;
							};
						};
					};
				} forEach allMissionObjects "Animal";
			};

			if (( diag_fps < 2) and (diag_tickTime-_lastFPSCleanup > 450)) then
			{
				_lastFPSCleanup = diag_tickTime;
				private ["_myGroupX","_missionObjs"];
				//Clean All Dead
				{
					_myGroupX = group _x;
					_x removeAllMPEventHandlers "mpkilled";
					_x removeAllMPEventHandlers "mphit";
					_x removeAllMPEventHandlers "mprespawn";
					_x removeAllEventHandlers "FiredNear";
					_x removeAllEventHandlers "HandleDamage";
					_x removeAllEventHandlers "Killed";
					_x removeAllEventHandlers "Fired";
					_x removeAllEventHandlers "GetOut";
					_x removeAllEventHandlers "Local";
					clearVehicleInit _x;
					deleteVehicle _x;
					deleteGroup _myGroupX;
					_x = nil;
					_myGroupX = nil;
				} forEach allDead;

				//Clean Up All Flies Sounds
				{
					deleteVehicle _x;
					_x = nil;
				} forEach allMissionObjects "Sound_Flies";

				//Clean All Local Zombies
				{
					if (local _x) then {
						_myGroupX = group _x;
						_x removeAllMPEventHandlers "mpkilled";
						_x removeAllMPEventHandlers "mphit";
						_x removeAllMPEventHandlers "mprespawn";
						_x removeAllEventHandlers "FiredNear";
						_x removeAllEventHandlers "HandleDamage";
						_x removeAllEventHandlers "Killed";
						_x removeAllEventHandlers "Fired";
						_x removeAllEventHandlers "GetOut";
						_x removeAllEventHandlers "Local";
						clearVehicleInit _x;
						deleteVehicle _x;
						deleteGroup _myGroupX;
						_x = nil;
						_myGroupX = nil;
					};
				} forEach entities "zZombie_Base";

				//Clean All Animals
				{
					if (local _x) then {
						_myGroupX = group _x;
						_x removeAllMPEventHandlers "mpkilled";
						_x removeAllMPEventHandlers "mphit";
						_x removeAllMPEventHandlers "mprespawn";
						_x removeAllEventHandlers "FiredNear";
						_x removeAllEventHandlers "HandleDamage";
						_x removeAllEventHandlers "Killed";
						_x removeAllEventHandlers "Fired";
						_x removeAllEventHandlers "GetOut";
						_x removeAllEventHandlers "Local";
						clearVehicleInit _x;
						deleteVehicle _x;
						deleteGroup _myGroupX;
						_x = nil;
						_myGroupX = nil;
					};
				} forEach allMissionObjects "Animal";

				_missionObjs = allMissionObjects "ReammoBox";
				{
					deleteVehicle _x;
					_x = nil;
				} forEach _missionObjs;

				//Update Objects
				{
					needUpdate_objects = needUpdate_objects - [_x];
					[_x,"all"] call server_updateObject;

				} forEach needUpdate_objects;
			};

			//Player Groups Cleanup
			{
				if (count units _x==0) then {
					deleteGroup _x;
					_x = nil;
				};
			} forEach allGroups;
			sleep 5;
		};
	};
};