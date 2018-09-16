private _confirmed = [
"Den Rest der Mission zusehen und erst zum Debriefing respawnen?", 
"Specaten?", 
"Bestätigen", 
"Abbrechen"
] call BIS_fnc_guiMessage;

if (_confirmed) then {
    closeDialog 0; player setDamage 1; [] call grad_permaChoice_fnc_setPlayerSpectator;
} else {
    
};