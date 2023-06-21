--[[

--]]

-------------------------------------------------------------------------------------------------------------------------------------------------------------
--DEFINES--
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if Map.LobbyOption("difficulty") == "easy" then

	USSRWave1 = { "3tnk", "3tnk" }
	USSRWave2 = { "3tnk", "v2rl", "e1", "e1", "e3", "e3" }
	USSRWave3 = { "3tnk", "3tnk", "v2rl", }
	USSRWave4 = { "3tnk", "3tnk", "v2rl", "ftrk" }
	USSRWave5 = { "3tnk", "3tnk", "ftrk", "shok", "ftrk" }
	USSRWave6 = { "3tnk", "3tnk", "3tnk", "3tnk", "ftrk", "shok", "ftrk", "shok" }
	USSRWave7 = { "ttnk", "ttnk", "3tnk", "3tnk", "ftrk", "ftrk" }
	USSRWave8 = { "ttnk", "ttnk", "3tnk", "3tnk", "ftrk", "ftrk", "ftrk" }
	USSRWave9 = { "ttnk", "ttnk", "ttnk", "ftrk", "ftrk", "ftrk", "3tnk", "3tnk" }

	FirstTroopTime = DateTime.Minutes(3)

	EscapedUnitsNeeded = 100

	LastAttackUnits = 0
	LastAttackNumber = 10

elseif Map.LobbyOption("difficulty") == "normal" then

	USSRWave1 = { "3tnk", "3tnk", "v2rl" }
	USSRWave2 = { "3tnk", "3tnk", "v2rl", "e1", "e1", "e3", "e3" }
	USSRWave3 = { "3tnk", "3tnk", "v2rl", "3tnk", "ftrk" }
	USSRWave4 = { "3tnk", "3tnk", "v2rl", "3tnk", "ftrk", "shok" }
	USSRWave5 = { "3tnk", "3tnk", "3tnk", "3tnk", "ftrk", "shok", "ftrk" }
	USSRWave6 = { "ttnk", "3tnk", "3tnk", "3tnk", "ftrk", "shok", "ftrk", "shok" }
	USSRWave7 = { "ttnk", "ttnk", "3tnk", "3tnk", "ftrk", "ftrk", "ftrk", "ftrk" }
	USSRWave8 = { "ttnk", "ttnk", "3tnk", "3tnk", "ftrk", "ftrk", "ftrk" }
	USSRWave9 = { "ttnk", "ttnk", "ttnk", "ftrk", "ftrk", "ftrk", "3tnk", "3tnk" }

	FirstTroopTime = DateTime.Minutes(3)

	EscapedUnitsNeeded = 125

	LastAttackUnits = 0
	LastAttackNumber = 20

elseif Map.LobbyOption("difficulty") == "hard" then

	USSRWave1 = { "3tnk", "3tnk", "v2rl", "e1", "e1", "e3", "e3" }
	USSRWave2 = { "3tnk", "3tnk", "v2rl", "v2rl", "e1", "e1", "e3", "e3" }
	USSRWave3 = { "3tnk", "3tnk", "v2rl", "v2rl", "3tnk", "ftrk" }
	USSRWave4 = { "3tnk", "3tnk", "v2rl", "3tnk", "ftrk", "shok", "ftrk", "shok" }
	USSRWave5 = { "3tnk", "3tnk", "3tnk", "3tnk", "ftrk", "shok", "ftrk", "shok", "ftrk" }
	USSRWave6 = { "ttnk", "3tnk", "3tnk", "3tnk", "ftrk", "shok", "ftrk", "shok", "ftrk", "ftrk" }
	USSRWave7 = { "ttnk", "ttnk", "3tnk", "3tnk", "ftrk", "ftrk", "ftrk", "ftrk", "ftrk" }
	USSRWave8 = { "ttnk", "ttnk", "ttnk", "ttnk", "ftrk", "ftrk", "ftrk", "ftrk", "ftrk" }
	USSRWave9 = { "ttnk", "ttnk", "4tnk", "ftrk", "ftrk", "ftrk", "3tnk", "3tnk" }

	FirstTroopTime = DateTime.Minutes(2)

	EscapedUnitsNeeded = 150

	LastAttackUnits = 0
	LastAttackNumber = 30

