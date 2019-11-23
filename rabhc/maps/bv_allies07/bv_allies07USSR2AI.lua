--[[

--]]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

if Map.LobbyOption("difficulty") == "easy" then

	USSR2Attackers1 = { "ttnk", "ttnk", "v2rl", "e1", "e1", "e3", "e3", "e3", "e4", "e4" }
	USSR2Attackers2 = { "4tnk", "ttnk", "v2rl", "e1", "e1", "e3", "e3", "e3", "e4", "e4" }

	USSR2NavalMinAttackForce = 2
	USSR2NavalMaxAttackForce = 5
	USSR2InfantryMinAttackForce = 4
	USSR2InfantryMaxAttackForce = 10
	USSR2VehicleMinAttackForce = 4
	USSR2VehicleMaxAttackForce = 10

	USSR2NavyDelay = DateTime.Seconds(150)
	USSR2InfantryDelay = DateTime.Seconds(30)
	USSR2VehicleDelay = DateTime.Seconds(75)
	GlobalDelay = DateTime.Minutes(5) --Time the AI will wait after successfully creating a team

elseif Map.LobbyOption("difficulty") == "normal" then

	USSR2Attackers1 = { "3tnk", "ttnk", "ttnk", "v2rl", "e1", "e1", "e3", "e3", "e3", "e4", "e4" }
	USSR2Attackers2 = { "4tnk", "ttnk", "v2rl", "e1", "e1", "e3", "e3", "e3", "e4", "e4" }

	USSR2NavalMinAttackForce = 2
	USSR2NavalMaxAttackForce = 5
	USSR2InfantryMinAttackForce = 4
	USSR2InfantryMaxAttackForce = 20
	USSR2VehicleMinAttackForce = 5
	USSR2VehicleMaxAttackForce = 10

	USSR2NavyDelay = DateTime.Seconds(120)
	USSR2InfantryDelay = DateTime.Seconds(30)
	USSR2VehicleDelay = DateTime.Seconds(60)
	GlobalDelay = DateTime.Minutes(3.5) --Time the AI will wait after successfully creating a team

elseif Map.LobbyOption("difficulty") == "hard" then

	USSR2Attackers1 = { "3tnk", "3tnk", "ttnk", "ttnk", "v2rl", "e1", "e1", "e3", "e3", "e3", "e4", "e4" }
	USSR2Attackers2 = { "4tnk", "3tnk", "ttnk", "ttnk", "v2rl", "e1", "e1", "e3", "e3", "e3", "e4", "e4" }

	USSR2NavalMinAttackForce = 2
	USSR2NavalMaxAttackForce = 5
	USSR2InfantryMinAttackForce = 4
	USSR2InfantryMaxAttackForce = 30
	USSR2VehicleMinAttackForce = 6
	USSR2VehicleMaxAttackForce = 10

	USSR2NavyDelay = DateTime.Seconds(120)
	USSR2InfantryDelay = DateTime.Seconds(20)
	USSR2VehicleDelay = DateTime.Seconds(45)
	GlobalDelay = DateTime.Minutes(2) --Time the AI will wait after successfully creating a team

end

USSR2InfantryTypes = { "e3", "e4", "shok", "shok" }
USSR2NavalTypes = { "ss", "ss", "msub" }
USSR2VehicleTypes = { "v2rl", "3tnk", "ttnk", "4tnk" }

USSR2cyardIsBuilding = false

USSR2InfantryAttack = { }
USSR2NavalAttack = { }
USSR2VehicleAttack = { }

USSR2AttackPos = {
	Actor1192,
	Actor1193,
	Actor1197,
}

