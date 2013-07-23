/**
 * English and French comments
 * This file contains the configuration variables of the logistics system.
 * Important note : All the classes names which inherits from the ones used in configuration variables will be also available.
 * There are two ways to manage new objects with the logistics system. The first is to add these objects in the
 * folowing appropriate lists. The second is to create a new external file in the /addons_config/ directory,
 * according to the same scheme as the existing ones, and to add a #include at the end of this current file.
 */

/****** TOW WITH VEHICLE ******/

/**
 * List of class names of (ground or air) vehicles which can tow towables objects.
 */
R3F_LOG_CFG_remorqueurs =
["HMMWV","HMMWV_M2","HMMWV_Armored","HMMWV_MK19","HMMWV_TOW","HMMWV_Avenger","MTVR","HMMWV_Ambulance","UAZ_CDF","UAZ_AGS30_CDF","UAZ_MG_CDF","Ural_CDF","UralOpen_CDF","Ural_ZU23_CDF","UAZ_RU","UAZ_AGS30_RU","Kamaz","KamazOpen","Offroad_DSHKM_INS","Pickup_PK_INS","UAZ_INS","UAZ_AGS30_INS","UAZ_MG_INS","UAZ_SPG9_INS","Ural_INS","UralOpen_INS","Ural_ZU23_INS","Offroad_DSHKM_Gue","Offroad_SPG9_Gue","Pickup_PK_GUE","V3S_Gue","Ural_ZU23_Gue","HMMWV_DES_EP1","HMMWV_MK19_DES_EP1","HMMWV_TOW_DES_EP1","HMMWV_M998_crows_M2_DES_EP1","HMMWV_M998_crows_MK19_DES_EP1","HMMWV_M1151_M2_DES_EP1","HMMWV_M998A2_SOV_DES_EP1","HMMWV_Terminal_EP1","HMMWV_M1035_DES_EP1","HMMWV_Avenger_DES_EP1","HMMWV_Avenger_DES_EP1","M1030_US_DES_EP1","MTVR_DES_EP1","HMMWV_Ambulance_DES_EP1","HMMWV_M1151_M2_CZ_DES_EP1","LandRover_CZ_EP1","LandRover_Special_CZ_EP1","MAZ_543_SCUD_TK_EP1","GRAD_TK_EP1","LandRover_MG_TK_EP1","LandRover_SPG9_TK_EP1","SUV_TK_EP1","UAZ_Unarmed_TK_EP1","UAZ_AGS30_TK_EP1","UAZ_MG_TK_EP1","Ural_ZU23_TK_EP1","V3S_TK_EP1","V3S_Open_TK_EP1","LandRover_MG_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1","SUV_UN_EP1","UAZ_Unarmed_UN_EP1","Ural_UN_EP1","Offroad_DSHKM_TK_GUE_EP1","Offroad_SPG9_TK_GUE_EP1","Pickup_PK_TK_GUE_EP1","Ural_ZU23_TK_GUE_EP1","V3S_TK_GUE_EP1","Ikarus","SkodaBlue","SkodaGreen","SkodaRed","Skoda","VWGolf","TT650_Civ","MMT_Civ","hilux1_civil_2_covered","hilux1_civil_1_open","hilux1_civil_3_open","car_hatchback","datsun1_civil_1_open","datsun1_civil_2_covered","V3S_Civ","car_sedan","Tractor","UralCivil","UralCivil2","Lada_base","LadaLM","Lada2","Lada1","UAZ_CDF","Ural_CDF","hilux1_civil_3_open_EP1","Ikarus_TK_CIV_EP1","Lada1_TK_CIV_EP1","Lada2_TK_CIV_EP1","Old_bike_TK_CIV_EP1","Old_moto_TK_Civ_EP1","S1203_TK_CIV_EP1","SUV_TK_CIV_EP1","TT650_TK_CIV_EP1","UAZ_Unarmed_TK_CIV_EP1","Volha_1_TK_CIV_EP1","Volha_2_TK_CIV_EP1","VolhaLimo_TK_CIV_EP1","ArmoredSUV_PMC","BTR40_MG_TK_INS_EP1","AN2_DZ"];

/**
 * List of class names of towables objects.
 */