end

	GreeceFleeingInfantryTypes = { "e1.slow", "e3.slow", "e6.slow", "medi.slow" }
	GreeceFleeingTanksTypes = { "2tnk.slow", "arty.slow", "1tnk.slow", "arty.slow", "1tnk.slow" }
	GreeceFleeingVehiclesTypes = { "truk.slow", "jeep.slow" }

	USSRAirType = { "yak" }
	USSRVehicleTypes = { "3tnk", "3tnk", "3tnk", "ftrk", "v2rl" }
	USSRInfantryTypes = { "e1", "e1", "e1", "e3", "e4" }
	USSRExtraTypes1 = { "e1", "e1", "e1", "e3", "e4" }
	USSRExtraTypes2 = { "e1", "e1", "e1", "e3", "e4", "3tnk", "v2rl" }
	USSRExtraTypes3 = { "e3", "e4", "3tnk", "v2rl" }
	USSRExtraTypes4 = { "3tnk", "v2rl", "ftrk", "shok", "ttnk" }

	USSRAttackerInfantryTypes = { "e1", "e3", "e4", "shok" }
	USSRAttackerVehicleTypes = { "3tnk", "v2rl", "ftrk", "apc" }

StartWaypoint =
{
	GreeceEntryPoint1,
	GreeceEntryPoint2,
	GreeceEntryPoint3,
	GreeceEntryPoint4,
	GreeceEntryPoint5,
}

MidWaypoint =
{
	GreeceMidPoint1,
	GreeceMidPoint2,
	GreeceMidPoint3,
	GreeceMidPoint4,
	GreeceMidPoint5,
}

EndWaypoint =
{
	GreeceRallyPoint1,
	GreeceRallyPoint2,
	GreeceRallyPoint3,
	GreeceRallyPoint4,
}

USSRStartWaypoint = {
	USSREntryPoint1,
	USSREntryPoint2,
	USSREntryPoint3,
	USSREntryPoint4,
}

USSRAttackpoints = {
	USSRAttackPoint1,
	USSRAttackPoint2,
}

USSRAttackpoints2 = {
	USSRAttackPoint3,
	USSRAttackPoint4,
}

CellTriggers1 =
{
	CPos.New(72,28), CPos.New(72,29), CPos.New(72,30), CPos.New(72,31), CPos.New(72,32), CPos.New(72,33), CPos.New(72,34), CPos.New(72,35), CPos.New(72,36), CPos.New(72,37), CPos.New(72,38),
}


ActorRemovals =
{
	easy = { },
	normal = { },
	hard = { },
}

NumberOfInfantry = 0
NumberOfTanks = 0
NumberOfVehicles = 0
NumberOfUSSR = 0
NumberOfAttackerInfantry = 0
NumberOfAttackerVehicles = 0

AlliedInfantry = 0
AlliedTanks = 0
AlliedVehicles = 0
AttackerInfantries = 0
AttackerVehicles = 0
USSRUnits = 0
VariableUSSR = 0

EscapedUnits = 0

ticked = FirstTroopTime

Wave = 0
AttackerWave = 0

