params ["_leakIdentifier", "_object", "_duration", "_openLeakString", "_closeLeakString", "_startsOpen", "_removeOnOpen", "_removeOnClose"];

_object setVariable ["grad_gas_leakIdentifier", _leakIdentifier];

[
	_object,											// Object the action is attached to
	_openLeakString,										// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 3 && missionNamespace getVariable [_target getVariable ['grad_gas_leakIdentifier', ''], false]",						// Condition for the action to be shown
	"_caller distance _target < 3 && && missionNamespace getVariable [_target getVariable ['grad_gas_leakIdentifier', ''], false]",						// Condition for the action to progress
	{},													// Code executed when action starts
	{},													// Code executed on every progress tick
	{ 	params ["_target", "_caller", "_actionId", "_arguments"];
		_arguments params ["_leakIdentifier", "_startsOpen"];
		missionNamespace setVariable [_leakIdentifier, !_startsOpen, true];
	},				// Code executed on completion
	{},													// Code executed on interrupted
	[_leakIdentifier, _startsOpen],													// Arguments passed to the scripts as _this select 3
	_duration,													// Action duration [s]
	0,													// Priority
	_removeOnOpen,												// Remove on completion
	false												// Show in unconscious state 
] call BIS_fnc_holdActionAdd;	// MP compatible implementation



[
	_object,											// Object the action is attached to
	_closeLeakString,										// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 3 && !(missionNamespace getVariable [_target getVariable ['grad_gas_leakIdentifier', ''], false])",						// Condition for the action to be shown
	"_caller distance _target < 3 && && !(missionNamespace getVariable [_target getVariable ['grad_gas_leakIdentifier', ''], false])",						// Condition for the action to progress
	{},													// Code executed when action starts
	{},													// Code executed on every progress tick
	{ 	params ["_target", "_caller", "_actionId", "_arguments"];
		_arguments params ["_leakIdentifier", "_startsOpen"];
		missionNamespace setVariable [_leakIdentifier, _startsOpen, true]; 
	},				// Code executed on completion
	{},													// Code executed on interrupted
	[_leakIdentifier, _startsOpen],													// Arguments passed to the scripts as _this select 3
	_duration,													// Action duration [s]
	0,													// Priority
	_removeOnClose,												// Remove on completion
	false												// Show in unconscious state 
] call BIS_fnc_holdActionAdd;	// MP compatible implementation