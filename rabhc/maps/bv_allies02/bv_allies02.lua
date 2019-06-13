--[[

--]]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

if Map.LobbyOption("difficulty") == "easy" then

	AirMinAttackForce = 1
	AirMaxAttackForce = 1

	InfantryMinAttackForce = 2
	InfantryMaxAttackForce = 5

	VehicleMinAttackForce = 2
	VehicleMaxAttackForce = 4

	AirDelay = DateTime.Seconds(60)
	InfantryDelay = DateTime.Seconds(20)
	VehicleDelay = DateTime.Seconds(60)

	USSRAirType = { "yak.ai" }
	USSRVehicleTypes = { "3tnk", "ftrk", "ftrk" }
	USSRInfantryTypes = { "e1", "e1", "e1" }

	USSRReinforcementTroop1 = {  }
	USSRReinforcementTroop2 = { "3tnk", "3tnk", "v2rl" }
	USSRReinforcementTroop3 = { "3tnk", "3tnk", "v2rl", "v2rl", "e1", "e1", "e1", "e1" }

elseif Map.LobbyOption("difficulty") == "normal" then

	AirMinAttackForce = 1
	AirMaxAttackForce = 1

	InfantryMinAttackForce = 4
	InfantryMaxAttackForce = 8

	VehicleMinAttackForce = 3
	VehicleMaxAttackForce = 7

	AirDelay = DateTime.Seconds(45)
	InfantryDelay = DateTime.Seconds(10)
	VehicleDelay = DateTime.Seconds(30)

	USSRAirType = { "yak.ai" }
	USSRVehicleTypes = { "3tnk", "3tnk", "ftrk" }
	USSRInfantryTypes = { "e1", "e1", "e3" }

	USSRReinforcementTroop1 = { "3tnk", "3tnk", "v2rl" }
	USSRReinforcementTroop2 = { "3tnk", "3tnk", "3tnk", "v2rl", "3tnk", "v2rl" }
	USSRReinforcementTroop3 = { "3tnk", "3tnk", "3tnk", "e1", "e1", "e1", "e1", "e1", "3tnk", "e1", "e1", "e1", "e1" }

elseif Map.LobbyOption("difficulty") == "hard" then

	AirMinAttackForce = 1
	AirMaxAttackForce = 1

	InfantryMinAttackForce = 5
	InfantryMaxAttackForce = 12

	VehicleMinAttackForce = 3
	VehicleMaxAttackForce = 10

	AirDelay = DateTime.Seconds(45)
	InfantryDelay = DateTime.Seconds(10)
	VehicleDelay = DateTime.Seconds(30)

	USSRAirType = { "yak.ai" }
	USSRVehicleTypes = { "3tnk", "3tnk", "ftrk", "v2rl" }
	USSRInfantryTypes = { "e1", "e1", "e3", "e4" }

	USSRReinforcementTroop1 = { "3tnk", "3tnk", "3tnk", "v2rl", "3tnk", "v2rl" }
	USSRReinforcementTroop2 = { "3tnk", "3tnk", "3tnk", "v2rl", "3tnk", "3tnk", "3tnk", "v2rl" }
	USSRReinforcementTroop3 = { "3tnk", "3tnk", "3tnk", "e1", "e1", "e1", "e1", "e1", "3tnk", "3tnk", "e1", "e1", "e1", "e1", "e1" }

end

TimerTicks = DateTime.Minutes(15)
TenMinutes = DateTime.Minutes(10)
FiveMinutes = DateTime.Minutes(5)
FourMinutes = DateTime.Minutes(4)
ThreeMinutes = DateTime.Minutes(3)
TwoMinutes = DateTime.Minutes(2)
OneMinute = DateTime.Minutes(1)
ScientistsRescuing = 0
ScientistsEvacuated = 0

USSRV2 = { "v2rl" }
Harvester = { "harv" }

Yaks = { }
USSRInfantryAttack = { }
USSRVehicleAttack = { }

PatrolDudes = { Actor190, Actor191, Actor194, Actor195 }
PatrolPath = { PatrolPoint1.Location, PatrolPoint2.Location, PatrolPoint3.Location }

USSRFirstTroopUnits = { USSRStartTroopie1, USSRStartTroopie2, USSRStartTroopie3, USSRStartTroopie4, USSRStartTroopie5, USSRStartTroopie6 }
USSRScientistTroop1 = { Actor94, Actor96, Actor97, Actor98, Actor99 }
USSRScientistTroop2 = { Actor81, USSRBarracks1, Actor104, Actor131, Actor132, Actor130, Actor133, Actor134, Actor82 }
USSRScientistTroop3 = { Actor205, Actor201, Actor150, Actor165 }

Scientist1 = { Actor182 }
Scientist2 = { Actor181 }
Scientist3 = { Actor183 }
Scientists = { Actor181, Actor182, Actor183 }
Scientist3Extra = { Actor184, Actor185 }