R3F_LOG_CFG_objets_remorquables = ["HMMWV","HMMWV_M2","HMMWV_Armored","HMMWV_MK19","HMMWV_TOW","HMMWV_Avenger","MTVR","HMMWV_Ambulance","UAZ_CDF","UAZ_AGS30_CDF","UAZ_MG_CDF","Ural_CDF","UralOpen_CDF","Ural_ZU23_CDF","UAZ_RU","UAZ_AGS30_RU","Kamaz","KamazOpen","Offroad_DSHKM_INS","Pickup_PK_INS","UAZ_INS","UAZ_AGS30_INS","UAZ_MG_INS","UAZ_SPG9_INS","Ural_INS","UralOpen_INS","Ural_ZU23_INS","Offroad_DSHKM_Gue","Offroad_SPG9_Gue","Pickup_PK_GUE","V3S_Gue","Ural_ZU23_Gue","HMMWV_DES_EP1","HMMWV_MK19_DES_EP1","HMMWV_TOW_DES_EP1","HMMWV_M998_crows_M2_DES_EP1","HMMWV_M998_crows_MK19_DES_EP1","HMMWV_M1151_M2_DES_EP1","HMMWV_M998A2_SOV_DES_EP1","HMMWV_Terminal_EP1","HMMWV_M1035_DES_EP1","HMMWV_Avenger_DES_EP1","HMMWV_Avenger_DES_EP1","M1030_US_DES_EP1","MTVR_DES_EP1","HMMWV_Ambulance_DES_EP1","HMMWV_M1151_M2_CZ_DES_EP1","LandRover_CZ_EP1","LandRover_Special_CZ_EP1","MAZ_543_SCUD_TK_EP1","GRAD_TK_EP1","LandRover_MG_TK_EP1","LandRover_SPG9_TK_EP1","SUV_TK_EP1","UAZ_Unarmed_TK_EP1","UAZ_AGS30_TK_EP1","UAZ_MG_TK_EP1","Ural_ZU23_TK_EP1","V3S_TK_EP1","V3S_Open_TK_EP1","LandRover_MG_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1","SUV_UN_EP1","UAZ_Unarmed_UN_EP1","Ural_UN_EP1","Offroad_DSHKM_TK_GUE_EP1","Offroad_SPG9_TK_GUE_EP1","Pickup_PK_TK_GUE_EP1","Ural_ZU23_TK_GUE_EP1","V3S_TK_GUE_EP1","Ikarus","SkodaBlue","SkodaGreen","SkodaRed","Skoda","VWGolf","TT650_Civ","MMT_Civ","hilux1_civil_2_covered","hilux1_civil_1_open","hilux1_civil_3_open","car_hatchback","datsun1_civil_1_open","datsun1_civil_2_covered","V3S_Civ","car_sedan","Tractor","UralCivil","UralCivil2","Lada_base","LadaLM","Lada2","Lada1","UAZ_CDF","Ural_CDF","hilux1_civil_3_open_EP1","Ikarus_TK_CIV_EP1","Lada1_TK_CIV_EP1","Lada2_TK_CIV_EP1","Old_bike_TK_CIV_EP1","Old_moto_TK_Civ_EP1","S1203_TK_CIV_EP1","SUV_TK_CIV_EP1","TT650_TK_CIV_EP1","UAZ_Unarmed_TK_CIV_EP1","Volha_1_TK_CIV_EP1","Volha_2_TK_CIV_EP1","VolhaLimo_TK_CIV_EP1","ArmoredSUV_PMC","BTR40_MG_TK_INS_EP1","AN2_DZ"];

/****** LIFT WITH VEHICLE ******/

/**
 * List of class names of air vehicles which can lift liftables objects.
 */
R3F_LOG_CFG_heliporteurs =
[
"BAF_Merlin_HC3_D",
"usec_bell206_1",
"BAF_Merlin_DZ",
"UH60M_DZ",
"UH1Y_DZ",
"MV22_DZ",
"Mi17_medevac_RU_DZ",
"Mi17_DZ",
"UH1H_DZ"
];

/**
 * List of class names of liftables objects.
 */
R3F_LOG_CFG_objets_heliportables =
[
	// e.g. : "MyLiftableObjectClassName1", "MyLiftableObjectClassName2"
	"GUE_WarfareBVehicleServicePoint"
];


/****** LOAD IN VEHICLE ******/

/*
 * This section use a quantification of the volume and/or weight of the objets.
 * The arbitrary referencial used is : an ammo box of type USVehicleBox "weights" 12 units.
 * Note : the priority of a declaration of capacity to another corresponds to their order in the tables.
 *   For example : the "Truck" class is in the "Car" class (see http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).
 *   If "Truck" is declared with a capacity of 140 before "Car". And if "Car" is declared after "Truck" with a capacity of 40,
 *   Then all the sub-classes in "Truck" will have a capacity of 140. And all the sub-classes of "Car", excepted the ones
 *   in "Truck", will have a capacity of 40.
 */

