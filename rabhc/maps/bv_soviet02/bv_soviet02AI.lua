--[[

--]]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

if Map.LobbyOption("difficulty") == "easy" then

	EnglandInfantryMinAttackForce = 3
	EnglandInfantryMaxAttackForce = 4
	EnglandVehicleMinAttackForce = 2
	EnglandVehicleMaxAttackForce = 4

	EnglandInfantryDelay = DateTime.Seconds(30) --Time the AI will wait after each built Infantry unit
	EnglandVehicleDelay = DateTime.Seconds(50) --Time the AI will wait after each built vehicle unit
	EnglandNavalDelay = DateTime.Minutes(5)
	EnglandAirDelay = DateTime.Minutes(3)
	GlobalDelay = DateTime.Minutes(4) --Time the AI will wait after successfully creating a team

elseif Map.LobbyOption("difficulty") == "normal" then

	EnglandInfantryMinAttackForce = 3
	EnglandInfantryMaxAttackForce = 5
	EnglandVehicleMinAttackForce = 4
	EnglandVehicleMaxAttackForce = 6

	EnglandInfantryDelay = DateTime.Seconds(15) --Time the AI will wait after each built Infantry unit
	EnglandVehicleDelay = DateTime.Seconds(25) --Time the AI will wait after each built vehicle unit
	EnglandNavalDelay = DateTime.Minutes(3.25)
	EnglandAirDelay = DateTime.Minutes(3)
	GlobalDelay = DateTime.Minutes(2.75) --Time the AI will wait after successfully creating a team

elseif Map.LobbyOption("difficulty") == "hard" then

	EnglandInfantryMinAttackForce = 4
	EnglandInfantryMaxAttackForce = 6
	EnglandVehicleMinAttackForce = 5
	EnglandVehicleMaxAttackForce = 6

	EnglandInfantryDelay = DateTime.Seconds(5) --Time the AI will wait after each built Infantry unit
	EnglandVehicleDelay = DateTime.Seconds(10) --Time the AI will wait after each built vehicle unit
	EnglandNavalDelay = DateTime.Minutes(2)
	EnglandAirDelay = DateTime.Minutes(2)
	GlobalDelay = DateTime.Minutes(1.5) --Time the AI will wait after successfully creating a team

end

EnglandInfantryTypes = { "e1", "e3" } --Infantry types the AI will build
EnglandVehicleTypes = { "1tnk", "2tnk", "jeep" } --Vehicle types the AI will build
EnglandNavalTypes = { "dd" } --Naval types the AI will build
EnglandAirTypes = { "hind" } --Air types the AI will build

EnglandInfantryAttack = { }
EnglandVehicleAttack = { }

EnglandAttackPos = {
	Actor328,
	Actor329,
	Actor330,
}

EnglandAirAttackPos = {
	Actor366,
	Actor367,
	Actor368,
	Actor369,
}

EnglandAirEntryPos = {
	Actor363,
	Actor364,
	Actor365,
}

RallyPoints1 = { 
	Actor323, 
	Actor324, 
	Actor325, 
	Actor326, 
	Actor327,
}

RallyPoints2 = { 
	Actor335, 
	Actor336, 
	Actor337, 
	Actor338, 
	Actor339, 
	Actor340, 
	Actor341, 
	Actor342,
}

RallyPoints3 = { 
	Actor343, 
	Actor344, 
	Actor345, 
	Actor346,
}

NavalPatrolPoints = { 
	Actor403.Location, 
	Actor406.Location, 
	Actor404.Location, 
	Actor405.Location,
}

