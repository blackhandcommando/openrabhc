--[[

--]]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

if Map.LobbyOption("difficulty") == "easy" then

	StartTeam = { "dd", "dd", "pt" }

	USSRFirstAttack = { "ttnk", "ttnk" }
	USSRYaks = { "yak", "yak" }

	NavalMinAttackForce = 1
	NavalMaxAttackForce = 3
	InfantryMinAttackForce = 4
	InfantryMaxAttackForce = 10
	VehicleMinAttackForce = 1
	VehicleMaxAttackForce = 6

	NavyDelay = DateTime.Seconds(75)
	InfantryDelay = DateTime.Seconds(20)
	VehicleDelay = DateTime.Seconds(60)
	YakDelay = DateTime.Seconds(60)

elseif Map.LobbyOption("difficulty") == "normal" then

	StartTeam = { "dd", "dd", "pt" }

	USSRFirstAttack = { "ttnk", "ttnk", "ftrk" }
	USSRYaks = { "yak", "yak" }

	NavalMinAttackForce = 2
	NavalMaxAttackForce = 4
	InfantryMinAttackForce = 5
	InfantryMaxAttackForce = 12
	VehicleMinAttackForce = 2
	VehicleMaxAttackForce = 10


	NavyDelay = DateTime.Seconds(60)
	InfantryDelay = DateTime.Seconds(15)
	VehicleDelay = DateTime.Seconds(45)
	YakDelay = DateTime.Seconds(45)

elseif Map.LobbyOption("difficulty") == "hard" then

	StartTeam = { "dd", "dd", "pt" }

	USSRFirstAttack = { "ttnk", "ttnk", "ftrk" }
	USSRYaks = { "yak", "yak" }

	NavalMinAttackForce = 2
	NavalMaxAttackForce = 5
	InfantryMinAttackForce = 6
	InfantryMaxAttackForce = 15
	VehicleMinAttackForce = 3
	VehicleMaxAttackForce = 10

	NavyDelay = DateTime.Seconds(60)
	InfantryDelay = DateTime.Seconds(10)
	VehicleDelay = DateTime.Seconds(30)
	YakDelay = DateTime.Seconds(30)

end

BeachReinforcements1 = { "2tnk", "2tnk", "2tnk" }
BeachReinforcements2 = { "e1", "e1", "e1", "e3", "e3" }
BeachReinforcements3 = { "arty", "arty" }
BeachReinforcements4 = { "2tnk", "2tnk" }
PlayerMCV = { "mcv" }

ActorRemovals =
{
	easy = { Actor439, Actor459, Actor462, Actor471, Actor500 },
	normal = { Actor459, Actor471, Actor500 },
	hard = { },
}

InsertionPath1 = { InsertionEntry1.Location, InsertionRally1.Location }
InsertionPath2 = { InsertionEntry1.Location, InsertionRally2.Location }
InsertionPath3 = { InsertionEntry2.Location, InsertionRally3.Location }
InsertionPath4 = { InsertionEntry2.Location, InsertionRally4.Location }

CYard = { cyard }

AttackTanks = { AttackTank1, AttackTank2 }
BeachGuys = { BeachGuy1, BeachGuy2, BeachGuy3, BeachGuy4, BeachGuy5, BeachGuy6 }
InfiltrateableBuildings = { Actor8, Actor10, Actor11, Actor12, Actor13, Actor14, Actor15, Actor78, Actor106 }
USSRAirfields = { Actor101, Actor102, Actor103 }
USSRFirstObjective = { Actor5, Actor309, Actor310, Actor311 }
USSRSubmarineGroup1 = { Actor309, Actor310, Actor311 }

-------------------------------------------------------------------------------------------------------------------------------------------------------------

Tick = function()
	if player.HasNoRequiredUnits() and GameStarted and not GameLost then
		GameLost = true
		ussr.MarkCompletedObjective(DestroyEnemies)
	end
	
	if ussr.HasNoRequiredUnits() and ussrpara.HasNoRequiredUnits() and not GameWon then
		GameWon = true
		player.MarkCompletedObjective(SecureArea)
	end

	if ussr.Resources >= ussr.ResourceCapacity * 0.75 then
		ussr.Cash = ussr.Cash + ussr.Resources - ussr.ResourceCapacity * 0.25
		ussr.Resources = ussr.ResourceCapacity * 0.25
	end
end

EnterParadrops = function()
	Trigger.AfterDelay(DateTime.Seconds(300), EnterParadrops)
	SendUSSRParadrops()
end

WorldLoaded = function()

	Actor537.Destroy()

	GameWon = false
	GameLost = false
	GameStarted = false

	player = Player.GetPlayer("England")
	greece = Player.GetPlayer("Greece")
	ussr = Player.GetPlayer("USSR")
	ussrpara = Player.GetPlayer("USSRParas")

	Camera.Position = StartPosition.CenterPosition

	Reinforcements.Reinforce(player, StartTeam, { PlayerReinfEntry1.Location, PlayerReinfRally1.Location }, 30, function() end)
	Reinforcements.Reinforce(player, StartTeam, { PlayerReinfEntry2.Location, PlayerReinfRally2.Location }, 30, function() end)
	
	Trigger.AfterDelay(DateTime.Seconds(1), function() Media.PlaySpeechNotification(player, "ReinforcementsArrived") end)

	BuildBase(cyard)
	EnemyMoney()
	IdleUnitsLogic()
	InitObjectives()
	Triggers()
	RemoveActors()
	RepairBase()
	SendDogPatrol()

	if Map.LobbyOption("difficulty") == "normal" or Map.LobbyOption("difficulty") == "hard" then--Actor439 doesn't exists at "easy"
		Actor439.Stance = "Defend"
	end

	Trigger.AfterDelay(DateTime.Seconds(3), function()
		GameStarted = true
	end)