/**
 * List of class names of (ground or air) vehicles which can transport transportables objects.
 * The second element of the arrays is the load capacity (in relation with the capacity cost of the objects).
 */
R3F_LOG_CFG_transporteurs =
[
["BAF_Merlin_HC3_D",75],
["Dingo_GL_Wdl_ACR",20],
["M1114_AGS_ACR",12],
["HMMWV_Ambulance_CZ_DES_EP1",12],
["M1114_DSK_ACR",12],
["HMMWV_M1151_M2_CZ_DES_EP1",12],
["LandRover_ACR",15],
["LandRover_Ambulance_Des_ACR",15],
["LandRover_Ambulance_ACR",15],
["Octavia_ACR",10],
["T810_ACR",65],
["T810Reammo_ACR",45],
["T810Refuel_ACR",200],
["T810A_MG_ACR",50],
["T810_Open_ACR",40]
];

/**
 * List of class names of transportables objects.
 * The second element of the arrays is the cost capacity (in relation with the capacity of the vehicles).
 */
 
R3F_LOG_CFG_objets_transportables =  [
	["Suitcase",1],
	["Fuel_can",1],
	["Land_Barrel_water",2],
	["Land_Teapot_EP1",1],
	["Land_Sack_EP1",1],
	["Land_Bag_EP1",1],
	["Land_fort_bagfence_corner",2],
	["Land_HBarrier5",3],
	["Land_BagFenceLong",2],
	["Fort_EnvelopeBig_EP1",3],
	["Fort_EnvelopeSmall_EP1",2],
	["Fort_StoneWall_EP1",2],
	["Land_Fort_Watchtower_EP1",5],
	["Land_Misc_IronPipes_EP1",3],
	["Land_Misc_Rubble_EP1",2],
	["Land_stand_small_EP1",1],
	["Fort_RazorWire",2],
	["Land_HBarrier_large",4],
	["Land_HBarrier5",2],
	["Fort_Barricade",4],
	["Land_fort_artillery_nest",3],
	["Land_fort_rampart",3],
	["Land_fortified_nest_small",3],
	["Land_fort_bagfence_round",2],
	["Land_Ind_BoardsPack2",2],
	["GUE_WarfareBVehicleServicePoint",30],
	["Base_WarfareBBarrier10xTall",15],
	["Base_WarfareBBarrier10x",10],
	["Barrack2",12],
	["Land_Fort_Watchtower",5],
	["Land_Dirthump01",10],
	["Land_CncBlock_Stripes",10],
	["Land_CncBlock",10],
	["Land_fortified_nest_big",10]
];

/****** MOVABLE-BY-PLAYER OBJECTS ******/

/**
 * List of class names of objects moveables by player.
 */

//R3F_LOG_CFG_objets_deplacables = ["Land_CncBlock_Stripes","Land_CncBlock","Barrack2","Land_fortified_nest_big","Base_WarfareBBarrier10x","Base_WarfareBBarrier10xTall","Land_Barrel_water","Land_Teapot_EP1","Land_Sack_EP1","Land_Bag_EP1","Suitcase","Fuel_can","Land_Campfire_burning","Land_fort_bagfence_corner","Land_HBarrier5","Land_BagFenceLong","Fort_EnvelopeBig_EP1","Fort_EnvelopeSmall_EP1","Fort_StoneWall_EP1","Land_Fort_Watchtower_EP1","Land_Misc_IronPipes_EP1","Land_Misc_Rubble_EP1","Land_stand_small_EP1","Fort_RazorWire","Land_HBarrier_large","Land_HBarrier5","Fort_Barricade","Land_fort_artillery_nest","Land_fort_rampart","Land_fortified_nest_small","Land_fort_bagfence_round","Land_Ind_BoardsPack2"];

R3F_LOG_CFG_objets_deplacables = [];
/*
 * List of files adding objects in the arrays of logistics configuration (e.g. R3F_LOG_CFG_remorqueurs)
 * Add an include to the new file here if you want to use the logistics with a new addon.
 * 
 * Liste des fichiers ajoutant des objets dans les tableaux de fonctionnalités logistiques (ex : R3F_LOG_CFG_remorqueurs)
 * Ajoutez une inclusion vers votre nouveau fichier ici si vous souhaitez utilisez la logistique avec un nouvel addon.
 */
#include "addons_config\ACE_OA_objects.sqf"
#include "addons_config\BAF_objects.sqf"
#include "addons_config\arma2_CO_objects.sqf"