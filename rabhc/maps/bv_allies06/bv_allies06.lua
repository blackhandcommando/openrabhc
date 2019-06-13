--[[

--]]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

if Map.LobbyOption("difficulty") == "easy" then

	StartTeam = { "e7", "spy", "spy", "spy" }

elseif Map.LobbyOption("difficulty") == "normal" then

	StartTeam = { "e7", "spy", "spy", "spy" }

elseif Map.LobbyOption("difficulty") == "hard" then

	StartTeam = { "e7.noautotarget", "spy", "spy", "spy" }

end

AlliedMCV = { "mcv" }
AlliedReinforcements = { "2tnk", "2tnk", "2tnk", "arty", "jeep" }
InsertionHelicopter = "tran.insertion"
MigReinforcementsAndOneYak = { "mig.ai", "mig.ai", "mig.ai", "yak.ai" }
USSRMigs = { Actor875, Actor876, Actor877 }

ActorRemovals =
{
	easy = { Actor790 },
	normal = { Actor790 },
	hard = { },
}

InsertionPath1 = { Actor159.Location, Actor160.Location }
InsertionPath2 = { Actor543.Location, Actor542.Location }
InsertionPath3 = { Actor544.Location, Actor542.Location }

NeutralTroop1Allied = { Actor849, Actor850, Actor851, Actor852 }

CellTriggers1 =
{
	CPos.New(87,113), CPos.New(88,113), CPos.New(89,113), CPos.New(90,113), CPos.New(91,113), CPos.New(92,113), CPos.New(93,113),
}

CellTriggers2 =
{
	CPos.New(98,67), CPos.New(99,67), CPos.New(100,67),
}

-------------------------------------------------------------------------------------------------------------------------------------------------------------

Tick = function()
	if player.HasNoRequiredUnits() and not GameLost and GameInitialized then
		GameLost = true
		ussr.MarkCompletedObjective(DestroyEnemies)
	end

	if ussr.HasNoRequiredUnits() and NukesDestroyed and not GameWon then
		GameWon = true
		player.MarkCompletedObjective(EliminateAllEnemies)
	end

	if ussr.Resources >= ussr.ResourceCapacity * 0.75 then
		ussr.Cash = ussr.Cash + ussr.Resources - ussr.ResourceCapacity * 0.25
		ussr.Resources = ussr.ResourceCapacity * 0.25
	end
end

WorldLoaded = function()

	GameLost = false
	GameWon = false
	ISentEverything = false
	IUseStrongUnits = false
	NavalPatrol1 = false
	NavalPatrol2 = false
	NeutralTrigger1 = false
	NeutralTrigger2 = false
	NeutralTrigger3 = false
	NeutralTrigger4 = false
	NukesDestroyed = false
	Phase2 = false
	TechCenterInfiltrated = false
	TryMeOnce = false

	BuildingsBuilt = 0
	SpiesKilled = 0

	player = Player.GetPlayer("England")
	ussr = Player.GetPlayer("USSR")
	ussrpara = Player.GetPlayer("USSRParas")
	nuker = Player.GetPlayer("Nuker")

	Camera.Position = Actor160.CenterPosition

	SubmarineGuards()
	Actor881.Stance = "Defend"
	Actor882.Stance = "Defend"
	Actor883.Stance = "Defend"
	Actor922.Stance = "Defend"

	local passengers = Reinforcements.ReinforceWithTransport(player, InsertionHelicopter, StartTeam, InsertionPath1, { Actor159.Location })[2]
	local tanya = passengers[1]
	local spy1 = passengers[2]
	local spy2 = passengers[3]
	local spy3 = passengers[4]
	Trigger.AfterDelay(DateTime.Seconds(4.6), function()
		Media.PlaySound("laugh1.aud")
	end)
	Trigger.OnRemovedFromWorld(spy1, function()
		if not TechCenterInfiltrated then
			SpiesKilled = SpiesKilled + 1
			Trigger.AfterDelay(DateTime.Seconds(0.25), function()
				if SpiesKilled == 3 then
					player.MarkFailedObjective(InfiltrateTechCenter)
				end
			end)
		end
	end)
	Trigger.OnRemovedFromWorld(spy2, function()
		if not TechCenterInfiltrated then
			SpiesKilled = SpiesKilled + 1
			Trigger.AfterDelay(DateTime.Seconds(0.25), function()
				if SpiesKilled == 3 then
					player.MarkFailedObjective(InfiltrateTechCenter)
				end
			end)
		end
	end)
	Trigger.OnRemovedFromWorld(spy3, function()
		if not TechCenterInfiltrated then
			SpiesKilled = SpiesKilled + 1
			Trigger.AfterDelay(DateTime.Seconds(0.25), function()
				if SpiesKilled == 3 then
					player.MarkFailedObjective(InfiltrateTechCenter)
				end
			end)
		end
	end)
	Trigger.OnKilled(tanya, function()
		if not Phase2 then
			player.MarkFailedObjective(TanyaSurvive)
		end
	end)

	Trigger.AfterDelay(DateTime.Seconds(3), function()
		GameInitialized = true
	end)

	BuildBase(Actor718)
	IdleUnitsLogic()
	IdleHuntPara()
	InitObjectives()
	TeamAttack()
	Triggers()
	TriggersAI()
	RemoveActors()
	RepairBase()
	SendPatrols()