USSR2BaseProc1 = { type = "proc", pos = CPos.New(6, 17), cost = 1500, exists = true }
USSR2BaseProc2 = { type = "proc", pos = CPos.New(12, 17), cost = 1500, exists = true }
USSR2BaseNuke1 = { type = "powr", pos = CPos.New(23, 35), cost = 600, exists = true }
USSR2BaseNuke2 = { type = "powr", pos = CPos.New(20, 36), cost = 600, exists = true }
USSR2BaseNuke3 = { type = "apwr", pos = CPos.New(2, 17), cost = 600, exists = true }
USSR2BaseNuke4 = { type = "apwr", pos = CPos.New(17, 24), cost = 400, exists = true }
USSR2BaseNuke5 = { type = "apwr", pos = CPos.New(21, 26), cost = 400, exists = true }
USSR2BaseNuke6 = { type = "apwr", pos = CPos.New(25, 28), cost = 750, exists = true }
USSR2BaseNuke7 = { type = "apwr", pos = CPos.New(29, 32), cost = 750, exists = true }
USSR2Tesla1 = { type = "tsla", pos = CPos.New(35, 36), cost = 750, exists = true }
USSR2Tesla2 = { type = "tsla", pos = CPos.New(15, 39), cost = 750, exists = true }
USSR2InfantryProductionBuilding = { type = "barr", pos = CPos.New(21, 31), cost = 250, exists = true }
USSR2VehicleProductionBuilding = { type = "weap", pos = CPos.New(4, 24), cost = 1500, exists = true }
USSR2Fix = { type = "fix", pos = CPos.New(7, 29), cost = 600, exists = true }
USSR2TechCenter = { type = "stek", pos = CPos.New(14, 36), cost = 2000, exists = true }
USSR2SAM1 = { type = "sam", pos = CPos.New(33, 35), cost = 500, exists = true }
USSR2SAM2 = { type = "sam", pos = CPos.New(30, 43), cost = 500, exists = true }
USSR2SAM3 = { type = "sam", pos = CPos.New(11, 36), cost = 500, exists = true }
USSR2Flame1 = { type = "ftur", pos = CPos.New(31, 39), cost = 500, exists = true }
USSR2Flame2 = { type = "ftur", pos = CPos.New(25, 43), cost = 500, exists = true }
USSR2Flame3 = { type = "ftur", pos = CPos.New(19, 29), cost = 500, exists = true }
USSR2NavalProductionBuilding = { type = "spen", pos = CPos.New(24, 19), cost = 1000, exists = true }

USSR2BaseBuildings = { USSR2BaseProc1, USSR2BaseProc2, USSR2BaseNuke1, USSR2BaseNuke2, USSR2BaseNuke3, USSR2BaseNuke4, USSR2BaseNuke5, USSR2BaseNuke6, USSR2BaseNuke7, USSR2InfantryProductionBuilding, USSR2VehicleProductionBuilding, USSR2Fix, USSR2TechCenter, USSR2SAM1, USSR2SAM2, USSR2SAM3, USSR2Flame1, USSR2Flame2, USSR2Flame3, USSR2NavalProductionBuilding, USSR2Tesla1, USSR2Tesla2 }

USSR2RallyPos = {
	Actor1203,
	Actor1204,
	Actor1205,
	Actor1206,
	Actor1207,
	Actor1208,
	Actor1209,
	Actor1210,
	Actor1211,
}

USSR2InfRallyPos = {
	Actor1203,
	Actor1204,
	Actor1205,
}

USSR2NavalRoute1 = {
	Actor1212.Location,
	Actor1213.Location,
	Actor1214.Location,
	Actor1215.Location,
}

USSR2Team1 = { Actor1276, Actor1277 }
USSR2Team1Route1 = {
	Actor1208.Location, 
	Actor1209.Location, 
	Actor1204.Location, 
	Actor1203.Location, 
}

USSR2Team2 = { Actor1278, Actor1279 }
USSR2Team2Route1 = {
	Actor1205.Location, 
	Actor1206.Location, 
	Actor1186.Location, 
	Actor1210.Location, 
}

-------------------------------------------------------------------------------------------------------------------------------------------------------------

USSR2SendPatrols = function()
	GroupPatrol(USSR2Team1, USSR2Team1Route1, DateTime.Seconds(4))
	GroupPatrol(USSR2Team2, USSR2Team2Route1, DateTime.Seconds(4))
end

USSR2StartAI = function()

	if not USSR2InfantryProductionActivated then USSR2InfantryProduction(Actor755) end
	if not USSR2VehicleProductionActivated then USSR2VehicleProduction(Actor720) end
	Trigger.AfterDelay(DateTime.Seconds(180), function()
		if not USSR2NavalProductionActivated then USSR2NavalProduction(Actor722) end
	end)

end

