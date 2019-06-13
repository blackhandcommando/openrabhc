--[[

--]]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

if Map.LobbyOption("difficulty") == "easy" then

	DifficultyDelay = DateTime.Minutes(2.0)

elseif Map.LobbyOption("difficulty") == "normal" then

	DifficultyDelay = DateTime.Minutes(1)

elseif Map.LobbyOption("difficulty") == "hard" then

	DifficultyDelay = DateTime.Seconds(5)

end

ActorRemovals =
{
	easy = { },
	normal = { },
	hard = { },
}

--Greece spawns once the outpost is completely destroyed
USSROutpost = { Actor1217, Actor106, Actor96, Actor107, Actor108, Actor79, Actor110, Actor99, Actor100, Actor77, Actor101, Actor102, Actor109, Actor97, Actor98, Actor82, Actor104, Actor105, Actor103, Actor95 }

USSRAirfields = { Actor863, Actor864, Actor865, Actor926, Actor927, Actor968 }
USSRSecondBase = { Actor54, Actor755, Actor786, Actor720, Actor721, Actor722 }
USSRSuperweapons = { Actor65, Actor64 }


-------------------------------------------------------------------------------------------------------------------------------------------------------------

Tick = function()
	if player.HasNoRequiredUnits() and not GameLost then
		GameLost = true
		ussr.MarkCompletedObjective(DestroyEnemies)
	end

	if ussr.HasNoRequiredUnits() and nuker.HasNoRequiredUnits() and not GameWon then
		GameWon = true
		player.MarkCompletedObjective(EliminateAllEnemies)
	end

	if OutpostDestroyed or SecondBaseDestroyed or AirfieldsDestroyed then
		if DemoTruck and not DemoTruckSpawned then
			DemoTruckSpawned = true
			Trigger.AfterDelay(DateTime.Minutes(1), function()
				Media.DisplayMessage("WARNING: Trucks armed with nuclear explosives detected.")
				USSRDemolitonTruck()
			end)
		end
	end

	if Greece.Resources >= Greece.ResourceCapacity * 0.75 then
		Greece.Cash = Greece.Cash + Greece.Resources - Greece.ResourceCapacity * 0.25
		Greece.Resources = Greece.ResourceCapacity * 0.25
	end

	if ussr.Resources >= ussr.ResourceCapacity * 0.75 then
		ussr.Cash = ussr.Cash + ussr.Resources - ussr.ResourceCapacity * 0.25
		ussr.Resources = ussr.ResourceCapacity * 0.25
	end

	if ussr_2.Resources >= ussr_2.ResourceCapacity * 0.75 then
		ussr_2.Cash = ussr_2.Cash + ussr_2.Resources - ussr_2.ResourceCapacity * 0.25
		ussr_2.Resources = ussr_2.ResourceCapacity * 0.25
	end
end

WorldLoaded = function()

	AirfieldsDestroyed = false
	DemoTruck = false
	DemoTruckSpawned = false
	FComInfiltrated = false
	GameLost = false
	GameWon = false

	GreeceISentEverything = false
	GreeceMCVExists = true
	GreeceNavalPatrol1 = false
	OutpostDestroyed = false
	SecondBaseDestroyed = false

	USSR1ISentEverything = false
	USSR1InfantryProductionActivated = false
	USSR1VehicleProductionActivated = false
	USSR2ISentEverything = false
	USSR2InfantryProductionActivated = false
	USSR2VehicleProductionActivated = false
	USSR2NavalProductionActivated = false
	USSR2NavalPatrol1 = false

	VolkovDead = true

	USSR1BuildingsBuilt = 0
	USSR2BuildingsBuilt = 0

	player = Player.GetPlayer("England")
	Greece = Player.GetPlayer("Greece")
	ussr = Player.GetPlayer("USSR")
	ussr_2 = Player.GetPlayer("USSR_2")
	nuker = Player.GetPlayer("Nuker")

	Camera.Position = Actor126.CenterPosition

	player.Cash = player.Cash + 7500

	Actor1115.Stance = "AttackAnything"
	Actor1116.Stance = "AttackAnything"
	Actor1117.Stance = "AttackAnything"
	Actor1118.Stance = "AttackAnything"
	Actor1119.Stance = "AttackAnything"
	Actor1120.Stance = "AttackAnything"
	Actor1121.Stance = "AttackAnything"
	Actor1122.Stance = "AttackAnything"
	Actor1123.Stance = "Defend"
	Actor1124.Stance = "Defend"
	Actor1125.Stance = "Defend"
	Actor1126.Stance = "Defend"
	Actor1127.Stance = "Defend"
	Actor1128.Stance = "Defend"
	Actor1137.Stance = "Defend"
	Actor1138.Stance = "Defend"
	Actor1139.Stance = "Defend"
	Actor1140.Stance = "Defend"
	Actor1141.Stance = "Defend"

	Vision1 = Actor.Create('camera', true, { Owner = player, Location = Actor17.Location })
	Vision1.Destroy()
	Vision4 = Actor.Create('camera', true, { Owner = player, Location = Actor1106.Location })
	Vision4.Destroy()

	InitObjectives()
	Triggers()
	RemoveActors()

	USSR1BuildBase(Actor587)
	USSRIdleUnitsLogic()
	USSRRepairBase()
	USSR1SendPatrols()
	USSRTriggersAI()

	USSR2BuildBase(Actor54)
	USSR2IdleUnitsLogic()
	USSR2RepairBase()
	USSR2SendPatrols()
	USSR2TriggersAI()

