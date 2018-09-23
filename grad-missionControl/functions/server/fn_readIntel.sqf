params ["_object"];

private _intel = _object getVariable ["Intel_Identifier", ""];

if (!(_intel isEqualTo "")) then {
	 [player, ["Diary", ["Intel", _intel]]] remoteExec ["createDiaryRecord", [0,-2] select isDedicated, true];
	 ["IntelFound",["Pashto Writing","Intel found"]] remoteExec ["BIS_fnc_showNotification", [0,-2] select isDedicated, false];
	 private _currentIntelFound = missionNamespace getVariable ["ML_intelFound", 0];
     private _currentIntelCount = missionNamespace getVariable ["ML_intelCount", 0];
     missionNamespace setVariable ["ML_intelFound", _currentIntelFound + 1, true];

     diag_log format ["intel found. %1 intel out there, %2 found", _currentIntelCount, _currentIntelFound];
} else {
	hint "nothing found";
};