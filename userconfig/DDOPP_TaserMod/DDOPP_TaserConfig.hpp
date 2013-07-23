/*****************************************************************
Copyright © 2013 Double Doppler

File: DDOPP_TaserConfig.hpp
Date: 29/1/2013
Author: Double Doppler/D.Doppler
Contact: doubledoppler@live.co.uk
Description: N/A.
Parameter(s): None.

UNAUTHORIZED USE OR REPRODUCTION OF THIS MATERIAL WITHOUT THE 
PERMISSION OF THE AUTHOR IS PROHIBITED.
*****************************************************************/

// BASIC CONFIGURATION
DDOPP_taser_maxShootRange    = 50;   // Meters - Maximum cartridge projectile range
DDOPP_taser_maxTouchRange    = 3;    // Meters - Required to touch the target in Drive Stun
DDOPP_taser_koTime           = 40;   // Seconds - How long target will be knocked out for
DDOPP_taser_koTimeDS         = 20;   // Seconds - How long target will be knocked out for (Drive Stun)

DDOPP_taser_enableMessage    = false; // Enable/disable global message updates - i.e
                                     // globalChat "Player X was stunned by player Y".

DDOPP_taser_enableHints      = false; // Enable/disable client-side hints - i.e
                                     // hint "You are stunned!".					 

// FOR MISSION EDITORS AND MOD PACK ADMINS
// (Make sure you distribute this .hpp file in your mod pack, for the players to use the same settings.)

DDOPP_taser_arrWeapons       = ["DDOPP_X26","DDOPP_X26_b","DDOPP_X3","DDOPP_X3_b"]; // List of all tasers
DDOPP_taser_arrHandgun       = ["DDOPP_X26","DDOPP_X26_b","DDOPP_X3","DDOPP_X3_b"]; // List of all tasers with "Drive-Stun" mode
DDOPP_taser_arrBullet        = ["DDOPP_B_Taser"]; // Taser projectile(s)
DDOPP_taser_arrProneAnims    = ["amovppnemrunsnonwnondf","amovppnemstpsnonwnondnon","amovppnemstpsraswrfldnon","amovppnemsprslowwrfldf","aidlppnemstpsnonwnondnon0s","aidlppnemstpsnonwnondnon01"];
DDOPP_taser_arrStunAnims     = ["adthppnemstpsraswpstdnon_2","adthpercmstpslowwrfldnon_4"];

DDOPP_taser_arrRestrainAnims = [ 
	// If your mission features a restrain system, add the restrain animations that it uses in this array to
	// avoid conflicting with the taser effects function. (If they are not already in here.)
	// CASE SESITIVE
	"actspercmstpsnonwrfldnon_interrogate02_forgoten",
	"civillying01"
];

DDOPP_taser_arrNotWeapons 	 = [
	// These "weapons" will not be removed from your gear inventory when you are stunned.
	"Binocular",
	"NVGoggles",
	"ItemMap",
	"ItemCompass",
	"ItemRadio",
	"ItemWatch",
	"ItemGPS"
];

DDOPP_taser_enableEH         = false; // Decide if "HandleDamage" Event Handler will be added
                                     // to predefined AI units and player inside the taser
									 // scripts, or not (if you define it elsewhere).

									 // If your mission already contains a "HandleDamage"
									 // Event-handler then set this to false and merge the
									 // contents of the taser "HandleDamage" EH with yours.	