end

InitObjectives = function()
	Trigger.OnObjectiveAdded(player, function(p, id)
		Media.DisplayMessage(p.GetObjectiveDescription(id), "New " .. string.lower(p.GetObjectiveType(id)) .. " objective")
	end)

	DestroyEnemies = ussr.AddPrimaryObjective("Infiltrate the soviet tech center near your position.")
	InfiltrateFCom = player.AddPrimaryObjective("Infiltrate or capture the soviet HQ.")
	DestroySuperweapons = player.AddPrimaryObjective("Destroy all soviet superweapons in this area.")
	DestroySovietOutpost = player.AddSecondaryObjective("Soviets are blocking off our allies entering this area.\nDestroy the soviet outpost to the east.")

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

Triggers = function()

	Trigger.AfterDelay(DifficultyDelay, function()
		Trigger.AfterDelay(DateTime.Seconds(10), function()
			SendAttackers1USSR1()
			SendAttackers1USSR2()
		end)

		Trigger.AfterDelay(DateTime.Seconds(140), function()
			Vision2 = Actor.Create('camera', true, { Owner = player, Location = Actor54.Location })
			Vision2.Destroy()
			DestroySecondSoviet = player.AddSecondaryObjective("We located heavy soviet troop movements.\nDestroy the soviet base to the north-west.")
			USSR2StartAI()
			SendAttackers2USSR1()
			SendAttackers2USSR2()
		end)

		Trigger.AfterDelay(DateTime.Seconds(220), function()
			SendAttackers1USSR2()
			SendAttackers2USSR2()
		end)

		Trigger.AfterDelay(DateTime.Seconds(400), function()
			Actor64.Owner = nuker
			USSR1StartAI()
			SendAttackers1USSR1()
			SendAttackers1USSR2()
			Trigger.AfterDelay(DateTime.Seconds(40), function()
				IronCurtainLoop()
			end)
		end)

		Trigger.AfterDelay(DateTime.Seconds(650), function()
			Vision3 = Actor.Create('camera', true, { Owner = player, Location = Actor864.Location })
			Vision3.Destroy()
			DestroyAirfields = player.AddSecondaryObjective("The soviets prepared their airforce to the north-east.\nDestroy the airfields to stop their air-superiority.")
			USSR1AirProduction()
			USSR1SendAirforceLoop()
		end)

		Trigger.AfterDelay(DateTime.Seconds(1000), function()
			--Demotruck will trigger now if at least 1 secondary objective is completed
			DemoTruck = true
		end)

		Trigger.AfterDelay(DateTime.Seconds(1750), function()
			if Map.LobbyOption("difficulty") ~= "easy" then
				USSRLargeAttack()
			end
		end)
	end)

	Trigger.OnAllKilled(USSROutpost, function()
		OutpostDestroyed = true
		player.MarkCompletedObjective(DestroySovietOutpost)
		Trigger.AfterDelay(DateTime.Seconds(10), function()
			Media.PlaySpeechNotification(player, "AlliedForcesApproaching")
			GreeceStartAI()
		end)
	end)

	Trigger.OnAllKilled(USSRAirfields, function()
		AirfieldsDestroyed = true
		player.MarkCompletedObjective(DestroyAirfields)
		--Also stop parabombs and paratroopers
		Actor1262.Destroy()
		Actor1263.Destroy()
	end)

	Trigger.OnAllKilled(USSRSecondBase, function()
		SecondBaseDestroyed = true
		player.MarkCompletedObjective(DestroySecondSoviet)
	end)

	Trigger.OnAllKilled(USSRSuperweapons, function()
		player.MarkCompletedObjective(DestroySuperweapons)
	end)

	Trigger.OnInfiltrated(Actor17, function()
		if not FComInfiltrated then
			FComInfiltrated = true
			player.MarkCompletedObjective(InfiltrateFCom)
		end
	end)

	Trigger.OnCapture(Actor17, function()
		if not FComInfiltrated then
			FComInfiltrated = true
			player.MarkCompletedObjective(InfiltrateFCom)
		end
	end)

	Trigger.OnKilled(Actor17, function()
		if not FComInfiltrated then
			player.MarkFailedObjective(InfiltrateFCom)
		end
	end)

end
