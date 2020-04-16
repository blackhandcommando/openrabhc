--[[

--]]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

if Map.LobbyOption("difficulty") == "easy" then

	AttackTeam1 =
	{
		{ "e1", "e3", "e3" },
		{ "e1", "e1", "e1" },
		{ "e1", "e1", "e1" },
	}

elseif Map.LobbyOption("difficulty") == "normal" then

	AttackTeam1 =
	{
		{ "e1", "e3", "e3", "e1", "e1" },
		{ "e1", "e1", "e1", "e3", "e3" },
		{ "e1", "e1", "e1", "e1", "e3" },
	}

elseif Map.LobbyOption("difficulty") == "hard" then

	AttackTeam1 =
	{
		{ "e1", "e3", "e3", "e1", "e1", "e1", "e3" },
		{ "e1", "e1", "e1", "e3", "e3", "e3", "e3" },
		{ "e1", "e1", "e1", "e1", "e3", "e3", "e3" },
	}

end

GreeceHelo1 = { "mh60.ai" }
GreeceHelo2 = { "heli.ai" }

CurtainActivated = false

AlliedPrisoners = { AlliedPrisoner1, AlliedPrisoner2, AlliedPrisoner3, AlliedPrisoner4, AlliedPrisoner5, AlliedPrisoner6 }
EnglandTanyaTroop = { EnglandTanyaTroopTank1, EnglandTanyaTroopTank2 }
NeutralTroop1Allied = { EnglandTroop1Actor1, EnglandTroop1Actor2, EnglandTroop1Actor3 }
NeutralTroop1USSR = { USSRTroop1Actor1, USSRTroop1Actor2, USSRTroop1Actor3, USSRTroop1Actor4 }
USSRTanks = { USSRTank1, USSRTank2, USSRTank3, USSRTank4 }
USSRVillageTroop = { USSRVillageActor1, USSRVillageActor2, USSRVillageActor3, USSRVillageActor4, USSRVillageActor5, USSRVillageActor6, USSRVillageActor7, USSRVillageActor8, USSRVillageActor9 }

CellTriggers1 =
{
	CPos.New(26,52), CPos.New(26,53), CPos.New(26,54), CPos.New(26,55), CPos.New(26,56), CPos.New(26,57), CPos.New(26,58), CPos.New(26,59),
}

CellTriggers2 =
{
	CPos.New(13,27), CPos.New(13,28), CPos.New(13,29), CPos.New(13,30),
}

CellTriggers3 =
{
	CPos.New(37,48), CPos.New(38,48), CPos.New(39,48), CPos.New(40,48), CPos.New(41,48), CPos.New(42,48), CPos.New(43,48), CPos.New(44,48),
}

CellTriggers4 =
{
	CPos.New(17,41), CPos.New(18,41), CPos.New(19,41), CPos.New(20,41), CPos.New(21,41),
}

CellTriggers5 =
{
	CPos.New(60,5), CPos.New(60,6), CPos.New(60,7), CPos.New(60,8), CPos.New(60,9), CPos.New(60,10),
}

CellTriggers6 =
{
	CPos.New(44,22), CPos.New(45,22), CPos.New(46,22),
}

ActorRemovals =
{
	easy = { },
	normal = { },
	hard = { },
}

-------------------------------------------------------------------------------------------------------------------------------------------------------------

Tick = function()
	if player.HasNoRequiredUnits() and not GameLost then
		GameLost = true
		player.MarkFailedObjective(DestroySuperweapon)
	end

	if IronCurtain.IsDead and not GameWon then
		GameWon = true
		player.MarkCompletedObjective(DestroySuperweapon)
	end

	if not IronCurtain.IsDead then
		if IronCurtain.Health < IronCurtain.MaxHealth * 7.5/10 and not CurtainActivated then
			CurtainActivated = true
			IronCurtain.GrantCondition("invulnerability", DateTime.Seconds(20))
			Media.PlaySpeechNotification(player, "IronCurtainCharging")
			SendParatroopers()
			IdlingUnitsRedAlert()

			Trigger.AfterDelay(DateTime.Seconds(3), function()
				Media.PlaySpeechNotification(player, "EnemyUnitsApproaching")
			end)

		end
	end

	if ussr.Resources >= ussr.ResourceCapacity * 0.75 then
		ussr.Cash = ussr.Cash + ussr.Resources - ussr.ResourceCapacity * 0.25
		ussr.Resources = ussr.ResourceCapacity * 0.25
	end
end