BaseProc1 = { type = "proc", pos = CPos.New(72, 36), cost = 1500, exists = true }
BaseProc2 = { type = "proc", pos = CPos.New(82, 22), cost = 1500, exists = true }
BaseNuke1 = { type = "powr", pos = CPos.New(75, 34), cost = 600, exists = true }
BaseNuke2 = { type = "powr", pos = CPos.New(78, 36), cost = 600, exists = true }
BaseNuke3 = { type = "powr", pos = CPos.New(83, 29), cost = 600, exists = true }
BaseNuke4 = { type = "powr", pos = CPos.New(80, 27), cost = 600, exists = true }
InfantryProductionBuilding = { type = "tent", pos = CPos.New(84, 34), cost = 250, exists = true }
VehicleProductionBuilding = { type = "weap", pos = CPos.New(86, 26), cost = 1500, exists = true }
NavalProductionBuilding = { type = "syrd", pos = CPos.New(76, 49), cost = 1000, exists = true }
AGun1 = { type = "agun", pos = CPos.New(74, 33), cost = 500, exists = true }
AGun2 = { type = "agun", pos = CPos.New(89, 29), cost = 500, exists = true }
Pill1 = { type = "pbox", pos = CPos.New(75, 40), cost = 500, exists = true }
Pill2 = { type = "pbox", pos = CPos.New(85, 25), cost = 500, exists = true }
Gun1 = { type = "gun", pos = CPos.New(79, 23), cost = 500, exists = true }
Gun2 = { type = "gun", pos = CPos.New(70, 39), cost = 500, exists = true }
Fix = { type = "fix", pos = CPos.New(76, 28), cost = 600, exists = true }

BaseBuildings = { BaseProc1, BaseProc2, BaseNuke1, BaseNuke2, BaseNuke3, BaseNuke4, InfantryProductionBuilding, VehicleProductionBuilding, NavalProductionBuilding, AGun1, AGun2, Pill1, Pill2, Gun1, Gun2, Fix }

-------------------------------------------------------------------------------------------------------------------------------------------------------------

