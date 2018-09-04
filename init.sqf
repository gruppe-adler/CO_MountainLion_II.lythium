BRIEFING_DONE = false;

if (isMultiplayer) then {
	titleText ["","BLACK FADED",999];
	0 fadeSound 0;
};

enableSentences false;
["BLU_F", "USOCP"] call GRAD_Loadout_fnc_FactionSetLoadout;
["OPF_F", "Taliban"] call GRAD_Loadout_fnc_FactionSetLoadout;
call compile preprocessFileLineNumbers "Engima\Traffic\Init.sqf";

setViewDistance 8000;