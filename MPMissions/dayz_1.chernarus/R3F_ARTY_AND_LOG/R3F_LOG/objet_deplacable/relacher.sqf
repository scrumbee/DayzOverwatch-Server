if (R3F_LOG_mutex_local_verrou) then
{
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
}
else
{
	R3F_LOG_mutex_local_verrou = true;
	
	R3F_LOG_joueur_deplace_objet = objNull;
	sleep 2;
	
	R3F_LOG_mutex_local_verrou = false;
};