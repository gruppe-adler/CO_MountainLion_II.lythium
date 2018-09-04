params ["_object"];

private _intel = _object getVariable ["Intel_Identifier", ""];

if (!(_intel isEqualTo "")) then {
	 [player, ["Diary", ["Intel", _intel]]] remoteExec ["createDiaryRecord", [0,-2] select isDedicated, true];
	 ["IntelFound",["Pashto Writing","Intel found"]] remoteExec ["BIS_fnc_showNotification", [0,-2] select isDedicated, false];
	
} else {
	hint "nothing found";
};