WorldLoaded = function()

	NeutralTrigger1 = false
	NeutralTrigger2 = false
	NeutralTrigger3 = false
	NeutralTrigger4 = false
	NeutralTrigger5 = false
	NeutralTrigger6 = false
	GameWon = false
	GameLost = false

	player = Player.GetPlayer("England")
	ussr = Player.GetPlayer("USSR")
	greece = Player.GetPlayer("Greece")

	Camera.Position = StartPosition.CenterPosition

	local difficulty = Map.LobbyOption("difficulty")

	IdleUnitsLogic()--for ussr ai
	IdleUnitsLogic2()--for greece ai
	InitObjectives()
	Triggers()
	RemoveActors()

end

Barracks1Production = function(building)

	local team = Utils.Random(AttackTeam1)
	
	Trigger.AfterDelay(DateTime.Seconds(15), function()
		if not building.IsDead then
			Reinforcements.Reinforce(ussr, team, { building.Location, Paradrop1Rally.Location }, 5, AttackLogic1)
			Trigger.AfterDelay(DateTime.Seconds(75), function()
				Barracks1Production(building)
			end)
		end
	end)
	
end

AttackLogic1 = function(actors)
	Trigger.AfterDelay(DateTime.Seconds(10), function()
		if not actors.IsDead then
			Trigger.OnIdle(actors, function()
				if not actors.IsDead then
					actors.Hunt()
				end
			end)
		end
	end)
end

InitObjectives = function()
	Trigger.OnObjectiveAdded(player, function(p, id)
		Media.DisplayMessage(p.GetObjectiveDescription(id), "New " .. string.lower(p.GetObjectiveType(id)) .. " objective")
	end)

	DestroySuperweapon = player.AddPrimaryObjective("Destroy the superweapon in this area.")
	RescuePrisoners = player.AddSecondaryObjective("Rescue the allied prisoners.")

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

	USSRSendTanks()
	GreeceSupportmh60s1()
	GreeceSupportmh60s2()

	Trigger.OnEnteredFootprint(CellTriggers1, function(a, id)
		if a.Owner == player and not NeutralTrigger1 then
			Trigger.RemoveFootprintTrigger(id)
			NeutralTrigger1 = true
			
			Utils.Do(NeutralTroop1Allied, function(actor)
				actor.Owner = player
			end)
			Utils.Do(NeutralTroop1USSR, function(actor2)
				actor2.Owner = ussr
				actor2.Hunt()
			end)
		end
	end)

	Trigger.OnEnteredFootprint(CellTriggers2, function(a, id)
		if a.Owner == player and not NeutralTrigger2 then
			Trigger.RemoveFootprintTrigger(id)
			NeutralTrigger2 = true
			
			Utils.Do(EnglandTanyaTroop, function(actor)
				actor.Owner = player
			end)
		end
	end)

	Trigger.OnEnteredFootprint(CellTriggers3, function(a, id)
		if a.Owner == player and not NeutralTrigger3 then
			Trigger.RemoveFootprintTrigger(id)
			NeutralTrigger3 = true
			
			Utils.Do(USSRVillageTroop, function(actor)
				actor.Owner = ussr
				actor.Hunt()
			end)

			Vision1 = Actor.Create('camera', true, { Owner = player, Location = VillageCamera.Location })
			GreeceSupportmh60s1()
			GreeceSupportmh60s2()
			Barracks1Production(USSRBarracks)

			Trigger.AfterDelay(DateTime.Seconds(15), function()
				Vision1.Destroy()
			end)
		end
	end)

	Trigger.OnEnteredFootprint(CellTriggers4, function(a, id)
		if a.Owner == player and not NeutralTrigger4 then
			Trigger.RemoveFootprintTrigger(id)
			NeutralTrigger4 = true

			Trigger.AfterDelay(DateTime.Seconds(0.3), function()
				Dog1 = Actor.Create('dog', true, { Owner = ussr, Location = Actor162.Location })
				Dog1.Hunt()
			end)
			Trigger.AfterDelay(DateTime.Seconds(0.6), function()
				Dog2 = Actor.Create('dog', true, { Owner = ussr, Location = Actor162.Location })
				Dog2.Hunt()
			end)
			Trigger.AfterDelay(DateTime.Seconds(0.9), function()
				Dog3 = Actor.Create('dog', true, { Owner = ussr, Location = Actor162.Location })
				Dog3.Hunt()
			end)
			Trigger.AfterDelay(DateTime.Seconds(1.2), function()
				Dog4 = Actor.Create('dog', true, { Owner = ussr, Location = Actor162.Location })
				Dog4.Hunt()
			end)
		end
	end)

	Trigger.OnEnteredFootprint(CellTriggers5, function(a, id)
		if a.Owner == player and not NeutralTrigger5 then
			Trigger.RemoveFootprintTrigger(id)
			NeutralTrigger5 = true
			GreeceSupportmh60s1()
			GreeceSupportmh60s2()
			GreeceSupportmh60s3()
		end
	end)

	Trigger.OnEnteredFootprint(CellTriggers6, function(a, id)
		if a.Owner == player and not NeutralTrigger6 then
			Trigger.RemoveFootprintTrigger(id)
			NeutralTrigger6 = true
			
			player.MarkCompletedObjective(RescuePrisoners)
			Utils.Do(AlliedPrisoners, function(actor)
				actor.Owner = player
			end)
		end
	end)