-------------------------------------------------------------------------------------------------------------------------------------------------------------
--CONFIGURATION--
-------------------------------------------------------------------------------------------------------------------------------------------------------------
Tick = function()--Mostly timers for waves and attacks

	if WinConditionActivated and ussr.HasNoRequiredUnits() then
		player.MarkCompletedObjective(DefendBase)
	end

	if player.HasNoRequiredUnits() and not GameLost then
		GameLost = true
		ussr.MarkCompletedObjective(DestroyEnemies)
	end

	if EscapedUnits >= EscapedUnitsNeeded and not GameWon then
		GameWon = true
		DefendBase = player.AddPrimaryObjective("Defend the base against the remaining soviets.")
		player.MarkCompletedObjective(HelpEscaping)
		Trigger.AfterDelay(DateTime.Seconds(3), function()
			EnterLastSovietAttack()
			Trigger.AfterDelay(DateTime.Seconds(5), function()
				WinConditionActivated = true
			end)
		end)
	end

	Trigger.AfterDelay(DateTime.Seconds(5), function()
		if ticked > 0 then
			UserInterface.SetMissionText("First troop arrives in " .. Utils.FormatTime(ticked), player.Color)
			ticked = ticked - 1
		elseif ticked == 0 then
			ticked = ticked - 1

			SendWaves()												--Wave1

			Trigger.AfterDelay(DateTime.Seconds(100), function()	--Wave2
				SendWaves()
			end)

			Trigger.AfterDelay(DateTime.Seconds(175), function()	--Attacker Wave1
				SendAttackers()
			end)

			Trigger.AfterDelay(DateTime.Seconds(225), function()	--Wave3
				SendWaves()
			end)

			Trigger.AfterDelay(DateTime.Seconds(325), function()	--Wave4
				SendWaves()
			end)

			Trigger.AfterDelay(DateTime.Seconds(400), function()	--Attacker Wave2
				SendAttackers()
			end)

			Trigger.AfterDelay(DateTime.Seconds(475), function()	--Wave5
				SendWaves()
			end)

			Trigger.AfterDelay(DateTime.Seconds(575), function()	--Wave6
				SendWaves()
			end)

			Trigger.AfterDelay(DateTime.Seconds(675), function()	--Attacker Wave3
				SendAttackers()
			end)

			Trigger.AfterDelay(DateTime.Seconds(750), function()	--Wave7
				SendWaves()
			end)

			Trigger.AfterDelay(DateTime.Seconds(875), function()	--Wave8
				SendWaves()
			end)

			Trigger.AfterDelay(DateTime.Seconds(975), function()	--Attacker Wave4
				SendAttackers()
			end)

			Trigger.AfterDelay(DateTime.Seconds(1050), function()	--Wave9
				SendWaves()
			end)

			Trigger.AfterDelay(DateTime.Seconds(1175), function()	--Wave10 and higher
				SendWaves()
			end)

			FinishTimer()
		end
	end)

	Trigger.AfterDelay(DateTime.Seconds(12) + FirstTroopTime, function() UserInterface.SetMissionText(EscapedUnits .. "/" .. EscapedUnitsNeeded .. " units escaped", player.Color) end)

	if ussr.Resources >= ussr.ResourceCapacity * 0.75 then
		ussr.Cash = ussr.Cash + ussr.Resources - ussr.ResourceCapacity * 0.25
		ussr.Resources = ussr.ResourceCapacity * 0.25
	end

end

