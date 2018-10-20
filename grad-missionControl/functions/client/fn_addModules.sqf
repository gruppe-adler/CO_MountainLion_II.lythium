
waitUntil {!isNull player};
waitUntil {  time > 3 };

{

  
    _x addEventHandler ["CuratorGroupPlaced", {
        params ["", "_group"];
        ["GRAD_missionControl_setServerAsOwner", [_group]] call CBA_fnc_serverEvent;

        { 
            _x setSkill ["aimingShake", 0.2]; 
            _x setSkill ["aimingSpeed", 0.9]; 
            _x setSkill ["endurance", 0.6]; 
            _x setSkill ["spotDistance", 1]; 
            _x setSkill ["spotTime", 0.9]; 
            _x setSkill ["courage", 1]; 
            _x setSkill ["reloadSpeed", 1]; 
            _x setSkill ["commanding", 1];
            _x setSkill ["general", 1];

            [_x] call GRAD_missionControl_fnc_addApacheDestruction;

        } forEach units _group;
    }];

    _x addEventHandler ["CuratorObjectPlaced", {
        params ["", "_object"];
        

        _object setSkill ["aimingShake", 0.2]; 
        _object setSkill ["aimingSpeed", 0.9]; 
        _object setSkill ["endurance", 0.6]; 
        _object setSkill ["spotDistance", 1]; 
        _object setSkill ["spotTime", 0.9]; 
        _object setSkill ["courage", 1]; 
        _object setSkill ["reloadSpeed", 1]; 
        _object setSkill ["commanding", 1];
        _object setSkill ["general", 1];



        if (_object isKindOf "CAManBase") then {
            if (count units _object == 1) then {
                ["GRAD_missionControl_setServerAsOwner", [group _object]] call CBA_fnc_serverEvent;
                [_object] call GRAD_missionControl_fnc_addApacheDestruction;
            };
        } else {
            if (count crew _object > 1) then {
                ["GRAD_missionControl_setServerAsOwner", [group (crew _object select 0)]] call CBA_fnc_serverEvent;
            };
        };
    }];



  _x addEventHandler ["CuratorWaypointPlaced", {
      params ["_curator", "_group", "_waypointID"];

  if (missionNamespace getVariable ["GRAD_MISSIONCONTROL_ZEUS_AI_CHARGE", false]) then {

        [_group, _waypointID] call GRAD_missionControl_fnc_enableChargeMode;
  };

  }];
} forEach allCurators;


if (  
  isClass (configFile >> "CfgPatches" >> "achilles_modules_f_achilles")
) then
{
  // Note that the line below has to be uncommented if your mission is a Zeus Game Master mission.
  // TODO check if below is necessary to uncomment
  waitUntil {not isNil "ares_category_list"};



  ["ZEUS HELPERS", "Briefing Done",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    BRIEFING_DONE = true; publicVariable "BRIEFING_DONE";

  }] call Ares_fnc_RegisterCustomModule;

  ["ZEUS HELPERS", "openingbook Music",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [5, 1] remoteExec ["fadeMusic"];
    ["openingbook"] remoteExec ["playMusic"];

  }] call Ares_fnc_RegisterCustomModule;

  /*

  ["ZEUS HELPERS", "Spawn Enemy inside Building",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    
    private _nearestBuilding = nearestBuilding _position;
    
    private _group = createGroup east;
    // possible chairs
    {
      private _position = _nearestBuilding buildingPos _forEachIndex;
        if ([_position] call GRAD_missionControl_fnc_isInsideHouse) then {
            private _unit = _group createUnit ["O_Soldier_F", _position, [], 0, "NONE"];
            doStop _unit;
            [_unit, true] call GRAD_civPartisans_fnc_equip;
        };
    } forEach ([_nearestBuilding, 7] call BIS_fnc_buildingPositions);

  }] call Ares_fnc_RegisterCustomModule;

  */
  /*
  ["ZEUS HELPERS", "Spawn Barrel Truck",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

     [_position] call GRAD_herding_fnc_createBarrelTruck;

  }] call Ares_fnc_RegisterCustomModule;
  */

  


  ["ZEUS HELPERS", "Alert enemy AI around here",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [_position] spawn GRAD_missionControl_fnc_alertUnits;

  }] call Ares_fnc_RegisterCustomModule;


  ["ZEUS HELPERS", "Toggle AI Charge",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    private _current = missionNamespace getVariable ["GRAD_MISSIONCONTROL_ZEUS_AI_CHARGE", false];
    missionNamespace setVariable ["GRAD_MISSIONCONTROL_ZEUS_AI_CHARGE", !_current, true];

    hint format ["AI CHARGE: %1", !_current];

  }] call Ares_fnc_RegisterCustomModule;


  ["ZEUS HELPERS", "Outro Music",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [5, 1] remoteExec ["fadeMusic"];
    ["LeadTrack01_F_Curator"] remoteExec ["playMusic"];

  }] call Ares_fnc_RegisterCustomModule;

  ["ML2", "Explosion IED LAB",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    // [cursorObject, 10, false] call GRAD_gas_fnc_explosionServer;
    [ML2_gasTank, 15, true] remoteExec ["GRAD_gas_fnc_explosionServer", 2];

  }] call Ares_fnc_RegisterCustomModule;

  /*
  ["ZEUS HELPERS", "Civ OFF",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    civpresence_module setVariable ["#active", false, true];

  }] call Ares_fnc_RegisterCustomModule;

   ["ZEUS HELPERS", "Civ ON",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    civpresence_module setVariable ["#active", true, true];

  }] call Ares_fnc_RegisterCustomModule;
  */



  /*
  ["ATAKA", "Show List of DIE & SPECTATE Players",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    private _spectatorList = missionNameSpace getVariable ["GRAD_permaChoice_spectatorList", []];
    private _stringify = str _spectatorList;
    ["AllSpectators", [_stringify]] call bis_fnc_showNotification;

  }] call Ares_fnc_RegisterCustomModule;
  */

  ["ATAKA", "Force Respawn everyone here",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    missionNameSpace setVariable ["ATAKA_RespawnPosition", _position, true];
    [] remoteExec ["GRAD_permaChoice_fnc_forceRespawn", [0,-2] select isDedicated, true];

  }] call Ares_fnc_RegisterCustomModule;

  ["ZEUS HELPERS", "Create Chair Circle",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    
    private _count = count (playableUnits + switchableUnits) + 2;
    
    // possible chairs
    private _chairs = ["Land_CampingChair_V1_F", _position, _count] call GRAD_missionControl_fnc_createChairCircle;

  }] call Ares_fnc_RegisterCustomModule;

  

};