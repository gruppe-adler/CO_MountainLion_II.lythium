/* 
 * This file contains parameters to config and function call to start an instance of
 * traffic in the mission. The file is edited by the mission developer.
 *
 * See file Engima\Traffic\Documentation.txt for documentation and a full reference of 
 * how to customize and use Engima's Traffic.
 */
 
 private ["_parameters"];

// Set traffic parameters.
_parameters = [
	["SIDE", civilian],
	["VEHICLES", [
			"RDS_Gaz24_Civ_03",
			"RDS_Gaz24_Civ_01",
			"RDS_Gaz24_Civ_02",
			"RDS_Ikarus_Civ_01",
			"RDS_JAWA353_Civ_01",
			"RDS_Old_bike_Civ_01",
			"RDS_S1203_Civ_03",
			"RDS_Zetor6945_Base",
			"RDS_Lada_Civ_01",
			"RDS_Lada_Civ_04",
			"RDS_Lada_Civ_03",
			"RDS_Lada_Civ_05",
			"RDS_tt650_Civ_01",
			"LOP_TAK_Civ_Landrover",
			"LOP_TAK_Civ_UAZ",
			"LOP_TAK_Civ_UAZ_Open",
			"C_Truck_02_fuel_F",
			"C_Truck_02_box_F",
			"C_Truck_02_transport_F",
			"C_Truck_02_covered_F",
			"RHS_Ural_Civ_01",
			"RHS_Ural_Open_Civ_01",
			"RHS_Ural_Civ_03",
			"RHS_Ural_Open_Civ_03",
			"RHS_Ural_Civ_02",
			"RHS_Ural_Open_Civ_02"
	]],
	["VEHICLES_COUNT", 15],
	["MAX_GROUPS_COUNT", 20],
	["MIN_SPAWN_DISTANCE", 1500],
	["MAX_SPAWN_DISTANCE", 2000],
	["MIN_SKILL", 0],
	["MAX_SKILL", 0.1],
	["AREA_MARKER", "mrk_traffic"],
	["HIDE_AREA_MARKER", true],
	["ON_UNIT_CREATING", {}],
	["ON_UNIT_CREATED", { _this call GRAD_civPartisans_fnc_equipTraffic; }],
	["ON_UNIT_REMOVING", {}],
	["DEBUG", false]
];

// Start an instance of the traffic
_parameters spawn ENGIMA_TRAFFIC_StartTraffic;
