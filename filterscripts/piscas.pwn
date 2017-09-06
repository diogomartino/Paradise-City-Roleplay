#include a_samp

#define MAX_CARROS  600

new Indicators_xqz[MAX_CARROS][6];

stock SetVehicleIndicator(vehicleid, leftindicator=0, rightindicator=0)
{
	if(!leftindicator & !rightindicator) return false;
	new Float:_vX[2], Float:_vY[2], Float:_vZ[2];
	if(rightindicator)
	{
	    if(IsTrailerAttachedToVehicle(vehicleid))
	    {
	        new omg = GetVehicleModel(GetVehicleTrailer(vehicleid));
            GetVehicleModelInfo(omg, VEHICLE_MODEL_INFO_SIZE, _vX[0], _vY[0], _vZ[0]);
 			Indicators_xqz[vehicleid][4] = CreateObject(19294, 0, 0, 0,0,0,0);
			AttachObjectToVehicle(Indicators_xqz[vehicleid][4], GetVehicleTrailer(vehicleid),  _vX[0]/2.4, -_vY[0]/3.35, -1.0 ,0,0,0);
		}
	    GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, _vX[0], _vY[0], _vZ[0]);
 		Indicators_xqz[vehicleid][0] = CreateObject(19294, 0, 0, 0,0,0,0);
		AttachObjectToVehicle(Indicators_xqz[vehicleid][0], vehicleid,  _vX[0]/2.23, _vY[0]/2.23, 0.1 ,0,0,0);
 		Indicators_xqz[vehicleid][1] = CreateObject(19294, 0, 0, 0,0,0,0);
		AttachObjectToVehicle(Indicators_xqz[vehicleid][1], vehicleid,  _vX[0]/2.23, -_vY[0]/2.23, 0.1 ,0,0,0);
	}
	if(leftindicator)
	{
	    if(IsTrailerAttachedToVehicle(vehicleid))
	    {
	    	new omg = GetVehicleModel(GetVehicleTrailer(vehicleid));
            GetVehicleModelInfo(omg, VEHICLE_MODEL_INFO_SIZE, _vX[0], _vY[0], _vZ[0]);
 			Indicators_xqz[vehicleid][5] = CreateObject(19294, 0, 0, 0,0,0,0);
			AttachObjectToVehicle(Indicators_xqz[vehicleid][5], GetVehicleTrailer(vehicleid),  -_vX[0]/2.4, -_vY[0]/3.35, -1.0 ,0,0,0);
		}
	    GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, _vX[0], _vY[0], _vZ[0]);
 		Indicators_xqz[vehicleid][2] = CreateObject(19294, 0, 0, 0,0,0,0);
		AttachObjectToVehicle(Indicators_xqz[vehicleid][2], vehicleid,  -_vX[0]/2.23, _vY[0]/2.23, 0.1 ,0,0,0);
 		Indicators_xqz[vehicleid][3] = CreateObject(19294, 0, 0, 0,0,0,0);
		AttachObjectToVehicle(Indicators_xqz[vehicleid][3], vehicleid,  -_vX[0]/2.23, -_vY[0]/2.23, 0.1 ,0,0,0);
	}
	return 1;
}

public OnPlayerKeyStateChange(playerid,newkeys, oldkeys)
{
	if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == 2)
	{
	   	if(!IsAPlane(GetPlayerVehicleID(playerid)) && !IsABoat(GetPlayerVehicleID(playerid)))
	   	{
	      	new vid = GetPlayerVehicleID(playerid);
	  	 	if(newkeys & ( KEY_LOOK_LEFT ) && newkeys & ( KEY_LOOK_RIGHT ))
			{
		    	if(Indicators_xqz[vid][2] || Indicators_xqz[vid][5]) DestroyObject(Indicators_xqz[vid][5]),DestroyObject(Indicators_xqz[vid][2]), DestroyObject(Indicators_xqz[vid][3]),Indicators_xqz[vid][2]=0;
            	else if(Indicators_xqz[vid][0] || Indicators_xqz[vid][4]) DestroyObject(Indicators_xqz[vid][4]),DestroyObject(Indicators_xqz[vid][0]), DestroyObject(Indicators_xqz[vid][1]),Indicators_xqz[vid][0]=0;
				else
				SetVehicleIndicator(vid,1,1);
				return 1;
			}
			if(newkeys & KEY_LOOK_RIGHT)
			{
	  		  	if(Indicators_xqz[vid][0] || Indicators_xqz[vid][4]) DestroyObject(Indicators_xqz[vid][4]), DestroyObject(Indicators_xqz[vid][0]), DestroyObject(Indicators_xqz[vid][1]),Indicators_xqz[vid][0]=0;
      	      	else if(Indicators_xqz[vid][2]|| Indicators_xqz[vid][5]) DestroyObject(Indicators_xqz[vid][5]), DestroyObject(Indicators_xqz[vid][2]), DestroyObject(Indicators_xqz[vid][3]),Indicators_xqz[vid][2]=0;
				else
				SetVehicleIndicator(vid,0,1);
			}
			if(newkeys & KEY_LOOK_LEFT)
			{
			    if(Indicators_xqz[vid][2] || Indicators_xqz[vid][5]) DestroyObject(Indicators_xqz[vid][5]),DestroyObject(Indicators_xqz[vid][2]), DestroyObject(Indicators_xqz[vid][3]),Indicators_xqz[vid][2]=0;
      	      	else if(Indicators_xqz[vid][0] || Indicators_xqz[vid][4]) DestroyObject(Indicators_xqz[vid][4]),DestroyObject(Indicators_xqz[vid][0]), DestroyObject(Indicators_xqz[vid][1]),Indicators_xqz[vid][0]=0;
				else
				SetVehicleIndicator(vid,1,0);
			}
		}
	}
	return 1;
}


public OnVehicleDeath(vehicleid)
{
	if(Indicators_xqz[vehicleid][2]) DestroyObject(Indicators_xqz[vehicleid][2]), DestroyObject(Indicators_xqz[vehicleid][3]),DestroyObject(Indicators_xqz[vehicleid][5]),Indicators_xqz[vehicleid][2]=0;
	if(Indicators_xqz[vehicleid][0]) DestroyObject(Indicators_xqz[vehicleid][0]), DestroyObject(Indicators_xqz[vehicleid][1]),DestroyObject(Indicators_xqz[vehicleid][4]),Indicators_xqz[vehicleid][0]=0;
	return 1;
}

stock IsAPlane(carid2)
{
	new carid = GetVehicleModel(carid2);
	if(carid == 592 || carid == 577 || carid == 511 || carid == 512 || carid == 593 || carid == 520 || carid == 553 || carid == 476 || carid == 519 || carid == 460 || carid == 513) return 1;
	return 0;
}

stock IsABoat(carid)
{
	new modelid = GetVehicleModel(carid);
	if(modelid == 430 || modelid == 446 || modelid == 452 || modelid == 453 || modelid == 454 || modelid == 472 || modelid == 473 || modelid == 484 || modelid == 493 || modelid == 595)
	{
		return 1;
	}
	return 0;
}