SendAttackers = function()--How many and which attackers

	AttackerWave = AttackerWave + 1

	Media.PlaySpeechNotification(player, "EnemyUnitsApproaching")

	if not GameWon then
		if AttackerWave == 1 then

			NumberOfAttackerInfantry = 0
			NumberOfAttackerVehicles = 0
			AttackerInfantries = 0
			AttackerVehicles = 0

			NumberOfAttackerInfantry = 6
			NumberOfAttackerVehicles = 4

			if Map.LobbyOption("difficulty") == "normal" then

				NumberOfAttackerInfantry = NumberOfAttackerInfantry + 3
				NumberOfAttackerVehicles = NumberOfAttackerVehicles + 2

			elseif Map.LobbyOption("difficulty") == "hard" then

				NumberOfAttackerInfantry = NumberOfAttackerInfantry + 5
				NumberOfAttackerVehicles = NumberOfAttackerVehicles + 4

			end

			USSRAttackerInfantry = USSRAttackerInfantryTypes
			USSRAttackerVehicles = USSRAttackerVehicleTypes

			EnterSovietAttackersInfantry()
			EnterSovietAttackersVehicles()

		elseif AttackerWave == 2 then

			NumberOfAttackerInfantry = 0
			NumberOfAttackerVehicles = 0
			AttackerInfantries = 0
			AttackerVehicles = 0

			NumberOfAttackerInfantry = 7
			NumberOfAttackerVehicles = 6

			if Map.LobbyOption("difficulty") == "normal" then

				NumberOfAttackerInfantry = NumberOfAttackerInfantry + 3
				NumberOfAttackerVehicles = NumberOfAttackerVehicles + 2

			elseif Map.LobbyOption("difficulty") == "hard" then

				NumberOfAttackerInfantry = NumberOfAttackerInfantry + 5
				NumberOfAttackerVehicles = NumberOfAttackerVehicles + 4

			end

			USSRAttackerInfantry = USSRAttackerInfantryTypes
			USSRAttackerVehicles = USSRAttackerVehicleTypes

			EnterSovietAttackersInfantry()
			EnterSovietAttackersVehicles()

		elseif AttackerWave == 3 then

			NumberOfAttackerInfantry = 0
			NumberOfAttackerVehicles = 0
			AttackerInfantries = 0
			AttackerVehicles = 0

			NumberOfAttackerInfantry = 14
			NumberOfAttackerVehicles = 10

			if Map.LobbyOption("difficulty") == "normal" then

				NumberOfAttackerInfantry = NumberOfAttackerInfantry + 5
				NumberOfAttackerVehicles = NumberOfAttackerVehicles + 4

			elseif Map.LobbyOption("difficulty") == "hard" then

				NumberOfAttackerInfantry = NumberOfAttackerInfantry + 8
				NumberOfAttackerVehicles = NumberOfAttackerVehicles + 4

			end

			USSRAttackerInfantry = USSRAttackerInfantryTypes
			USSRAttackerVehicles = USSRAttackerVehicleTypes

			EnterSovietAttackersInfantry()
			EnterSovietAttackersVehicles()

		elseif AttackerWave == 4 then

			NumberOfAttackerInfantry = 0
			NumberOfAttackerVehicles = 0
			AttackerInfantries = 0
			AttackerVehicles = 0

			NumberOfAttackerInfantry = 16
			NumberOfAttackerVehicles = 13

			if Map.LobbyOption("difficulty") == "normal" then

				NumberOfAttackerInfantry = NumberOfAttackerInfantry + 3
				NumberOfAttackerVehicles = NumberOfAttackerVehicles + 5

			elseif Map.LobbyOption("difficulty") == "hard" then

				NumberOfAttackerInfantry = NumberOfAttackerInfantry + 5
				NumberOfAttackerVehicles = NumberOfAttackerVehicles + 5

			end

			USSRAttackerInfantry = USSRAttackerInfantryTypes
			USSRAttackerVehicles = USSRAttackerVehicleTypes

			EnterSovietAttackersInfantry()
			EnterSovietAttackersVehicles()

		end
	end

end

