#include "R3F_ARTY_disable_enable.sqf"
#include "R3F_LOG_disable_enable.sqf"

sleep 0.1;

private ["_liste_objets_depl_heli_remorq_transp", "_liste_vehicules_connus", "_liste_vehicules", "_count_liste_vehicules", "_i", "_objet"];

#ifdef R3F_LOG_enable
_liste_objets_depl_heli_remorq_transp = R3F_LOG_CFG_objets_deplacables + R3F_LOG_CFG_objets_heliportables +
	R3F_LOG_CFG_objets_remorquables + R3F_LOG_classes_objets_transportables;
#endif

_liste_vehicules_connus = [];

while {true} do
{
	if !(isNull player) then
	{
		_liste_vehicules = (vehicles + nearestObjects [player, ["Static"], 80]) - _liste_vehicules_connus;
		_count_liste_vehicules = count _liste_vehicules;
		
		if (_count_liste_vehicules > 0) then
		{
			for [{_i = 0}, {_i < _count_liste_vehicules}, {_i = _i + 1}] do
			{
				_objet = _liste_vehicules select _i;
				
				#ifdef R3F_LOG_enable
				if ({_objet isKindOf _x} count _liste_objets_depl_heli_remorq_transp > 0) then
				{
					[_objet] spawn R3F_LOG_FNCT_objet_init;
				};
				
				if ({_objet isKindOf _x} count R3F_LOG_CFG_heliporteurs > 0) then
				{
					[_objet] spawn R3F_LOG_FNCT_heliporteur_init;
				};
				
				if ({_objet isKindOf _x} count R3F_LOG_CFG_remorqueurs > 0) then
				{
					[_objet] spawn R3F_LOG_FNCT_remorqueur_init;
				};
				
				if ({_objet isKindOf _x} count R3F_LOG_classes_transporteurs > 0) then
				{
					[_objet] spawn R3F_LOG_FNCT_transporteur_init;
				};
				#endif
				
				#ifdef R3F_ARTY_enable
				// Si l'objet est un pièce d'artillerie d'un type à gérer
				if ({_objet isKindOf _x} count R3F_ARTY_CFG_pieces_artillerie > 0) then
				{
					[_objet] spawn R3F_ARTY_FNCT_piece_init;
				};
				
				if ({_objet isKindOf _x} count R3F_ARTY_CFG_calculateur_interne > 0) then
				{
					_objet addAction [("<t color=""#dddd00"">" + STR_R3F_ARTY_action_ouvrir_dlg_SM + "</t>"), "R3F_ARTY_AND_LOG\R3F_ARTY\poste_commandement\ouvrir_dlg_saisie_mission.sqf", nil, 6, false, true, "", "vehicle player == _target"];
				};
				
				if ({_objet isKindOf _x} count R3F_ARTY_CFG_calculateur_externe > 0) then
				{
					_objet addAction [("<t color=""#dddd00"">" + STR_R3F_ARTY_action_ouvrir_dlg_SM + "</t>"), "R3F_ARTY_AND_LOG\R3F_ARTY\poste_commandement\ouvrir_dlg_saisie_mission.sqf", nil, 6, true, true, "", "vehicle player == player"];
				};
				
				if (typeOf _objet == "SatPhone") then
				{
					[_objet] spawn R3F_ARTY_FNCT_calculateur_init;
				};
				#endif
				
				sleep (18/_count_liste_vehicules);
			};
			
			_liste_vehicules_connus = _liste_vehicules_connus + _liste_vehicules;
		}
		else
		{
			sleep 18;
		};
	}
	else
	{
		sleep 2;
	};
};