USSR2InfantryProduction = function(building)

	USSR2InfantryProductionActivated = true

	USSR2InfantryTeam = { Utils.Random(USSR2InfantryTypes) }

	Trigger.AfterDelay(DateTime.Seconds(5), function()
		if building.IsDead then
			return
		elseif not building.IsDead then
			local rallypoint = Utils.Random(USSR2InfRallyPos)
			building.RallyPoint = rallypoint.Location
			building.IsPrimaryBuilding = true
			Reinforcements.Reinforce(ussr_2, USSR2InfantryTeam, { building.Location, rallypoint.Location }, 5, function(unit)
				USSR2InfantryAttack[#USSR2InfantryAttack + 1] = unit

				if #USSR2InfantryAttack >= Utils.RandomInteger(USSR2InfantryMinAttackForce, USSR2InfantryMaxAttackForce) then
					USSR2SendUnits(USSR2InfantryAttack)
					USSR2InfantryAttack = { }
					Trigger.AfterDelay(GlobalDelay, function() USSR2InfantryProduction(building) end)
				else
					Trigger.AfterDelay(USSR2InfantryDelay, function() USSR2InfantryProduction(building) end)
				end
			end)
		end
	end)

end

USSR2VehicleProduction = function(building)

	USSR2VehicleProductionActivated = true
	USSR2VehicleTeam = { Utils.Random(USSR2VehicleTypes) }
	USSR2Harvesters = ussr_2.GetActorsByType("harv")

	Trigger.AfterDelay(DateTime.Seconds(5), function()
		if building.IsDead then
			return
		elseif #USSR2Harvesters < 2 and not building.IsDead then
			local rallypoint = Utils.Random(GreeceRallyPos)
			building.RallyPoint = rallypoint.Location
			building.Produce("harv")

			Trigger.AfterDelay(GlobalDelay, function() USSR2VehicleProduction(building) end)
		elseif not building.IsDead then
			local rallypoint = Utils.Random(USSR2RallyPos)
			building.RallyPoint = rallypoint.Location
			building.IsPrimaryBuilding = true

			Reinforcements.Reinforce(ussr_2, USSR2VehicleTeam, { building.Location, rallypoint.Location }, 5, function(unit)
				USSR2VehicleAttack[#USSR2VehicleAttack + 1] = unit

				if #USSR2VehicleAttack >= Utils.RandomInteger(USSR2VehicleMinAttackForce, USSR2VehicleMaxAttackForce) then
					USSR2SendUnits(USSR2VehicleAttack)
					USSR2VehicleAttack = { }
					Trigger.AfterDelay(GlobalDelay, function() USSR2VehicleProduction(building) end)
				else
					Trigger.AfterDelay(USSR2VehicleDelay, function() USSR2VehicleProduction(building) end)
				end
			end)
		end
	end)

end

USSR2NavalProduction = function(building)

	USSR2NavalProductionActivated = true
	
	local team = { Utils.Random(USSR2NavalTypes) }

	Trigger.AfterDelay(DateTime.Seconds(5), function()
		if building.IsDead then
			return
		elseif not building.IsDead and USSR2NavalPatrol1 then
			Reinforcements.Reinforce(ussr_2, team, { building.Location, Actor1114.Location }, 5, function(unit)
				USSR2NavalAttack[#USSR2NavalAttack + 1] = unit

				if #USSR2NavalAttack >= Utils.RandomInteger(USSR2NavalMinAttackForce, USSR2NavalMaxAttackForce) then
					USSR2SendUnitsNaval(USSR2NavalAttack)
					Trigger.AfterDelay(DateTime.Minutes(2), function()
						USSR2NavalProduction(building)
						USSR2NavalAttack = { }
					end)
				else
					Trigger.AfterDelay(USSR2NavyDelay, function() USSR2NavalProduction(building) end)
				end
			end)
		elseif not building.IsDead and not USSR2NavalPatrol1 then
			local team = { "ss", "ss" }
			Reinforcements.Reinforce(ussr_2, team, { building.Location, Actor1114.Location }, 5, USSR2SendNavalPatrol1)
			Trigger.AfterDelay(DateTime.Minutes(2), function() USSR2NavalProduction(building) end)
		end
	end)

end

USSR2SendUnitsNaval = function(units)

	local waypoint = Actor1216

	Utils.Do(units, function(unit)
		if not unit.IsDead then
			unit.Stance = "AttackAnything"
			unit.AttackMove(waypoint.Location)
			Trigger.OnIdle(unit, function()
				unit.Hunt()
			end)
		end
	end)

end

USSR2SendNavalPatrol1 = function(unit)

	USSR2NavalPatrol1 = true

	if not unit.IsDead then
		Trigger.OnIdle(unit, function()
			unit.Patrol(USSR2NavalRoute1, true)
		end)
	end

	Trigger.OnKilled(unit, function()
		USSR2NavalPatrol1 = false
	end)
end

SendAttackers1USSR2 = function()

	local team = USSR1Attackers2
	local waypoint = Utils.Random(USSR2AttackPos)

	Trigger.AfterDelay(DateTime.Seconds(1), function()
		Reinforcements.Reinforce(ussr_2, team, { Actor1185.Location, Actor1186.Location }, 5, function(actor)
			if not actor.IsDead then
				actor.AttackMove(waypoint.Location)
				Trigger.OnIdle(actor, function()
					actor.Hunt()
				end)
			end
		end)
	end)

end

SendAttackers2USSR2 = function()

	local team = USSR2Attackers2
	local waypoint = Utils.Random(USSR2AttackPos)

	Trigger.AfterDelay(DateTime.Seconds(1), function()
		Reinforcements.Reinforce(ussr_2, team, { Actor1185.Location, Actor1186.Location }, 5, function(actor)
			if not actor.IsDead then
				actor.AttackMove(waypoint.Location)
				Trigger.OnIdle(actor, function()
					actor.Hunt()
				end)
			end
		end)
	end)

end

USSR2BuildBase = function(cyard)
	Utils.Do(USSR2BaseBuildings, function(building)
		if not building.exists and not USSR2cyardIsBuilding then
			USSR2BuildBuilding(building, cyard)
			return
		end
	end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() USSR2BuildBase(cyard) end)
end

USSR2BuildBuilding = function(building, cyard)
	USSR2cyardIsBuilding = true

	--Media.Debug("Building...")

	Trigger.AfterDelay(5/4 * Actor.BuildTime(building.type), function()
		USSR2cyardIsBuilding = false

		if cyard.IsDead or cyard.Owner ~= ussr_2 then
			--Media.Debug("Cyard doesn't exist...")
			if not USSR2ISentEverything then
				USSR2ISentEverything = true
				USSR2IdlingUnitsRedAlert()
			end
			return
		end

		USSR2BuildingsBuilt = USSR2BuildingsBuilt + 1

		if USSR2BuildingsBuilt == 10 then
			USSR2IdlingUnitsRedAlert()
		end

		--Media.Debug("Building Complete")

		local actor = Actor.Create(building.type, true, { Owner = ussr_2, Location = building.pos })
		ussr_2.Cash = ussr_2.Cash - building.cost

		building.exists = true
		
		if actor.Type == 'barr' then
			Trigger.AfterDelay(DateTime.Seconds(5), function() USSR2InfantryProduction(actor) end)
		elseif actor.Type == 'weap' then
			Trigger.AfterDelay(DateTime.Seconds(5), function() USSR2VehicleProduction(actor) end)
		elseif actor.Type == 'spen' then
			Trigger.AfterDelay(DateTime.Seconds(5), function() USSR2NavalProduction(actor) end)
		end

		Trigger.OnRemovedFromWorld(actor, function() building.exists = false end)

		Trigger.OnDamaged(actor, function(building)
			if building.Owner == ussr_2 and building.Health < building.MaxHealth * 9/10 then
				building.StartBuildingRepairs()
			end
		end)

		Trigger.AfterDelay(DateTime.Seconds(10), function() USSR2BuildBase(cyard) end)
	end)
end

USSR2TriggersAI = function()

	Trigger.OnRemovedFromWorld(Actor855, function(building)
		USSR2BaseProc1.exists = false
	end)

	Trigger.OnRemovedFromWorld(Actor856, function(building)
		USSR2BaseProc2.exists = false
	end)
	
	Trigger.OnRemovedFromWorld(Actor785, function(building)
		USSR2BaseNuke1.exists = false
	end)
	
	Trigger.OnRemovedFromWorld(Actor784, function(building)
		USSR2BaseNuke2.exists = false
	end)
	
	Trigger.OnRemovedFromWorld(Actor859, function(building)
		USSR2BaseNuke3.exists = false
	end)
	
	Trigger.OnRemovedFromWorld(Actor752, function(building)
		USSR2BaseNuke4.exists = false
	end)
	
	Trigger.OnRemovedFromWorld(Actor753, function(building)
		USSR2BaseNuke5.exists = false
	end)

	Trigger.OnRemovedFromWorld(Actor754, function(building)
		USSR2BaseNuke6.exists = false
	end)
	
	Trigger.OnRemovedFromWorld(Actor1201, function(building)
		USSR2BaseNuke7.exists = false
	end)
	
	Trigger.OnRemovedFromWorld(Actor755, function(building)
		USSR2InfantryProductionBuilding.exists = false
	end)
	
	Trigger.OnRemovedFromWorld(Actor720, function(building)
		USSR2VehicleProductionBuilding.exists = false
	end)
	
	Trigger.OnRemovedFromWorld(Actor722, function(building)
		USSR2NavalProductionBuilding.exists = false
	end)
	
	Trigger.OnRemovedFromWorld(Actor756, function(building)
		USSR2Fix.exists = false
	end)
	
	Trigger.OnRemovedFromWorld(Actor757, function(building)
		USSR2TechCenter.exists = false
	end)
	
	Trigger.OnRemovedFromWorld(Actor805, function(building)
		USSR2SAM1.exists = false
	end)
	
	Trigger.OnRemovedFromWorld(Actor1200, function(building)
		USSR2SAM2.exists = false
	end)
	
	Trigger.OnRemovedFromWorld(Actor804, function(building)
		USSR2SAM3.exists = false
	end)
	
	Trigger.OnRemovedFromWorld(Actor807, function(building)
		USSR2Flame1.exists = false
	end)

	Trigger.OnRemovedFromWorld(Actor806, function(building)
		USSR2Flame2.exists = false
	end)

	Trigger.OnRemovedFromWorld(Actor1202, function(building)
		USSR2Flame3.exists = false
	end)
	
	Trigger.OnRemovedFromWorld(Actor783, function(building)
		USSR2Tesla1.exists = false
	end)

	Trigger.OnRemovedFromWorld(Actor782, function(building)
		USSR2Tesla2.exists = false
	end)

end

USSR2RepairBase = function()
	Utils.Do(Map.NamedActors, function(actor)
		if actor.Owner == ussr_2 and actor.HasProperty("StartBuildingRepairs") then
			Trigger.OnDamaged(actor, function(building)
				if building.Owner == ussr_2 and building.Health < 0.9 * building.MaxHealth then
					building.StartBuildingRepairs()
				end
			end)
		end
	end)
end

USSR2SendUnits = function(units)

	local waypoint = Utils.Random(USSR2AttackPos)

	Utils.Do(units, function(unit)
		if not unit.IsDead then
			unit.AttackMove(waypoint.Location)
			Trigger.OnIdle(unit, function()
				unit.Hunt()
			end)
		end
	end)
end

USSR2IdleUnitsLogic = function()

	Trigger.AfterDelay(DateTime.Seconds(0.5), function()
		USSR2IdleUnitsLogic()
		USSR2IdlingUnits(ussr_2)
	end)

end

USSR2IdlingUnits = function(ussr_2)
	local lazyUnits = ussr_2.GetGroundAttackers()

	Utils.Do(lazyUnits, function(unit)
		USSR2IdleHunt(unit)
	end)
end

USSR2IdleHunt = function(unit)
	if not unit.IsDead then 
		if unit.Health < unit.MaxHealth * 9/10 then
			Trigger.OnIdle(unit, unit.Hunt)		
		end
	end 
end

USSR2IdlingUnitsRedAlert = function()
	local lazyUnits = ussr_2.GetGroundAttackers()

	Utils.Do(lazyUnits, function(unit)
		USSR2IdleHuntRedAlert(unit)
	end)
end

USSR2IdleHuntRedAlert = function(unit)
	if not unit.IsDead then 
		Trigger.OnIdle(unit, unit.Hunt)		
	end 
end
