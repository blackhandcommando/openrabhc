--[[

--]]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

if Map.LobbyOption("difficulty") == "easy" then

	PlayerStartTeam = { "apc", "apc", "e1", "e1", "e1", "e3", "e3", "e4", "e4", "e4" }
	EnglandDefenders = { "e1", "e1", "e3" }

elseif Map.LobbyOption("difficulty") == "normal" then

	PlayerStartTeam = { "apc", "e1", "e1", "e1", "e3", "e3", "e4", "e4", "e4" }
	EnglandDefenders = { "e1", "e1", "e3", "e3" }

elseif Map.LobbyOption("difficulty") == "hard" then

	PlayerStartTeam = { "apc", "apc", "e1", "e1", "e1", "e3", "e3", "e4", "e4", "e4" }
	EnglandDefenders = { "e1", "e1", "e1", "e3", "e3" }

end

CellTriggers1 =
{
	CPos.New(61,55),
}

ActorRemovals =
{
	easy = { Actor87, Actor315, Actor316, Actor317 },
	normal = { Actor87 },
	hard = { },
}

--Teams here
EnglandBase1 = { Actor81, Actor6, Actor7, Actor84, Actor82, Actor83 }
DefendableBuildings = { Actor104, Actor94, Actor95, Actor96, Actor97, Actor100, Actor101, Actpr98, Actor99, Actor273, Actor103 }
EnglandHinds = { Actor414, Actor415 }
EnglandHelipads = { Actor94, Actor95, Actor96, Actor97 }
EnglandMainbase = { Actor164, Actor165, Actor166, Actor93, Actor162, Actor163, Actor171, Actor172, Actor168 }

EnglandTeam1 = { Actor446 }
EnglandTeam1Route = {
	Actor435.Location,
	Actor436.Location,
	Actor437.Location,
}

EnglandTeam2 = { Actor442, Actor443, Actor444, Actor445 }
EnglandTeam2Route = {
	Actor438.Location,
	Actor439.Location,
	Actor440.Location,
	Actor441.Location,
}

--Paths here
DefendersPath = { Actor334.Location, Actor327.Location }

-------------------------------------------------------------------------------------------------------------------------------------------------------------


Tick = function()

	--Lose / Win
	if player.HasNoRequiredUnits() and not GameLost and GameLostAllowed then
		GameLost = true
		england.MarkCompletedObjective(DestroyEnemies)
	end

	if england.Resources >= england.ResourceCapacity * 0.75 then
		england.Cash = england.Cash + england.Resources - england.ResourceCapacity * 0.25
		england.Resources = england.ResourceCapacity * 0.25
	end

end


WorldLoaded = function()

	GameWon = false
	GameLost = false
	GameLostAllowed = false
	Base1Destroyed = false
	cyardIsBuilding = false
	EnglandNavalPatrol1 = false
	ISentEverything = false

	--if BuildingsBuilt == 10 AI will send everything
	BuildingsBuilt = 0

	player = Player.GetPlayer("USSR")
	england = Player.GetPlayer("England")

	Camera.Position = startposition.CenterPosition

	local difficulty = Map.LobbyOption("difficulty")

	InitObjectives()
	Triggers()
	TriggersAI()
	RemoveActors()

	BuildBase(Actor93)
	EnglandSendPatrols()
	EnglandIdleUnitsLogic()
	EnglandRepairBase()
	EnglandVehicleProduction(Actor7,RallyPoints1)

	player.Cash = 5000

	Utils.Do(DefendableBuildings, function(building)
		Trigger.OnDamaged(building, function(guard)
			Utils.Do(EnglandHinds, function(guard)
				if not guard.IsDead and not building.IsDead then
					guard.Guard(building)
				end
			end)
		end)
	end)

end


RemoveActors = function()
	Utils.Do(ActorRemovals[Map.LobbyOption("difficulty")], function(unit)
		unit.Destroy()
	end)
end


InitObjectives = function()
	Trigger.OnObjectiveAdded(player, function(p, id)
		Media.DisplayMessage(p.GetObjectiveDescription(id), "New " .. string.lower(p.GetObjectiveType(id)) .. " objective")
	end)

	DestroyEnemies = england.AddPrimaryObjective("Destroy all enemies.")
	DestroyBase1 = player.AddPrimaryObjective("Destroy the nearby enemy base.")

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