end

InitObjectives = function()
	Trigger.OnObjectiveAdded(player, function(p, id)
		Media.DisplayMessage(p.GetObjectiveDescription(id), "New " .. string.lower(p.GetObjectiveType(id)) .. " objective")
	end)

	DestroyEnemies = ussr.AddPrimaryObjective("Infiltrate the soviet tech center near your position.")
	InfiltrateTechCenter = player.AddPrimaryObjective("Infiltrate the soviet tech center near your position.")
	TanyaSurvive = player.AddPrimaryObjective("Tanya must survive.")
	--DestroyIronCurtain = player.AddSecondaryObjective("Destroy the iron curtain in this area.")

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

	Trigger.OnInfiltrated(Actor405, function()
		if not TechCenterInfiltrated then
			TechCenterInfiltrated = true
			player.MarkCompletedObjective(InfiltrateTechCenter)
			Media.DisplayMessage("Locations of Missile Silos and Radar received.")
			Vision3 = Actor.Create('camera', true, { Owner = player, Location = Actor380.Location })
			Vision6 = Actor.Create('camera', true, { Owner = player, Location = Actor519.Location })
			Vision7 = Actor.Create('camera', true, { Owner = player, Location = Actor520.Location })
			Vision8 = Actor.Create('camera', true, { Owner = player, Location = Actor551.Location })
			if not Vision3.IsDead then
				Vision3.Destroy()
			end
			if not Vision6.IsDead then
				Vision6.Destroy()
			end
			if not Vision7.IsDead then
				Vision7.Destroy()
			end
			if not Vision8.IsDead then
				Vision8.Destroy()
			end
			Trigger.AfterDelay(DateTime.Seconds(5), function()
				DestroyRadarDome = player.AddPrimaryObjective("Destroy the Radar Dome in this area.")
			end)
		end
	end)

	Trigger.OnAllKilled(MissileSilos, function()
		Actor926.Destroy()
		Actor929.Destroy()
		Actor930.Destroy()
		Actor931.Destroy()
		Actor932.Destroy()
		EliminateAllEnemies = player.AddPrimaryObjective("Eliminate all remaining enemies in this area.")
		NukesDestroyed = true
		player.MarkCompletedObjective(DestroyNukes)
		Reinforcements.Reinforce(nuker, MigReinforcementsAndOneYak, { USSRReinforcementsWP1.Location, USSRReinforcementsWP2.Location }, 5, function() end) --Bot sends them hunting
		if not ISentEverything then
			ISentEverything = true
			IdlingUnitsRedAlert()
		end
	end)

	Trigger.OnKilled(Actor405, function()
		if not TechCenterInfiltrated then
			player.MarkFailedObjective(InfiltrateTechCenter)
		end
	end)

	Trigger.OnKilled(Actor380, function(team)
		Phase2 = true
		StartAI()
		USSRSellBuildings()
		player.Cash = player.Cash + 12500
		Utils.Do(DefendableBuildings, function(building)
			Trigger.OnDamaged(building, function(guard)
				Utils.Do(USSRMigs, function(guard)
					if not guard.IsDead and not building.IsDead then
						guard.Guard(building)
					end
				end)
			end)
		end)
		Actor519.Owner = nuker
		Actor520.Owner = nuker
		Actor551.Owner = nuker
		Actor402.Destroy()
		Actor403.Destroy()
		DestroyNukes = player.AddPrimaryObjective("Destroy all three Missile Silos in this area.")
		player.MarkCompletedObjective(TanyaSurvive)
		player.MarkCompletedObjective(DestroyRadarDome)
		Media.PlaySpeechNotification(player, "ReinforcementsArrived")
		Camera.Position = Actor542.CenterPosition
		Reinforcements.Reinforce(player, AlliedReinforcements, InsertionPath2, DateTime.Seconds(2))
		Reinforcements.Reinforce(player, AlliedReinforcements, InsertionPath3, DateTime.Seconds(2))
		Trigger.OnKilled(Actor548, function()
			Media.PlaySpeechNotification(player, "ReinforcementsArrived")
			Reinforcements.Reinforce(player, AlliedMCV, InsertionPath3, DateTime.Seconds(2))
		end)
		Trigger.AfterDelay(DateTime.Seconds(25), function()
			USSRFirstWave()
		end)
		if Map.LobbyOption("difficulty") ~= "easy" then
			Trigger.AfterDelay(DateTime.Seconds(125), function()
				USSRSecondWave()
			end)
		end
		if Map.LobbyOption("difficulty") == "hard" then
			Trigger.AfterDelay(DateTime.Seconds(400), function()
				Media.DisplayMessage("WARNING: Trucks armed with nuclear explosives detected.")
				USSRMadTank()--Actually a demolition truck
			end)
		end
		Trigger.AfterDelay(DateTime.Seconds(540), function()--Start to build more mammoths and teslas
			IUseStrongUnits = true
		end)
		Trigger.AfterDelay(DateTime.Seconds(820), function()
			USSRLargeAttack()
		end)
	end)

	Trigger.OnKilled(Actor523, function(team)
		if not Actor109.IsDead then
			Actor109.Health = 0
		end
		if not Actor110.IsDead then
			Actor110.Health = 0
		end
	end)

	Trigger.OnKilled(Actor506, function(team)
		if not Actor248.IsDead then
			Actor248.Health = 0
		end
		if not Actor504.IsDead then
			Actor504.Health = 0
		end
		if not Actor232.IsDead then
			Actor232.Health = 0
		end
		if not Actor233.IsDead then
			Actor233.Health = 0
		end
		if not Actor234.IsDead then
			Actor234.Health = 0
		end
		if not Actor235.IsDead then
			Actor235.Health = 0
		end
	end)

	Trigger.OnKilled(Actor548, function(team)
		if not Actor210.IsDead then
			Actor210.Health = 0
		end
		if not Actor211.IsDead then
			Actor211.Health = 0
		end
		if not Actor212.IsDead then
			Actor212.Health = 0
		end
		if not Actor213.IsDead then
			Actor213.Health = 0
		end
		if not Actor214.IsDead then
			Actor214.Health = 0
		end
		if not Actor215.IsDead then
			Actor215.Health = 0
		end
	end)

	Trigger.OnEnteredFootprint(CellTriggers1, function(a, id)
		if a.Owner == player and not NeutralTrigger1 and not Phase2 then
			Trigger.RemoveFootprintTrigger(id)
			NeutralTrigger1 = true
			Vision1 = Actor.Create('camera', true, { Owner = player, Location = Actor75.Location })
			Vision2 = Actor.Create('camera', true, { Owner = player, Location = Actor109.Location })
			for i = 0.25, 0.4 do
				Trigger.AfterDelay(DateTime.Seconds(i), function()
					Media.PlaySoundNotification(player, "AlertBuzzer")
				end)
			end
			Trigger.OnKilled(Actor75, function()
				Trigger.AfterDelay(DateTime.Seconds(3), function()
					if not Vision1.IsDead then
						Vision1.Destroy()
					end
				end)
			end)
			Trigger.OnKilled(Actor109, function()
				Trigger.AfterDelay(DateTime.Seconds(3), function()
					if not Vision2.IsDead then
						Vision2.Destroy()
					end
				end)
			end)
			Trigger.AfterDelay(DateTime.Seconds(90), function()
				if not Vision1.IsDead then
					Vision1.Destroy()
				end
				if not Vision2.IsDead then
					Vision2.Destroy()
				end
			end)
		end
	end)

	Trigger.OnEnteredFootprint(CellTriggers2, function(a, id)
		if a.Owner == player and not NeutralTrigger4 then
			Trigger.RemoveFootprintTrigger(id)
			NeutralTrigger4 = true
			Media.PlaySound("bombit1.aud")
			Utils.Do(NeutralTroop1Allied, function(actor)
				actor.Owner = player
			end)
		end
	end)

	Trigger.OnEnteredProximityTrigger(Actor517.CenterPosition, WDist.FromCells(15), function(actor)
		if not NeutralTrigger2 and not Phase2 then
			if actor.Type == "e7" or actor.Type == "e7.noautotarget" then
				NeutralTrigger2 = true
				Vision4 = Actor.Create('camera', true, { Owner = player, Location = Actor517.Location })
				for i = 0.25, 0.4 do
					Trigger.AfterDelay(DateTime.Seconds(i), function()
						Media.PlaySoundNotification(player, "AlertBuzzer")
					end)
				end
				Trigger.AfterDelay(DateTime.Seconds(45), function()
					Vision4.Destroy()
				end)
			end
		end
	end)

	Trigger.OnEnteredProximityTrigger(Actor518.CenterPosition, WDist.FromCells(15), function(actor)
		if not NeutralTrigger3 and not Phase2 then
			if actor.Type == "e7" or actor.Type == "e7.noautotarget" and not NeutralTrigger3 and not Phase2 then
				NeutralTrigger3 = true
				Vision5 = Actor.Create('camera', true, { Owner = player, Location = Actor518.Location })
				for i = 0.25, 0.4 do
					Trigger.AfterDelay(DateTime.Seconds(i), function()
						Media.PlaySoundNotification(player, "AlertBuzzer")
					end)
				end
				Trigger.AfterDelay(DateTime.Seconds(45), function()
					Vision5.Destroy()
				end)
			end
		end
	end)

end
