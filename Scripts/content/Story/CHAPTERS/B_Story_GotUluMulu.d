func void B_Story_GotUluMulu()
{
	// -------- Missionsgegenstände --------
	CreateInvItem(hero, UluMulu);

	// -------- Tagebucheinträge --------
	B_LogEntry(CH4_UluMulu, CH4_UluMulu_5);
	Log_SetTopicStatus(CH4_UluMulu, LOG_SUCCESS);

	// -------- Erfahrung --------
	B_GiveXP(XP_GotUluMulu);

	// -------- globale Variable setzen --------
	FreemineOrc_LookingUlumulu = LOG_SUCCESS;
};
