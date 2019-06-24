--[[

--]]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

if Map.LobbyOption("difficulty") == "easy" then

	EnglandIdle1 = { Actor172, Actor173, Actor174, Actor175, Actor176 }
	USSRMigReinforcements = { "mig", "mig", "mig", "mig" }

elseif Map.LobbyOption("difficulty") == "normal" then

	EnglandIdle1 = { Actor171, Actor172, Actor173, Actor174, Actor175, Actor176 }
	USSRMigReinforcements = { "mig", "mig", "mig" }

elseif Map.LobbyOption("difficulty") == "hard" then

	EnglandIdle1 = { Actor171, Actor172, Actor173, Actor174, Actor175, Actor176 }
	USSRMigReinforcements = { "mig", "mig" }

end

CellTriggers1 =
{
	CPos.New(61,55),
}

ActorRemovals =
{
	easy = { Actor159, Actor171, Actor290 },
	normal = { },
	hard = { },
}

HarvesterDefenders = { Actor125, Actor126, Actor354, Actor357, Actor358, Actor359 }
AAGuns = { Actor33, Actor34, Actor158, Actor167 }
SovietOutpost = { Actor227, Actor259, Actor260, Actor261, Actor262, Actor271, Actor272 }
SovietEngineers = { Actor15, Actor16 }

EnglandTeam1 = { Actor274 }
EnglandTeam1Route = {
	Actor284.Location,
	Actor285.Location,
	Actor286.Location,
	Actor285.Location,
}

EnglandTeam2 = { Actor287, Actor288, Actor289 }
EnglandTeam2Route = {
	Actor364.Location,
	Actor365.Location,
	Actor366.Location,
	Actor365.Location,
}

-------------------------------------------------------------------------------------------------------------------------------------------------------------


Tick = function()

	if player.HasNoRequiredUnits() and not GameLost then
		GameLost = true
		england.MarkCompletedObjective(DestroyEnemies)
	end
	
	if england.Resources >= england.ResourceCapacity * 0.75 then
		england.Cash = england.Cash + england.Resources - england.ResourceCapacity * 0.25
		england.Resources = england.ResourceCapacity * 0.25
	end

	if not VisionActivated and not england_cruiser.IsDead then
		VisionActivated = true
		Vision = Actor.Create('camera.small', true, { Owner = player, Location = england_cruiser.Location })
	elseif not Vision.IsDead then
		VisionActivated = false
		Vision.Destroy()
	end

	if england_cruiser.Health < england_cruiser.MaxHealth * 7.5/10 and not ReinforcementsSent then
		ReinforcementsSent = true
		EnglandSendReinforcements()
	end
end


WorldLoaded = function()

	ReinforcementsSent = false
	HarvesterDiscovered = false
	NeutralTrigger1 = false
	SovietOutpostCaptured = false
	GameWon = false
	GameLost = false

	player = Player.GetPlayer("USSR")
	england = Player.GetPlayer("England")

	Camera.Position = startposition.CenterPosition

	local difficulty = Map.LobbyOption("difficulty")

	EnglandSendPatrols()
	InitObjectives()
	Triggers()
	RemoveActors()

	EnglandIdleUnitsLogic()
	EnglandRepairBase()
	Trigger.AfterDelay(DateTime.Seconds(75), function()
		EnglandInfantryProduction(Actor92)
	end)

	england_cruiser.Stance = "AttackAnything"

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
	DestroyCruiser = player.AddPrimaryObjective("Destroy the allied cruiser.")
	DestroyAlliedAA = player.AddSecondaryObjective("Destroy all allied anti air guns to allow our \nairforce in supporting us.")
	RetakeSovietOutpost = player.AddSecondaryObjective("Capture the soviet radar dome near the \nabandoned outpost.")
	VisionOutpost = Actor.Create('camera.small', true, { Owner = player, Location = Actor275.Location })
	VisionOutpost.Destroy()

	Trigger.OnDamaged(Actor170, function()
		if not HarvesterDiscovered then
			HarvesterDiscovered = true
			DestroyAlliedHarvester = player.AddSecondaryObjective("Destroy the allied harvester.")
		end
	end)

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

	Trigger.OnIdle(england_cruiser, England_ca)

	Trigger.OnAnyKilled(EnglandIdle1, function()
		Utils.Do(EnglandIdle1, function(actor)
			Trigger.OnIdle(actor, function()
				actor.Hunt()
			end)
		end)
	end)

	Trigger.OnKilled(england_cruiser, function()
		player.MarkCompletedObjective(DestroyCruiser)
	end)

	Trigger.OnAllKilled(AAGuns, function()
		player.MarkCompletedObjective(DestroyAlliedAA)
		Actor.Create("powerproxy.paras", true, { Owner = player })
		Reinforcements.Reinforce(player, USSRMigReinforcements, { Actor367.Location, Actor368.Location }, 5, function() end)
		Media.PlaySpeechNotification(player, "ReinforcementsArrived")
	end)

	Trigger.OnKilled(Actor170 ,function()
		player.MarkCompletedObjective(DestroyAlliedHarvester)
	end)

	Trigger.OnCapture(Actor275, function()
		SovietOutpostCaptured = true
		player.MarkCompletedObjective(RetakeSovietOutpost)
		player.Cash = player.Cash + 5000
		local harvester = Actor.Create('harv', true, { Owner = player, Location = Actor273.Location })
		Utils.Do(SovietOutpost, function(building)
			building.Owner = player
		end)
	end)

	Trigger.OnAllKilled(SovietEngineers, function()
		if not SovietOutpostCaptured then
			player.MarkFailedObjective(RetakeSovietOutpost)
		end
	end)

	-- Actor170 = Harverster
	Utils.Do(HarvesterDefenders, function(defenders)
		Trigger.OnIdle(defenders, function()
			if not Actor170.IsDead then
				if Actor170.Health < Actor170.MaxHealth * 5/10 then
					if not defenders.IsDead then
						defenders.Guard(Actor170)
					end
				end
			else
				if not defenders.IsDead then
					defenders.Hunt()
				end
			end
		end)
	end)

end


England_ca = function()
	if not england_cruiser.IsDead then
		england_cruiser.ScriptedMove(cruiser_wp1.Location)
		england_cruiser.ScriptedMove(cruiser_wp2.Location)
		england_cruiser.ScriptedMove(cruiser_wp3.Location)
		england_cruiser.ScriptedMove(cruiser_wp4.Location)
	end
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