Triggers = function ()
	--init
	Trigger.AfterDelay(DateTime.Seconds(1.25), function()
		Media.PlaySpeechNotification(player, "ReinforcementsArrived")
		Reinforcements.Reinforce(player, PlayerStartTeam, { Actor89.Location, Actor90.Location }, 15, function() end)
		Reinforcements.Reinforce(player, PlayerStartTeam, { Actor91.Location, Actor92.Location }, 15, function() end)
		Trigger.AfterDelay(DateTime.Seconds(1.25), function()
			GameLostAllowed = true
		end)
	end)

	--spawn and enable 3tnks
	Trigger.AfterDelay(DateTime.Minutes(5), function()
		Actor217.Owner = player
		Media.PlaySpeechNotification(player, "ReinforcementsArrived")
		Reinforcements.Reinforce(player, {"3tnk"}, { Actor89.Location, Actor90.Location }, 15, function() end)
		Reinforcements.Reinforce(player, {"3tnk"}, { Actor91.Location, Actor92.Location }, 15, function() end)
	end)

	--objective 1 check
	Trigger.OnAllKilled(EnglandBase1, function()
		Base1Destroyed = true
		DestroyBase2 = player.AddPrimaryObjective("Destroy the allied main base in this area.")
		DestroyAirBase = player.AddSecondaryObjective("Destroy the allied helipads on the island.")
		player.MarkCompletedObjective(DestroyBase1)
		Trigger.AfterDelay(DateTime.Seconds(1.5), function()
			Media.PlaySpeechNotification(player, "ReinforcementsArrived")
			Reinforcements.Reinforce(player, {"mcv", "apc", "e1", "e1"}, { Actor89.Location, Actor90.Location }, 15, function() end)
		end)
	end)

	--objective 2 check
	Trigger.OnAllKilled(EnglandMainbase, function()
		GameWon = true
		player.MarkCompletedObjective(DestroyBase2)
	end)

	--objective 3 check
	Trigger.OnAllKilled(EnglandHelipads, function()
		player.MarkCompletedObjective(DestroyAirBase)
	end)

	--activate enemy AI
	Trigger.OnAllKilled(EnglandBase1, function()
		EnglandInfantryProduction(Actor173,RallyPoints3)
		EnglandVehicleProduction(Actor153,RallyPoints2)
		Trigger.AfterDelay(DateTime.Seconds(15), function()
			local reinforcements = Reinforcements.ReinforceWithTransport(england, "tran.insertion", EnglandDefenders, DefendersPath, { Actor334.Location })[2]
			Utils.Do(reinforcements, function(defenders)
				Trigger.OnIdle(defenders, function()
					defenders.Hunt()
				end)
			end)
		end)
		Trigger.AfterDelay(DateTime.Minutes(4), function()
			EnglandAirReinforcements()
		end)
		Trigger.AfterDelay(DateTime.Minutes(5), function()
			EnglandNavalProduction(Actor168,nil)
		end)
	end)

	--activate enemy infantry production in home base
	Trigger.OnKilled(Actor173, function()
		if not Actor161.IsDead then
			EnglandInfantryProduction(Actor161,RallyPoints2)
		end
	end)
end


EnglandSendPatrols = function()
	GroupPatrol(EnglandTeam1, EnglandTeam1Route, DateTime.Seconds(10))
	GroupPatrol(EnglandTeam2, EnglandTeam2Route, DateTime.Seconds(10))
end


GroupPatrol = function(units, waypoints, delay)
	local i = 1
	local stop = false

	Utils.Do(units, function(unit)
		Trigger.OnIdle(unit, function()
			if stop then
				return
			end

			if unit.Location == waypoints[i] then
				local bool = Utils.All(units, function(actor) return actor.IsIdle end)

				if bool then
					stop = true

					i = i + 1
					if i > #waypoints then
						i = 1
					end

					Trigger.AfterDelay(delay, function() stop = false end)
				end
			else
				unit.AttackMove(waypoints[i])
			end
		end)
	end)
end