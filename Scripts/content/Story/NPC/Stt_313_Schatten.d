instance STT_313_Schatten(Npc_Default)
{
	// -------- primary data --------
	name							= NAME_Schatten;
	npctype							= NPCTYPE_AMBIENT;
	guild							= GIL_STT;
	level							= 5;

	voice							= 12;
	id								= 313;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 20;
	attribute[ATR_DEXTERITY]		= 18;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;
	attribute[ATR_HITPOINTS_MAX]	= 100;
	attribute[ATR_HITPOINTS]		= 100;

	// -------- protection --------

	// -------- visuals --------
	Mdl_SetVisual(self, "HUMANS.MDS");
	Mdl_ApplyOverlayMDS(self, "Humans_Relaxed.mds");
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_Naked0",		0,		1,			"Hum_Head_Psionic",	58,			3,			STT_ARMOR_M);

	B_Scale(self);
	Mdl_SetModelFatness(self, -1);

	// -------- ai --------
	fight_tactic = FAI_HUMAN_COWARD;

	// -------- talents --------
	// Npc_SetTalentSkill(self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self, NPC_TALENT_1H, 1);

	// -------- inventory --------
	CreateInvItem(self, ItFo_Potion_Water_01);
	CreateInvItem(self, ItFoApple);
	CreateInvItem(self, ItKeLockpick);
	CreateInvItems(self, ItAmArrow, 12);
	EquipItem(self, ItMw_1H_Sword_Short_03);
	EquipItem(self, ItRw_Bow_Small_03);

	// -------- daily routine --------
	daily_routine = Rtn_start_313;
};

func void Rtn_start_313()
{
	TA_Sleep(23, 00, 07, 30, "OCR_HUT_36");
	TA_SitAround(07, 30, 11, 00, "OCR_OUTSIDE_HUT_36");
	TA_RepairHut(11, 00, 17, 00, "OCR_OUTSIDE_HUT_36");
	TA_SitAround(17, 00, 23, 00, "OCR_OUTSIDE_HUT_36");
};