EnglandInfantryProduction = function(building,rallypoints)

	local EnglandInfantryTeam = { Utils.Random(EnglandInfantryTypes) }

	Trigger.AfterDelay(DateTime.Seconds(5), function()
		if building.IsDead then
			return
		elseif not building.IsDead then
			local rallypoint = Utils.Random(rallypoints)
			building.RallyPoint = rallypoint.Location
			building.IsPrimaryBuilding = true

			Reinforcements.Reinforce(england, EnglandInfantryTeam, { building.Location, rallypoint.Location }, 5, function(unit)
				EnglandInfantryAttack[#EnglandInfantryAttack + 1] = unit

				if #EnglandInfantryAttack >= Utils.RandomInteger(EnglandInfantryMinAttackForce, EnglandInfantryMaxAttackForce) then
					EnglandSendUnits(EnglandInfantryAttack)
					EnglandInfantryAttack = { }
					Trigger.AfterDelay(GlobalDelay, function() EnglandInfantryProduction(building,rallypoints) end)
				else
					Trigger.AfterDelay(EnglandInfantryDelay, function() EnglandInfantryProduction(building,rallypoints) end)
				end
			end)
		end
	end)

end


EnglandVehicleProduction = function(building,rallypoints)

	local VehicleTeam = { Utils.Random(EnglandVehicleTypes) }
	local EnglandHarvesters = england.GetActorsByType("harv")

	Trigger.AfterDelay(DateTime.Seconds(5), function()
		if building.IsDead then
			return
		elseif #EnglandHarvesters < 2 and not building.IsDead and Base1Destroyed then
			local rallypoint = Utils.Random(rallypoints)
			building.RallyPoint = rallypoint.Location
			building.IsPrimaryBuilding = true
			building.Produce("harv")

			Trigger.AfterDelay(GlobalDelay, function() EnglandVehicleProduction(building,rallypoints) end)
		elseif not building.IsDead then
			local rallypoint = Utils.Random(rallypoints)
			building.RallyPoint = rallypoint.Location
			building.IsPrimaryBuilding = true

			Reinforcements.Reinforce(england, VehicleTeam, { building.Location, rallypoint.Location }, 5, function(unit)
				EnglandVehicleAttack[#EnglandVehicleAttack + 1] = unit

				if #EnglandVehicleAttack >= Utils.RandomInteger(EnglandVehicleMinAttackForce, EnglandVehicleMaxAttackForce) then
					EnglandSendUnits(EnglandVehicleAttack)
					EnglandVehicleAttack = { }
					Trigger.AfterDelay(GlobalDelay, function() EnglandVehicleProduction(building,rallypoints) end)
				else
					Trigger.AfterDelay(EnglandVehicleDelay, function() EnglandVehicleProduction(building,rallypoints) end)
				end
			end)
		end
	end)

end


EnglandNavalProduction = function(building,rallypoints)
	
	local team = { Utils.Random(EnglandNavalTypes) }

	Trigger.AfterDelay(DateTime.Seconds(5), function()
		if building.IsDead then
			return
		elseif not building.IsDead and not EnglandNavalPatrol1 then
			local team = { "dd", "dd" }
			Reinforcements.Reinforce(england, team, { building.Location, Actor403.Location }, 5, EnglandSendNavalPatrol)
			Trigger.AfterDelay(EnglandNavalDelay, function()
				EnglandNavalProduction(building,rallypoints)
			end)
		else
			Trigger.AfterDelay(GlobalDelay, function()
				EnglandNavalProduction(building,rallypoints)
			end)
		end
	end)

end


EnglandAirReinforcements = function()

	local team = { Utils.Random(EnglandAirTypes) }
	local entrypoint = Utils.Random(EnglandAirEntryPos)

	if Actor94.IsDead and Actor95.IsDead and Actor96.IsDead and Actor97.IsDead then
		return
	else
		Reinforcements.Reinforce(england, team, { entrypoint.Location, entrypoint.Location }, 15, function(hind) 
			Trigger.OnIdle(hind, function()
				local attackpos = Utils.Random(EnglandAirAttackPos)
				hind.AttackMove(attackpos.Location)
				hind.Hunt()
			end)
		end)
		Trigger.AfterDelay(EnglandAirDelay, EnglandAirReinforcements)
	end
end


EnglandSendNavalPatrol = function(unit)
	EnglandNavalPatrol1 = true

	if not unit.IsDead then
		Trigger.OnIdle(unit, function()
			unit.Patrol(NavalPatrolPoints, true)
		end)
	end
	
	Trigger.OnKilled(unit, function()
		EnglandNavalPatrol1 = false
	end)
end


BuildBase = function(cyard)
	Utils.Do(BaseBuildings, function(building)
		if not building.exists and not cyardIsBuilding then
			BuildBuilding(building, cyard)
			return
		end
	end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() BuildBase(cyard) end)
end


BuildBuilding = function(building, cyard)
	cyardIsBuilding = true

	--Media.Debug("Building...")

	Trigger.AfterDelay(5/4 * Actor.BuildTime(building.type), function()
		cyardIsBuilding = false

		if cyard.IsDead or cyard.Owner ~= england then
			--Media.Debug("Cyard doesn't exist...")
			if not ISentEverything then
				ISentEverything = true
				IdlingUnitsRedAlert()
			end
			return
		end

		BuildingsBuilt = BuildingsBuilt + 1

		if BuildingsBuilt == 10 then
			IdlingUnitsRedAlert()
		end

		--Media.Debug("Building Complete")

		local actor = Actor.Create(building.type, true, { Owner = england, Location = building.pos })
		england.Cash = england.Cash - building.cost

		building.exists = true
		
		if actor.Type == 'tent' and Actor324.IsDead then
			Trigger.AfterDelay(DateTime.Seconds(5), function() EnglandInfantryProduction2(actor) end)
		elseif actor.Type == 'weap' then
			Trigger.AfterDelay(DateTime.Seconds(5), function() EnglandVehicleProduction(actor) end)
		elseif actor.Type == 'syrd' then
			Trigger.AfterDelay(DateTime.Seconds(5), function() EnglandNavalProduction(actor) end)
		end

		Trigger.OnKilled(actor, function() building.exists = false end)

		Trigger.OnDamaged(actor, function(building)
			if building.Owner == england and building.Health < building.MaxHealth * 9/10 then
				building.StartBuildingRepairs()
			end
		end)

		Trigger.AfterDelay(DateTime.Seconds(10), function() BuildBase(cyard) end)
	end)
end


TriggersAI = function()

	Trigger.OnKilled(Actor164, function(building)
		BaseProc1.exists = false
	end)
	
	Trigger.OnKilled(Actor165, function(building)
		BaseProc2.exists = false
	end)

	Trigger.OnKilled(Actor171, function(building)
		BaseNuke1.exists = false
	end)
	
	Trigger.OnKilled(Actor172, function(building)
		BaseNuke2.exists = false
	end)
	
	Trigger.OnKilled(Actor162, function(building)
		BaseNuke3.exists = false
	end)
	
	Trigger.OnKilled(Actor163, function(building)
		BaseNuke4.exists = false
	end)
	
	Trigger.OnKilled(Actor161, function(building)
		InfantryProductionBuilding.exists = false
	end)
	
	Trigger.OnKilled(Actor153, function(building)
		VehicleProductionBuilding.exists = false
	end)
	
	Trigger.OnKilled(Actor168, function(building)
		NavalProductionBuilding.exists = false
	end)
	
	Trigger.OnKilled(Actor166, function(building)
		Fix.exists = false
	end)
	
	Trigger.OnKilled(Actor385, function(building)
		AGun1.exists = false
	end)
	
	Trigger.OnKilled(Actor386, function(building)
		AGun2.exists = false
	end)
	
	Trigger.OnKilled(Actor447, function(building)
		Pill1.exists = false
	end)

	Trigger.OnKilled(Actor448, function(building)
		Pill2.exists = false
	end)
	
	Trigger.OnKilled(Actor449, function(building)
		Gun1.exists = false
	end)

	Trigger.OnKilled(Actor167, function(building)
		Gun2.exists = false
	end)
end


EnglandRepairBase = function()
	Utils.Do(Map.NamedActors, function(actor)
		if actor.Owner == england and actor.HasProperty("StartBuildingRepairs") then
			Trigger.OnDamaged(actor, function(building)
				if building.Owner == england and building.Health < 0.9 * building.MaxHealth then
					building.StartBuildingRepairs()
				end
			end)
		end
	end)
end


EnglandSendUnits = function(units)

	local waypoint = Utils.Random(EnglandAttackPos)

	Utils.Do(units, function(unit)
		if not unit.IsDead then
			unit.AttackMove(waypoint.Location)
			Trigger.OnIdle(unit, function()
				unit.Hunt()
			end)
		end
	end)
end


EnglandIdleUnitsLogic = function()

	Trigger.AfterDelay(DateTime.Seconds(0.5), function()
		EnglandIdleUnitsLogic()
		EnglandIdlingUnits(england)
	end)

end


EnglandIdlingUnits = function(england)
	local lazyUnits = england.GetGroundAttackers()

	Utils.Do(lazyUnits, function(unit)
		EnglandIdleHunt(unit)
	end)
end


EnglandIdleHunt = function(unit)
	if not unit.IsDead then 
		if unit.Health < unit.MaxHealth * 9/10 then
			Trigger.OnIdle(unit, unit.Hunt)		
		end
	end 
end


IdlingUnitsRedAlert = function()
	local lazyUnits = england.GetGroundAttackers()

	Utils.Do(lazyUnits, function(unit)
		IdleHuntRedAlert(unit)
	end)
end


IdleHuntRedAlert = function(unit)
	if not unit.IsDead then 
		Trigger.OnIdle(unit, unit.Hunt)		
	end 
end