CYard = { cyard }

AttackPos =
{
	AttackPos1,
	AttackPos2,
	AttackPos3,
}

AttackPosAir =
{
	AttackPos1,
	AttackPos2,
	AttackPos3,
	Attackpos5,
	Attackpos5,
	Attackpos5,
}

CellTriggers1 =
{
	CPos.New(3,75), CPos.New(3,76), CPos.New(3,77), CPos.New(3,78), CPos.New(3,79),
}

ActorRemovals =
{
	easy = { Actor144 },
	normal = { Actor144 },
	hard = { },
}

-------------------------------------------------------------------------------------------------------------------------------------------------------------

ticked = TimerTicks
TimerAborted = false
Tick = function()
	if player.HasNoRequiredUnits() and not GameLost then
		GameLost = true
		ussr.MarkCompletedObjective(DestroyEnemies)
	end

	if Map.LobbyOption("difficulty") == "hard" then
		Trigger.AfterDelay(DateTime.Seconds(10), function()
			if ticked > 0 then
				UserInterface.SetMissionText("Scientists are executed in " .. Utils.FormatTime(ticked), TimerColor)
				ticked = ticked - 1
			elseif ticked == 0 then
				ticked = ticked - 1
				GameLost = true
				FinishTimer()
			end
		end)
	end

	if ScientistsRescuing == 3 and not TimerAborted then
		Media.PlaySpeechNotification(player, "TimerStopped")
		TimerAborted = true
		ticked = 0
		UserInterface.SetMissionText("")
	end

	if ussr.Resources >= ussr.ResourceCapacity * 0.75 then
		ussr.Cash = ussr.Cash + ussr.Resources - ussr.ResourceCapacity * 0.25
		ussr.Resources = ussr.ResourceCapacity * 0.25
	end

end

FinishTimer = function()
	if ScientistsRescuing < 3 then
		for i = 0, 5, 1 do
			local c = TimerColor
			if i % 2 == 0 then
				c = HSLColor.White
			end

			Trigger.AfterDelay(DateTime.Seconds(i), function() UserInterface.SetMissionText("Scientists have been executed!", c) end)
		end
		Trigger.AfterDelay(DateTime.Seconds(6), function() 
			UserInterface.SetMissionText("")
			ussr.MarkCompletedObjective(DestroyEnemies)
			player.MarkFailedObjective(RescueScientists)
			player.MarkFailedObjective(Keepalive)
			player.MarkFailedObjective(DestroyBase)
		end)
	end
end

WorldLoaded = function()

	Actor235.Destroy()
	Actor236.Destroy()
	Actor237.Destroy()

	GameWon = false
	GameLost = false

	C1Rescued = false
	C2Rescued = false
	C3Rescued = false

	player = Player.GetPlayer("England")
	greece = Player.GetPlayer("Greece")
	ussr = Player.GetPlayer("USSR")

	TimerColor = ussr.Color

	Camera.Position = StartPosition.CenterPosition

	local difficulty = Map.LobbyOption("difficulty")

	USSRFirstTroop()
	EvacuateScientist()
	IdleUnitsLogic()--for ussr ai
	InitObjectives()
	Triggers()
	RemoveActors()
	Trigger.AfterDelay(DateTime.Seconds(60), function() AirProduction() end)
	BuildBase(cyard)
	InfantryProduction()
	RepairBase()
	VehicleProduction()

end