end

InitObjectives = function()
	Trigger.OnObjectiveAdded(player, function(p, id)
		Media.DisplayMessage(p.GetObjectiveDescription(id), "New " .. string.lower(p.GetObjectiveType(id)) .. " objective")
	end)

	DestroyEnemies = ussr.AddPrimaryObjective("Destroy all enemy forces.")
	SecureBeachhead = player.AddPrimaryObjective("Secure the beachhead to the north.")

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

	Trigger.OnAllKilled(USSRAirfields, function()
		player.MarkCompletedObjective(DestroyAirfields)
	end)

	Trigger.OnAllKilled(USSRSubmarineGroup1, function()
		Trigger.AfterDelay(DateTime.Seconds(4), function() Media.PlaySpeechNotification(player, "ReinforcementsArrived") end)
		Trigger.AfterDelay(DateTime.Seconds(3), function() Reinforcements.Reinforce(player, StartTeam, { PlayerReinfEntry1.Location, PlayerReinfRally1.Location }, 30, function() end) end)
	end)

	Trigger.OnAnyKilled(USSRSubmarineGroup1, function()
		Utils.Do(USSRSubmarineGroup1, function(unit)
			if not unit.IsDead then 
				Trigger.OnIdle(unit, unit.Hunt)
			end 
		end)
	end)

	Trigger.OnAllKilled(USSRFirstObjective, function()

		SecureArea = player.AddPrimaryObjective("Destroy all enemy units in this area.")
		player.MarkCompletedObjective(SecureBeachhead)

		Trigger.AfterDelay(DateTime.Seconds(15), function()
		
			Vision1 = Actor.Create('camera', true, { Owner = player, Location = Actor99.Location })
			for i = 0, 2 do
				Trigger.AfterDelay(DateTime.Seconds(i), function()
					Media.PlaySoundNotification(player, "AlertBuzzer")
				end)
			end
			Trigger.OnKilled(Actor99, function()
				Vision1.Destroy()
			end)
		end)

		Trigger.AfterDelay(DateTime.Seconds(5), function()
			Utils.Do(BeachGuys, function(units)
				if not units.IsDead then
					Trigger.OnIdle(units, function()
						units.Hunt()
					end)
				end
			end)
		end)

		Trigger.AfterDelay(DateTime.Seconds(200), function()
			if not AttackTanks.IsDead then
				Utils.Do(AttackTanks, function(units)
					if not units.IsDead then
						Trigger.OnIdle(units, function()
							units.Hunt()
						end)
					end
				end)
			end
		end)

		Trigger.AfterDelay(DateTime.Seconds(5), function()
			Utils.Do(BeachGuys, function(units)
				if not units.IsDead then
					units.Hunt()
				end
			end)
		end)

		Trigger.AfterDelay(DateTime.Seconds(215), function()
			DestroyAirfields = player.AddSecondaryObjective("Locate and destroy the soviet airfields.")
		end)

		Trigger.AfterDelay(DateTime.Seconds(600), function()
			IUseStrongUnits = true
		end)

		StartAI()

		Reinforcements.ReinforceWithTransport(player, "lst", BeachReinforcements1, InsertionPath3, { PlayerReinfEntry1.Location })

		Trigger.AfterDelay(DateTime.Seconds(2), function()
			Media.PlaySpeechNotification(player, "ReinforcementsArrived")
			Reinforcements.ReinforceWithTransport(player, "lst", BeachReinforcements2, InsertionPath2, { PlayerReinfEntry1.Location })
			Reinforcements.ReinforceWithTransport(player, "lst", BeachReinforcements2, InsertionPath1, { PlayerReinfEntry1.Location })
		end)

		Reinforcements.ReinforceWithTransport(player, "lst", BeachReinforcements3, InsertionPath4, { PlayerReinfEntry1.Location })
		if Map.LobbyOption("difficulty") ~= "hard" then
			Trigger.AfterDelay(DateTime.Seconds(4), function()
				Reinforcements.ReinforceWithTransport(player, "lst", BeachReinforcements4, InsertionPath2, { PlayerReinfEntry1.Location })
			end)
		end

		Trigger.AfterDelay(DateTime.Seconds(60), function()
			Media.PlaySpeechNotification(player, "ReinforcementsArrived")
			Reinforcements.ReinforceWithTransport(player, "lst", PlayerMCV, InsertionPath2, { PlayerReinfEntry1.Location })
		end)
	end)

	Trigger.AfterDelay(DateTime.Seconds(400), EnterParadrops)

	Utils.Do(InfiltrateableBuildings, function(building)
		Trigger.OnInfiltrated(building, function()
			building.Sell()
		end)
	end)

end