SendWaves = function()--How many units and which a wave

	Wave = Wave + 1

	if not GameWon then
		Media.PlaySpeechNotification(player, "AlliedForcesApproaching")

		Beacon.New(greece, GreeceEntryPoint3.CenterPosition)
	end

	--if Wave == 1 then
	--	Media.Debug("Wave 1")
	--elseif Wave == 2 then
	--	Media.Debug("Wave 2")
	--elseif Wave == 3 then 
	--	Media.Debug("Wave 3")
	--elseif Wave == 4 then
	--	Media.Debug("Wave 4")
	--elseif Wave == 5 then
	--	Media.Debug("Wave 5")
	--elseif Wave == 6 then
	--	Media.Debug("Wave 6")
	--elseif Wave == 7 then
	--	Media.Debug("Wave 7")
	--elseif Wave == 8 then
	--	Media.Debug("Wave 8")
	--elseif Wave == 9 then
	--	Media.Debug("Wave 9")
	--elseif Wave >= 10 then
	--	Media.Debug("Wave 10 or higher")
	--end

	if not GameWon then
		if Wave == 1 then

			NumberOfInfantry = 0
			NumberOfTanks = 0
			NumberOfVehicles = 0
			NumberOfUSSR = 0

			AlliedInfantry = 0
			AlliedTanks = 0
			AlliedVehicles = 0
			USSRUnits = 0

			NumberOfInfantry = 10
			NumberOfTanks = 5
			NumberOfVehicles = 3
			NumberOfUSSR = 9
			ussrteam = USSRWave1


			EnterAlliedInfantry()
			EnterAlliedTanks()
			EnterAlliedVehicles()
			SendSovietWaves()
			EnterSovietExtra()

		elseif Wave == 2 then

			NumberOfInfantry = 0
			NumberOfTanks = 0
			NumberOfVehicles = 0
			NumberOfUSSR = 0

			AlliedInfantry = 0
			AlliedTanks = 0
			AlliedVehicles = 0
			USSRUnits = 0

			NumberOfInfantry = 13
			NumberOfTanks = 7
			NumberOfVehicles = 4
			NumberOfUSSR = 10
			ussrteam = USSRWave2

			EnterAlliedInfantry()
			EnterAlliedTanks()
			EnterAlliedVehicles()
			SendSovietWaves()
			EnterSovietExtra()

		elseif Wave == 3 then

			NumberOfInfantry = 0
			NumberOfTanks = 0
			NumberOfVehicles = 0
			NumberOfUSSR = 0

			AlliedInfantry = 0
			AlliedTanks = 0
			AlliedVehicles = 0
			USSRUnits = 0

			NumberOfInfantry = 10
			NumberOfTanks = 5
			NumberOfVehicles = 9
			NumberOfUSSR = 12
			ussrteam = USSRWave3

			EnterAlliedInfantry()
			EnterAlliedTanks()
			EnterAlliedVehicles()
			SendSovietWaves()
			EnterSovietExtra()

		elseif Wave == 4 then

			NumberOfInfantry = 0
			NumberOfTanks = 0
			NumberOfVehicles = 0
			NumberOfUSSR = 0

			AlliedInfantry = 0
			AlliedTanks = 0
			AlliedVehicles = 0
			USSRUnits = 0

			NumberOfInfantry = 8
			NumberOfTanks = 3
			NumberOfVehicles = 12
			NumberOfUSSR = 10
			ussrteam = USSRWave4

			EnterAlliedInfantry()
			EnterAlliedTanks()
			EnterAlliedVehicles()
			SendSovietWaves()
			EnterSovietExtra()

		elseif Wave == 5 then

			NumberOfInfantry = 0
			NumberOfTanks = 0
			NumberOfVehicles = 0
			NumberOfUSSR = 0

			AlliedInfantry = 0
			AlliedTanks = 0
			AlliedVehicles = 0
			USSRUnits = 0

			NumberOfInfantry = 12
			NumberOfTanks = 2
			NumberOfVehicles = 9
			NumberOfUSSR = 6
			ussrteam = USSRWave5

			EnterAlliedInfantry()
			EnterAlliedTanks()
			EnterAlliedVehicles()
			SendSovietWaves()
			EnterSovietExtra()

		elseif Wave == 6 then

			NumberOfInfantry = 0
			NumberOfTanks = 0
			NumberOfVehicles = 0
			NumberOfUSSR = 0

			AlliedInfantry = 0
			AlliedTanks = 0
			AlliedVehicles = 0
			USSRUnits = 0

			NumberOfInfantry = 16
			NumberOfTanks = 2
			NumberOfVehicles = 6
			NumberOfUSSR = 8
			ussrteam = USSRWave6

			EnterAlliedInfantry()
			EnterAlliedTanks()
			EnterAlliedVehicles()
			SendSovietWaves()
			EnterSovietExtra()

		elseif Wave == 7 then

			NumberOfInfantry = 0
			NumberOfTanks = 0
			NumberOfVehicles = 0
			NumberOfUSSR = 0

			AlliedInfantry = 0
			AlliedTanks = 0
			AlliedVehicles = 0
			USSRUnits = 0

			NumberOfInfantry = 16
			NumberOfTanks = 2
			NumberOfVehicles = 6
			NumberOfUSSR = 10
			ussrteam = USSRWave7

			EnterAlliedInfantry()
			EnterAlliedTanks()
			EnterAlliedVehicles()
			SendSovietWaves()
			EnterSovietExtra()

		elseif Wave == 8 then

			NumberOfInfantry = 0
			NumberOfTanks = 0
			NumberOfVehicles = 0
			NumberOfUSSR = 0

			AlliedInfantry = 0
			AlliedTanks = 0
			AlliedVehicles = 0
			USSRUnits = 0

			NumberOfInfantry = 16
			NumberOfTanks = 0
			NumberOfVehicles = 8
			NumberOfUSSR = 12
			ussrteam = USSRWave8

			EnterAlliedInfantry()
			--EnterAlliedTanks()
			EnterAlliedVehicles()
			SendSovietWaves()
			EnterSovietExtra()

		elseif Wave == 9 then

			NumberOfInfantry = 0
			NumberOfTanks = 0
			NumberOfVehicles = 0
			NumberOfUSSR = 0

			AlliedInfantry = 0
			AlliedTanks = 0
			AlliedVehicles = 0
			USSRUnits = 0

			NumberOfInfantry = 16
			NumberOfTanks = 0
			NumberOfVehicles = 8
			NumberOfUSSR = 14
			ussrteam = USSRWave9

			EnterAlliedInfantry()
			--EnterAlliedTanks()
			EnterAlliedVehicles()
			SendSovietWaves()
			EnterSovietExtra()

		elseif Wave >= 10 then

			NumberOfInfantry = 0
			NumberOfTanks = 0
			NumberOfVehicles = 0
			NumberOfUSSR = 0

			AlliedInfantry = 0
			AlliedTanks = 0
			AlliedVehicles = 0
			USSRUnits = 0

			NumberOfInfantry = 20
			NumberOfTanks = 0
			NumberOfVehicles = 5
			NumberOfUSSR = 16 + VariableUSSR
			ussrteam = USSRWave9

			EnterAlliedInfantry()
			--EnterAlliedTanks()
			EnterAlliedVehicles()
			SendSovietWaves()
			EnterSovietExtra()

			VariableUSSR = VariableUSSR + 4--More and more enemies as time goes

			Trigger.AfterDelay(DateTime.Seconds(125), SendWaves)

		end
	end