InitObjectives = function()
	Trigger.OnObjectiveAdded(player, function(p, id)
		Media.DisplayMessage(p.GetObjectiveDescription(id), "New " .. string.lower(p.GetObjectiveType(id)) .. " objective")
	end)

	DestroyEnemies = ussr.AddPrimaryObjective("Destroy all enemy forces.")
	RescueScientists = player.AddPrimaryObjective("Escort the prisoned scientists to the exfiltration point.")
	Keepalive = player.AddPrimaryObjective("All scientists must survive.")
	DestroyBase = player.AddSecondaryObjective("Destroy the soviet conyard.")

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

	Trigger.OnAllKilled(CYard, function()
		player.MarkCompletedObjective(DestroyBase)
	end)

	Trigger.OnAllKilled(USSRScientistTroop1, function()
		ScientistsRescuing = ScientistsRescuing + 1
		Utils.Do(Scientist1, function(actor)
			actor.Owner = player
		end)
		if ScientistsRescuing == 1 then
			if Map.LobbyOption("difficulty") == "normal" or Map.LobbyOption("difficulty") == "hard" then
				Trigger.AfterDelay(DateTime.Seconds(10), function()
					USSRReinforcements1()
					Media.PlaySpeechNotification(player, "EnemyUnitsApproaching")
				end)
			end
		elseif ScientistsRescuing == 2 then
			Trigger.AfterDelay(DateTime.Seconds(10), function()
				USSRReinforcements2()
				Media.PlaySpeechNotification(player, "EnemyUnitsApproaching")
			end)
		elseif ScientistsRescuing == 3 then
			Trigger.AfterDelay(DateTime.Seconds(10), function()
				USSRReinforcements3()
				Media.PlaySpeechNotification(player, "EnemyUnitsApproaching")
			end)
		end
	end)

	Trigger.OnAllKilled(USSRScientistTroop2, function()
		ScientistsRescuing = ScientistsRescuing + 1
		Utils.Do(Scientist2, function(actor)
			actor.Owner = player
		end)
		USSRSendV2()
		if ScientistsRescuing == 1 then
			if Map.LobbyOption("difficulty") == "normal" or Map.LobbyOption("difficulty") == "hard" then
				Trigger.AfterDelay(DateTime.Seconds(10), function()
					USSRReinforcements1()
					Media.PlaySpeechNotification(player, "EnemyUnitsApproaching")
				end)
			end
		elseif ScientistsRescuing == 2 then
			Trigger.AfterDelay(DateTime.Seconds(10), function()
				USSRReinforcements2()
				Media.PlaySpeechNotification(player, "EnemyUnitsApproaching")
			end)
		elseif ScientistsRescuing == 3 then
			Trigger.AfterDelay(DateTime.Seconds(10), function()
				USSRReinforcements3()
				Media.PlaySpeechNotification(player, "EnemyUnitsApproaching")
			end)
		end
	end)

	Trigger.OnAllKilled(USSRScientistTroop3, function()
		ScientistsRescuing = ScientistsRescuing + 1
		Utils.Do(Scientist3, function(actor1) 
			actor1.Owner = player
		end)
		Utils.Do(Scientist3Extra, function(actor2)
			actor2.Owner = player
		end)
		if ScientistsRescuing == 1 then
			if Map.LobbyOption("difficulty") == "normal" or Map.LobbyOption("difficulty") == "hard" then
				Trigger.AfterDelay(DateTime.Seconds(10), function()
					USSRReinforcements1()
					Media.PlaySpeechNotification(player, "EnemyUnitsApproaching")
				end)
			end
		elseif ScientistsRescuing == 2 then
			Trigger.AfterDelay(DateTime.Seconds(10), function()
				USSRReinforcements2()
				Media.PlaySpeechNotification(player, "EnemyUnitsApproaching")
			end)
		elseif ScientistsRescuing == 3 then
			Trigger.AfterDelay(DateTime.Seconds(10), function()
				USSRReinforcements3()
				Media.PlaySpeechNotification(player, "EnemyUnitsApproaching")
			end)
		end
	end)

	Trigger.OnAnyKilled(Scientists, function()
		player.MarkFailedObjective(RescueScientists)
		player.MarkFailedObjective(Keepalive)
	end)

	if Map.LobbyOption("difficulty") == "hard" then
		Trigger.AfterDelay(DateTime.Seconds(10), function()
			Trigger.AfterDelay(DateTime.Seconds(1), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "TimerStarted") end
			end)
			Trigger.AfterDelay(DateTime.Minutes(5), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "TenMinutesRemaining") end
			end)
			Trigger.AfterDelay(DateTime.Minutes(10), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "WarningFiveMinutesRemaining") end
			end)
			Trigger.AfterDelay(DateTime.Minutes(11), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "WarningFourMinutesRemaining") end
			end)
			Trigger.AfterDelay(DateTime.Minutes(12), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "WarningThreeMinutesRemaining") end
			end)
			Trigger.AfterDelay(DateTime.Minutes(13), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "WarningTwoMinutesRemaining") end
			end)
			Trigger.AfterDelay(DateTime.Minutes(14), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "WarningOneMinuteRemaining") end
			end)
		end)
	end

end

EvacuateScientist = function()
	Trigger.OnEnteredProximityTrigger(Actor240.CenterPosition, WDist.FromCells(5), function(actor)
		if actor.Type == "c1.ob" or actor.Type == "c2.ob" or actor.Type == "c3.ob" then
			Media.PlaySpeechNotification(player, "TargetRescued")
			actor.Owner = greece
			Trigger.OnIdle(actor, function()
				actor.Stop()
				actor.ScriptedMove(Actor252.Location)
				actor.Destroy()
			end)
			if actor.Type == "c1.ob" and not C1Rescued then
				C1Rescued = true
				ScientistsEvacuated = ScientistsEvacuated + 1
			elseif actor.Type == "c2.ob" and not C2Rescued then
				C2Rescued = true
				ScientistsEvacuated = ScientistsEvacuated + 1
			elseif actor.Type == "c3.ob" and not C3Rescued then
				C3Rescued = true
				ScientistsEvacuated = ScientistsEvacuated + 1
			end
		end
		
		if ScientistsEvacuated >= 3 then
			player.MarkCompletedObjective(RescueScientists)
			player.MarkCompletedObjective(Keepalive)
		end
	end)
end