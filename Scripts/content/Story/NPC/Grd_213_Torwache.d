instance GRD_213_Torwache(Npc_Default)
{
	// -------- primary data --------
	name							= NAME_Torwache;
	npctype							= NpcType_Main;
	guild							= GIL_GRD;
	level							= 15;

	voice							= 7;
	id								= 213;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 70;
	attribute[ATR_DEXTERITY]		= 50;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;
	attribute[ATR_HITPOINTS_MAX]	= 220;
	attribute[ATR_HITPOINTS]		= 220;

	// -------- protection --------

	// -------- visuals --------
	Mdl_SetVisual(self, "HUMANS.MDS");
	Mdl_ApplyOverlayMDS(self, "Humans_Militia.mds");
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_Naked0",		0,		1,			"Hum_Head_Bald",	13,			1,			GRD_ARMOR_M);

	B_Scale(self);
	Mdl_SetModelFatness(self, 0);

	// -------- ai --------
	aivar[AIV_IMPORTANT]			= TRUE;

	fight_tactic = FAI_HUMAN_RANGED;

	// -------- talents --------
	Npc_SetTalentSkill(self, NPC_TALENT_1H, 2);
	Npc_SetTalentSkill(self, NPC_TALENT_2H, 1);
	Npc_SetTalentSkill(self, NPC_TALENT_CROSSBOW, 1);

	// -------- inventory --------
	CreateInvItem(self, ItFoCheese);
	CreateInvItem(self, ItFoApple);
	CreateInvItem(self, ItLsTorch);
	CreateInvItems(self, ItAmBolt, 30);
	CreateInvItems(self, ItMiNugget, 10);
	EquipItem(self, ItRw_Crossbow_01);

	// -------- daily routine --------
	daily_routine = Rtn_start_213;
};

func void Rtn_start_213()
{
	// TA_GuardPassage (06,00,21,00,"OCC_WALLCRACK"); // WORKAROUND!!!
	TA_GuardPassage(06, 00, 21, 00, "OCC_GATE_LEFT_GUARD");
	TA_GuardPassage(21, 00, 06, 00, "OCC_GATE_LEFT_GUARD");
};

func void Rtn_OMFull_213()
{
	TA_Sleep(00, 00, 06, 00, "OCC_MERCS_UPPER_LEFT_ROOM_FRONT");
	TA_GuardPassage(06, 00, 21, 00, "OCC_GATE_LEFT_GUARD");
	TA_StandAround(21, 00, 22, 00, "OCC_MERCS_RIGHT_ROOM_FRONT");
	TA_SitAround(22, 00, 22, 15, "OCC_FIGHTTRAINING");
	TA_PracticeSword(22, 15, 24, 00, "OCC_FIGHTTRAINING");
};

func void Rtn_FMTaken_213()
{
};

func void Rtn_OrcAssault_213()
{
};
