//***********************************************
//					EXIT
//***********************************************
instance DIA_Rodriguez_Exit(C_INFO)
{
	npc				= KDF_400_Rodriguez;
	nr				= 999;
	condition		= DIA_Rodriguez_Exit_Condition;
	information		= DIA_Rodriguez_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Rodriguez_Exit_Condition()
{
	return 1;
};

func void DIA_Rodriguez_Exit_Info()
{
	AI_StopProcessInfos(self);
};

//***********************************************
//				Hallo und tschüß
//***********************************************
instance DIA_Rodriguez_Hello(C_INFO)
{
	npc				= KDF_400_Rodriguez;
	nr				= 1;
	condition		= DIA_Rodriguez_Hello_Condition;
	information		= DIA_Rodriguez_Hello_Info;
	permanent		= TRUE;
	description		= "Ich suche den obersten Magier des Feuers!";
};

func int DIA_Rodriguez_Hello_Condition()
{
	if (Npc_GetTrueGuild(hero) != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Rodriguez_Hello_Info()
{
	AI_Output(other, self, "DIA_Rodriguez_Hello_15_00"); //Ich suche den obersten Magier des Feuers!
	AI_Output(self, other, "DIA_Rodriguez_Hello_12_01"); //Geh zu Milten. Der gibt sich mit Laufburschen wie dir ab.
	AI_StopProcessInfos(self);
};
