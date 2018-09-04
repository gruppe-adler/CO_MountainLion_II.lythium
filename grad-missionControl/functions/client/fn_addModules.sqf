
waitUntil {!isNull player};
waitUntil {  time > 3 };

{
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

  ["ZEUS HELPERS", "Crawl Music",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [5, 1] remoteExec ["fadeMusic"];
    ["crawl"] remoteExec ["playMusic"];

  }] call Ares_fnc_RegisterCustomModule;



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

  ["ZEUS HELPERS", "Spawn Reinforcement Truck",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    
    [_position] call GRAD_missionControl_fnc_createTruckReinforcements;

  }] call Ares_fnc_RegisterCustomModule;

  ["ZEUS HELPERS", "Spawn Sheep Truck",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

     [_position] call GRAD_herding_fnc_createSheepTruck;

  }] call Ares_fnc_RegisterCustomModule;

  /*
  ["ZEUS HELPERS", "Spawn Barrel Truck",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

     [_position] call GRAD_herding_fnc_createBarrelTruck;

  }] call Ares_fnc_RegisterCustomModule;
  */

  ["ZEUS HELPERS", "Spawn Shepherd",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

     private _group = createGroup civilian;
     private _unit = _group createUnit ["C_Man_1", _position, [], 0, "NONE"];
     [_unit, false] call GRAD_civPartisans_fnc_equip;
     _unit setCombatMode "BLUE";
     _unit setBehaviour "CARELESS";
     _unit setSpeedMode "LIMITED";
     _unit allowFleeing 0;

     [_position, 20, _unit, "Sheep_random_F"] call GRAD_herding_fnc_create;

  }] call Ares_fnc_RegisterCustomModule;

  ["ZEUS HELPERS", "Shepherd Phone",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

     [_objectUnderCursor] call GRAD_herding_fnc_phoneThem;

  }] call Ares_fnc_RegisterCustomModule;


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

  ["ATAKA", "Show List of DIE & SPECTATE Players",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    private _spectatorList = missionNameSpace getVariable ["GRAD_permaChoice_spectatorList", []];
    private _stringify = str _spectatorList;
    ["AllSpectators", [_stringify]] call bis_fnc_showNotification;

  }] call Ares_fnc_RegisterCustomModule;

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

    
    private _count =count (playableUnits + switchableUnits);
    
    // possible chairs
    private _chairs = ["Land_CampingChair_V1_F", _position, _count] call GRAD_missionControl_fnc_createChairCircle;

  }] call Ares_fnc_RegisterCustomModule;

  

};