end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
--END CONFIGURATION--
-------------------------------------------------------------------------------------------------------------------------------------------------------------

EnterLastSovietAttack = function()
	if LastAttackUnits < LastAttackNumber then		
		LastAttackUnits = LastAttackUnits + 1
		if LastAttackUnits > LastAttackNumber then
			LastAttackUnits = 0
		else
			Trigger.AfterDelay(DateTime.Seconds(1.2), EnterLastSovietAttack)
			Trigger.AfterDelay(DateTime.Seconds(1.2), FinalSovietAttack)
		end
	end
end

EnterSovietAttackersVehicles = function()
	if AttackerVehicles < NumberOfAttackerVehicles then		
		AttackerVehicles = AttackerVehicles + 1
		if AttackerVehicles > NumberOfAttackerVehicles then
			AttackerVehicles = 0
		else
			Trigger.AfterDelay(DateTime.Seconds(1.2), EnterSovietAttackersVehicles)
			Trigger.AfterDelay(DateTime.Seconds(1.2), SendSovietAttackersVehicles)
		end
	end
end

EnterSovietAttackersInfantry = function()
	if AttackerInfantries < NumberOfAttackerInfantry then		
		AttackerInfantries = AttackerInfantries + 1
		if AttackerInfantries > NumberOfAttackerInfantry then
			AttackerInfantries = 0
		else
			Trigger.AfterDelay(DateTime.Seconds(1.2), EnterSovietAttackersInfantry)
			Trigger.AfterDelay(DateTime.Seconds(1.2), SendSovietAttackersInfantry)
		end
	end
end

EnterSovietExtra = function()
	if USSRUnits < NumberOfUSSR then		
		USSRUnits = USSRUnits + 1
		if USSRUnits > NumberOfUSSR then
			USSRUnits = 0
		else
			Trigger.AfterDelay(DateTime.Seconds(1.2), EnterSovietExtra)
			Trigger.AfterDelay(DateTime.Seconds(1.2), SendSovietExtraWaves)
		end
	end