end

SendParatroopers = function()
	local powerproxy = Actor.Create("powerproxy.paras1", false, { Owner = ussr })
	local unitsA = powerproxy.ActivateParatroopers(Paradrop1Rally.CenterPosition,Facing.West)
	local unitsB = powerproxy.ActivateParatroopers(Paradrop2Rally.CenterPosition,Facing.West)
	if Map.LobbyOption("difficulty") == "hard" then
		local unitsC = powerproxy.ActivateParatroopers(Paradrop3Rally.CenterPosition,Facing.West)
	end

	powerproxy.Destroy()

end

USSRSendTanks = function()
	Utils.Do(USSRTanks, function(actor)
		Trigger.AfterDelay(DateTime.Seconds(7.5), function()
			if not actor.IsDead then
				Trigger.OnIdle(actor, function()
					actor.Hunt()
				end)
			end
		end)
	end)
end

GreeceSupportmh60s1 = function()--Under player's control now, but not selectable
	Trigger.AfterDelay(DateTime.Seconds(9), function()
		Reinforcements.Reinforce(greece, GreeceHelo1, { Actor183.Location, StartPosition.Location }, 15, function(actor)
			Trigger.OnIdle(actor, function()
				actor.Hunt()
			end)
		end)
	end)
end

GreeceSupportmh60s2 = function()
	Trigger.AfterDelay(DateTime.Seconds(9), function()
		Reinforcements.Reinforce(greece, GreeceHelo1, { Actor182.Location, StartPosition.Location }, 15, function(actor)
			Trigger.OnIdle(actor, function()
				actor.Hunt()
			end)
		end)
	end)
end

GreeceSupportmh60s3 = function()
	Trigger.AfterDelay(DateTime.Seconds(6), function()
		Reinforcements.Reinforce(greece, GreeceHelo2, { Actor184.Location, Actor198.Location }, 15, function(actor)
			Trigger.OnIdle(actor, function()
				actor.Hunt()
			end)
		end)
	end)
end

IdleUnitsLogic = function()

	Trigger.AfterDelay(DateTime.Seconds(0.5), function()
		IdleUnitsLogic()
		IdlingUnits(ussr)
	end)

end

IdlingUnits = function()
	local lazyUnits = ussr.GetGroundAttackers()

	Utils.Do(lazyUnits, function(unit)
		IdleHunt(unit)
	end)
end

IdleHunt = function(unit)
	if not unit.IsDead then 
		if unit.Health < unit.MaxHealth * 9/10 then
			Trigger.OnIdle(unit, unit.Hunt)		
		end
	end 
end

IdlingUnitsRedAlert = function()
	local lazyUnits = ussr.GetGroundAttackers()

	Utils.Do(lazyUnits, function(unit)
		IdleHuntRedAlert(unit)
	end)
end

IdleHuntRedAlert = function(unit)
	if not unit.IsDead then 
		Trigger.OnIdle(unit, unit.Hunt)		
	end 
end

IdleHuntParas = function(unit)
	if not unit.IsDead then 
		Trigger.OnIdle(unit, unit.Hunt)		
	end 
end

IdleUnitsLogic2 = function()

	Trigger.AfterDelay(DateTime.Seconds(0.5), function()
		IdleUnitsLogic2()
		IdlingUnits2(greece)
	end)

end

IdlingUnits2 = function(greece)
	local lazyUnits = greece.GetGroundAttackers()

	Utils.Do(lazyUnits, function(unit)
		IdleHunt2(unit)
	end)
end

IdleHunt2 = function(unit)
	if not unit.IsDead then 
		Trigger.OnIdle(unit, unit.Hunt)		
	end 
end