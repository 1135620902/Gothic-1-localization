// *************************************************************************
// 									Kapitel 1
// *************************************************************************

// *************************************************************************
// 									EXIT
// *************************************************************************
instance Info_Nov_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Nov_2 (s.u.) jeweils gesetzt
	nr				= 999;
	condition		= Info_Nov_2_EXIT_Condition;
	information		= Info_Nov_2_EXIT_Info;
	permanent		= TRUE;
	description		= "ENDE";
};

func int Info_Nov_2_EXIT_Condition()
{
	return 1;
};

func void Info_Nov_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************
instance Info_Nov_2_EinerVonEuchWerden(C_INFO) // E1
{
	nr				= 4;
	condition		= Info_Nov_2_EinerVonEuchWerden_Condition;
	information		= Info_Nov_2_EinerVonEuchWerden_Info;
	permanent		= TRUE;
	description		= "Ich will bei euch mitmachen.";
};

func int Info_Nov_2_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void Info_Nov_2_EinerVonEuchWerden_Info()
{
	AI_Output(other, self, "Info_Nov_2_EinerVonEuchWerden_15_00"); //Ich will bei euch mitmachen.
	AI_Output(self, other, "Info_Nov_2_EinerVonEuchWerden_02_01"); //Du hast dich entschieden, dem Schläfer zu dienen? Vor dir liegt ein Weg voller Freude und Glück.
	AI_Output(self, other, "Info_Nov_2_EinerVonEuchWerden_02_02"); //Gehe zu Cor Kalom, er entscheidet, für welche Aufgabe du am besten geeignet bist.

	var C_Npc CorKalom; CorKalom = Hlp_GetNpc(Gur_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************
instance Info_Nov_2_WichtigePersonen(C_INFO)
{
	nr				= 3;
	condition		= Info_Nov_2_WichtigePersonen_Condition;
	information		= Info_Nov_2_WichtigePersonen_Info;
	permanent		= TRUE;
	description		= "Wer sind eure Anführer?";
};

func int Info_Nov_2_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Nov_2_WichtigePersonen_Info()
{
	AI_Output(other, self, "Info_Nov_2_WichtigePersonen_15_00"); //Wer sind eure Anführer?
	AI_Output(self, other, "Info_Nov_2_WichtigePersonen_02_01"); //Y'Berion, Cor Kalom und Cor Angar sind unsere geistigen Väter.
	AI_Output(self, other, "Info_Nov_2_WichtigePersonen_02_02"); //Sie stellen unsere Verbindung zum Schläfer dar. Wenn wir an den Anrufungen teilnehmen, sind sie es, die den Kontakt zum Schläfer herstellen.

	var C_Npc YBerion; YBerion = Hlp_GetNpc(Gur_1200_Yberion);
	var C_Npc CorKalom; CorKalom = Hlp_GetNpc(Gur_1201_CorKalom);
	var C_Npc CorAngar; CorAngar = Hlp_GetNpc(Gur_1202_CorAngar);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
	CorAngar.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************
instance Info_Nov_2_DasLager(C_INFO)
{
	nr				= 2;
	condition		= Info_Nov_2_DasLager_Condition;
	information		= Info_Nov_2_DasLager_Info;
	permanent		= TRUE;
	description		= "Was gibt es wichtiges über diesen Ort zu wissen?";
};

func int Info_Nov_2_DasLager_Condition()
{
	return 1;
};

func void Info_Nov_2_DasLager_Info()
{
	AI_Output(other, self, "Info_Nov_2_DasLager_15_00"); //Was gibt es wichtiges über diesen Ort zu wissen?
	AI_Output(self, other, "Info_Nov_2_DasLager_02_01"); //Es ist ein Ort des Glaubens, Bruder. Wir haben nicht viel, aber was wir haben, teilen wir gerne mit denen, die sich die Lehren des Schläfers anhören wollen.
	AI_Output(self, other, "Info_Nov_2_DasLager_02_02"); //Suche einen der Gurus auf, und lass deine Seele bereichern.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************
instance Info_Nov_2_DieLage(C_INFO) // E1
{
	nr				= 1;
	condition		= Info_Nov_2_DieLage_Condition;
	information		= Info_Nov_2_DieLage_Info;
	permanent		= TRUE;
	description		= "Wie sieht's aus?";
};

func int Info_Nov_2_DieLage_Condition()
{
	return 1;
};

func void Info_Nov_2_DieLage_Info()
{
	AI_Output(other, self, "Info_Nov_2_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(self, other, "Info_Nov_2_DieLage_02_01"); //Ich habe wenig Zeit - muss mich um meine Aufgaben kümmern.
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Nov_2(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);

	Info_Nov_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_DieLage.npc = Hlp_GetInstanceID(slf);
};