end

EnterAlliedInfantry = function()
	if AlliedInfantry < NumberOfInfantry then		
		AlliedInfantry = AlliedInfantry + 1
		if AlliedInfantry > NumberOfInfantry then
			AlliedInfantry = 0
		else
			Trigger.AfterDelay(DateTime.Seconds(1.2), EnterAlliedInfantry)
			Trigger.AfterDelay(DateTime.Seconds(1.2), SendGreeceInfantry)
		end
	end
end

EnterAlliedTanks = function()
	if AlliedTanks < NumberOfTanks then		
		AlliedTanks = AlliedTanks + 1
		if AlliedTanks > NumberOfTanks then
			AlliedTanks = 0
		else
			Trigger.AfterDelay(DateTime.Seconds(3), EnterAlliedTanks)
			Trigger.AfterDelay(DateTime.Seconds(3), SendGreeceTanks)
		end
	end
end

EnterAlliedVehicles = function()
	if AlliedVehicles < NumberOfVehicles then		
		AlliedVehicles = AlliedVehicles + 1
		if AlliedVehicles > NumberOfVehicles then
			AlliedVehicles = 0
		else
			Trigger.AfterDelay(DateTime.Seconds(2), EnterAlliedVehicles)
			Trigger.AfterDelay(DateTime.Seconds(2), SendGreeceVehicles)
		end
	end
end

FinishTimer = function()
	for i = 0, 5, 1 do
		local c = player.Color
		if i % 2 == 0 then
			c = HSLColor.White
		end

		Trigger.AfterDelay(DateTime.Seconds(i), function() UserInterface.SetMissionText("Troop has arrived!", c) end)
	end
end

WorldLoaded = function()

	GameWon = false
	GameLost = false
	WinConditionActivated = false

	player = Player.GetPlayer("England")
	ussr = Player.GetPlayer("USSR")
	greece = Player.GetPlayer("Greece")

	Camera.Position = StartPosition.CenterPosition

	local difficulty = Map.LobbyOption("difficulty")

	IdleUnitsLogic()
	InitObjectives()
	Triggers()
	RemoveActors()

	Trigger.AfterDelay(DateTime.Seconds(5), function()
		Media.PlaySpeechNotification(player, "TimerStarted")
	end)

end

InitObjectives = function()
	Trigger.OnObjectiveAdded(player, function(p, id)
		Media.DisplayMessage(p.GetObjectiveDescription(id), "New " .. string.lower(p.GetObjectiveType(id)) .. " objective")
	end)

	DestroyEnemies = ussr.AddPrimaryObjective("Destroy all enemy forces.")
	HelpEscaping = player.AddPrimaryObjective("Help the incoming allied forces to escape.")

	Trigger.OnObjectiveCompleted(player, function(p, id)
		Media.DisplayMessage(p.GetObjectiveDescription(id), "Objective completed")
	end)
	Trigger.OnObjectiveFailed(player, function(p, id)
		Media.DisplayMessage(p.GetObjectiveDescription(id), "Objective failed")
	end)

	Trigger.OnPlayerLost(player, function()
		Trigger.AfterDelay(DateTime.Seconds(1), function()
			Media.PlaySpeechNotification(player, "MissionFailed")
		end)
	end)
	Trigger.OnPlayerWon(player, function()
		Trigger.AfterDelay(DateTime.Seconds(1), function()
			Media.PlaySpeechNotification(player, "MissionAccomplished")
		end)
	end)
end

RemoveActors = function()
	Utils.Do(ActorRemovals[Map.LobbyOption("difficulty")], function(unit)
		unit.Destroy()
	end)
end

Triggers = function ()

	Trigger.OnEnteredFootprint(CellTriggers1, function(a, id)
		if a.Owner == greece then
			if not a.IsDead then
				a.Destroy()
				EscapedUnits = EscapedUnits + 1
			end
		end
	end)

end