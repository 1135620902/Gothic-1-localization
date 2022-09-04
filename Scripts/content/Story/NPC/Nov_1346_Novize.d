instance NOV_1346_Novize(Npc_Default)
{
	// -------- primary data --------
	name							= Name_Novize;
	npctype							= Npctype_Ambient;
	guild							= GIL_NOV;
	level							= 3;

	voice							= 3;
	id								= 1346;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 10;
	attribute[ATR_DEXTERITY]		= 10;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;
	attribute[ATR_HITPOINTS_MAX]	= 76;
	attribute[ATR_HITPOINTS]		= 76;

	// -------- protection --------

	// -------- visuals --------
	Mdl_SetVisual(self, "HUMANS.MDS");
	Mdl_ApplyOverlayMDS(self, "Humans_Relaxed.mds");
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_Naked0",		1,		1,			"Hum_Head_Psionic",	26,			2,			NOV_ARMOR_L);

	B_Scale(self);
	Mdl_SetModelFatness(self, -1);

	// -------- ai --------
	fight_tactic = FAI_HUMAN_COWARD;

	// -------- talents --------

	// -------- inventory --------
	// CreateInvItem(self, ItFoSoup);
	// CreateInvItem(self, ItMiJoint);
	EquipItem(self, ItMw_1H_Hatchet_01);
	EquipItem(self, ItMiLute);

	// -------- daily routine --------
	daily_routine = Rtn_start_1346;
};

func void Rtn_start_1346()
{
	TA_Smalltalk(08, 00, 23, 00, "PSI_PATH_TEMPLE_9_MOVEMENT");
	TA_Smalltalk(23, 00, 08, 00, "PSI_PATH_TEMPLE_9_MOVEMENT");
};

func void Rtn_Ritual_1346()
{
	TA_Meditate(00, 00, 08, 00, "PSI_TEMPLE_NOVIZE_PR2");
	TA_Meditate(08, 00, 24, 00, "PSI_TEMPLE_NOVIZE_PR2");
};
