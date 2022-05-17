/*
		* Private Veh System for GTA SA:MP *
		* Made by Daniel Andreev (sTrIx) *
*/

#include <a_samp>

#define COLOR_GRAD1 0xB4B5B7FF
#define COLOR_ORANGE 0xF97804FF
#define COLOR_WHITE 0xFFFFFFFF

//Main Variables - open

new privateVehOfsTrIx;

//Main Variables - close

//strtok - open
strtok(const string[], &index)
{
	new length=strlen(string);
	while ((index<length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset=index;
	new result[20];
	while ((index<length) && (string[index]>' ') && ((index - offset)<(sizeof(result) - 1)))
	{
		result[index - offset]=string[index];
		index++;
	}
	result[index - offset]=EOS;
	return result;
}
//strtok - close


public OnFilterScriptInit()
{
	print("\n----------------------------------------------------------------------");
	print(" Private Vehicle Elementary System for GTA SA:MP Made by sTrIx ( Daniel Andreev)");
	print("----------------------------------------------------------------------\n");
	
	//Vehicles - open
    privateVehOfsTrIx = CreateVehicle(411,282.6102,-1160.0824,80.6411,225.3297,53,53,900);
    //Vehicles - close
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	//Ïðîâåðêà çà èìå â ñèñòåìàòà:
    if(vehicleid==privateVehOfsTrIx)
	{
	new playerName[MAX_PLAYER_NAME];
	GetPlayerName(playerid, playerName, sizeof (playerName));
	if(strcmp(playerName,"sTrIx",false)==1)
	{
	if(!ispassenger)
	{
	new Float:cx, Float:cy, Float:cz;
	GetPlayerPos(playerid, cx, cy, cz);
	SetPlayerPos(playerid, cx, cy, cz);
	SendClientMessage(playerid, COLOR_WHITE, "You don't own this private vehicle!");
	}
	}
	}
	return 1;
}
