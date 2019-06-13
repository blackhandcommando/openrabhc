--[[

--]]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

GreeceNavalMinAttackForce = 4
GreeceNavalMaxAttackForce = 5
GreeceInfantryMinAttackForce = 7
GreeceInfantryMaxAttackForce = 20
GreeceVehicleMinAttackForce = 4
GreeceVehicleMaxAttackForce = 18

GreeceInfantryTypes = { "e1.ai", "e2.ai", "e3.ai" }
GreeceNavalTypes = { "dd.ai", "pt.ai", "ca.ai" }
GreeceVehicleTypes = { "1tnk.ai", "2tnk.ai", "arty.ai", "apc.ai" }

GreeceInfantryDelay = DateTime.Seconds(7)
GreeceNavalDelay = DateTime.Seconds(40)
GreeceVehicleDelay = DateTime.Seconds(30)

GreeceMCV = { "mcv" }
GreeceFact = { "fact" }

GreececyardIsBuilding = false

GreeceInfantryAttack = { }
GreeceNavalAttack = { }
GreeceVehicleAttack = { }

GreeceAttackPos = {
	Actor1101,
	Actor1102,
	Actor1103,
}

GreeceRallyPos = {
	Actor1129,
	Actor1130,
	Actor1131,
	Actor1132,
	Actor1133,
	Actor1134,
	Actor1135,
	Actor1136,
}

GreeceNavalRoute1 = { 
	Actor1110.Location,
	Actor1111.Location,
	Actor1112.Location,
	Actor1113.Location,
}

BaseProc = { type = "proc", pos = CPos.New(117, 92), cost = 1500, exists = false }
BaseNuke1 = { type = "powr", pos = CPos.New(120, 96), cost = 600, exists = false }
BaseNuke2 = { type = "powr", pos = CPos.New(123, 95), cost = 600, exists = false }
BaseNuke3 = { type = "powr", pos = CPos.New(113, 96), cost = 600, exists = false }
BaseNuke4 = { type = "powr", pos = CPos.New(123, 105), cost = 600, exists = false }
BaseNuke5 = { type = "apwr", pos = CPos.New(112, 91), cost = 750, exists = false }
RadarDome = { type = "dome", pos = CPos.New(117, 104), cost = 800, exists = false }
InfantryProductionBuilding = { type = "tent", pos = CPos.New(114, 105), cost = 250, exists = false }
VehicleProductionBuilding = { type = "weap", pos = CPos.New(119, 105), cost = 1500, exists = false }
Fix = { type = "fix", pos = CPos.New(123, 99), cost = 600, exists = false }
TechCenter = { type = "atek", pos = CPos.New(126, 93), cost = 2000, exists = false }
AAGun1 = { type = "agun", pos = CPos.New(113, 101), cost = 500, exists = false }
AAGun2 = { type = "agun", pos = CPos.New(122, 94), cost = 500, exists = false }
Bunker1 = { type = "pbox", pos = CPos.New(110, 97), cost = 500, exists = false }
Bunker2 = { type = "pbox", pos = CPos.New(109, 105), cost = 500, exists = false }
Bunker3 = { type = "hbox", pos = CPos.New(112, 108), cost = 500, exists = false }
Turret1 = { type = "gun", pos = CPos.New(111, 103), cost = 500, exists = false }
Turret2 = { type = "gun", pos = CPos.New(110, 100), cost = 500, exists = false }
NavalProductionBuilding = { type = "syrd", pos = CPos.New(116, 80), cost = 1000, exists = false }

GreeceBaseBuildings = { BaseNuke1, BaseProc, BaseNuke2, VehicleProductionBuilding, InfantryProductionBuilding, Bunker1, AAGun1, Turret1, BaseNuke3, BaseNuke4, RadarDome, Fix, Bunker2, Turret2, NavalProductionBuilding, BaseNuke5, AAGun2, TechCenter }

-------------------------------------------------------------------------------------------------------------------------------------------------------------

GreeceStartAI = function()
	Greece.Cash = Greece.Cash + 6000
	GreeceStartReinforcements()
end

GreeceStartReinforcements = function()

	Reinforcements.Reinforce(Greece, GreeceMCV, { Actor1104.Location, Actor1105.Location }, 5, function(actor)
		Trigger.OnIdle(actor, function()
			actor.Move(Actor1106.Location)
			Trigger.AfterDelay(DateTime.Seconds(10), function()
				if GreeceMCVExists then
					GreeceMCVExists = false
					if not actor.IsDead then
						actor.Destroy()
						GreeceConyard = Actor.Create("fact", true, { Owner = Greece, Location = Actor1142.Location })
						GreeceRepairBase()
						GreeceBuildBase(GreeceConyard)
					end
				end
			end)
		end)
	end)

	Trigger.AfterDelay(DateTime.Seconds(1), function()
		Reinforcements.Reinforce(Greece, {"2tnk"}, { Actor1104.Location, Actor1132.Location }, 5, function() end)
	end)

	Trigger.AfterDelay(DateTime.Seconds(2), function()
		Reinforcements.Reinforce(Greece, {"1tnk"}, { Actor1104.Location, Actor1134.Location }, 5, function() end)
	end)

	Trigger.AfterDelay(DateTime.Seconds(3), function()
		Reinforcements.Reinforce(Greece, {"e3"}, { Actor1104.Location, Actor1130.Location }, 5, function() end)
	end)

	Trigger.AfterDelay(DateTime.Seconds(4), function()
		Reinforcements.Reinforce(Greece, {"e1"}, { Actor1104.Location, Actor1129.Location }, 5, function() end)
	end)

	Trigger.AfterDelay(DateTime.Seconds(5), function()
		Reinforcements.Reinforce(Greece, {"arty"}, { Actor1104.Location, Actor1133.Location }, 5, function() end)
	end)

	Trigger.AfterDelay(DateTime.Seconds(6), function()
		Reinforcements.Reinforce(Greece, {"2tnk"}, { Actor1104.Location, Actor1130.Location }, 5, function() end)
	end)

	Trigger.AfterDelay(DateTime.Seconds(7), function()
		Reinforcements.Reinforce(Greece, { "2tnk", "2tnk", "2tnk", "2tnk", "arty", "arty", "arty", "e3", "e3", "e3", "e3", "e1", "e1", "e1" }, { Actor1104.Location, Actor1104.Location }, 5, function(units) 
			Trigger.OnIdle(units, function()
				units.Hunt()
			end)
		end)
	end)

end

GreeceBuildBase = function(cyard)
	Utils.Do(GreeceBaseBuildings, function(building)
		if not building.exists and not GreececyardIsBuilding then
			GreeceBuildBuilding(building, cyard)
			return
		end
	end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() GreeceBuildBase(cyard) end)
end

GreeceBuildBuilding = function(building, cyard)
	GreececyardIsBuilding = true

	--Media.Debug("Building...")

	Trigger.AfterDelay(5/4 * Actor.BuildTime(building.type), function()
		GreececyardIsBuilding = false

		if cyard.IsDead or cyard.Owner ~= Greece then
			--Media.Debug("Cyard doesn't exist...")
			if not GreeceISentEverything then
				GreeceISentEverything = true
				GreeceIdlingUnitsRedAlert()
			end
			return
		end

		--Media.Debug("Building Complete")

		local actor = Actor.Create(building.type, true, { Owner = Greece, Location = building.pos })
		Greece.Cash = Greece.Cash - building.cost

		building.exists = true
		
		if actor.Type == 'tent' then
			Trigger.AfterDelay(DateTime.Seconds(5), function() GreeceInfantryProduction(actor) end)
		elseif actor.Type == 'weap' then
			Trigger.AfterDelay(DateTime.Seconds(5), function() GreeceVehicleProduction(actor) end)
		elseif actor.Type == 'syrd' then
			Trigger.AfterDelay(DateTime.Seconds(5), function() GreeceNavalProduction(actor) end)
		end

		Trigger.OnKilled(actor, function() building.exists = false end)

		Trigger.OnDamaged(actor, function(building)
			if building.Owner == Greece and building.Health < building.MaxHealth * 9/10 then
				building.StartBuildingRepairs()
			end
		end)

		Trigger.AfterDelay(DateTime.Seconds(10), function() GreeceBuildBase(cyard) end)
	end)
end

GreeceInfantryProduction = function(building)

	Trigger.AfterDelay(DateTime.Seconds(5), function()
		if building.IsDead then
			return
		elseif not building.IsDead then
			GreeceInfantryTeam = { Utils.Random(GreeceInfantryTypes) }
			local rallypoint = Utils.Random(GreeceRallyPos)
			building.RallyPoint = rallypoint.Location
			Reinforcements.Reinforce(Greece, GreeceInfantryTeam, { building.Location, rallypoint.Location }, 5, function(unit)
				GreeceInfantryAttack[#GreeceInfantryAttack + 1] = unit

				if #GreeceInfantryAttack >= Utils.RandomInteger(GreeceInfantryMinAttackForce, GreeceInfantryMaxAttackForce) then
					GreeceSendUnits(GreeceInfantryAttack)
					GreeceInfantryAttack = { }
					Trigger.AfterDelay(DateTime.Minutes(1), function() GreeceInfantryProduction(building) end)
				else
					Trigger.AfterDelay(GreeceInfantryDelay, function() GreeceInfantryProduction(building) end)
				end
			end)
		end
	end)
end

GreeceVehicleProduction = function(building)

	GreeceHarvesters = Greece.GetActorsByType("harv")
	Trigger.AfterDelay(DateTime.Seconds(5), function()
		if building.IsDead then
			return
		elseif #GreeceHarvesters < 2 and not building.IsDead then
			local rallypoint = Utils.Random(GreeceRallyPos)
			building.RallyPoint = rallypoint.Location
			building.Produce("harv")

			Trigger.AfterDelay(DateTime.Minutes(1), function() GreeceVehicleProduction(building) end)
		elseif not building.IsDead then
			GreeceVehicleTeam = { Utils.Random(GreeceVehicleTypes) }
			local rallypoint = Utils.Random(GreeceRallyPos)
			building.RallyPoint = rallypoint.Location
			Reinforcements.Reinforce(Greece, GreeceVehicleTeam, { building.Location, rallypoint.Location }, 5, function(unit)
				GreeceVehicleAttack[#GreeceVehicleAttack + 1] = unit

				if #GreeceVehicleAttack >= Utils.RandomInteger(GreeceVehicleMinAttackForce, GreeceVehicleMaxAttackForce) then
					GreeceSendUnits(GreeceVehicleAttack)
					GreeceVehicleAttack = { }
					Trigger.AfterDelay(DateTime.Minutes(0.5), function() GreeceVehicleProduction(building) end)
				else
					Trigger.AfterDelay(GreeceVehicleDelay, function() GreeceVehicleProduction(building) end)
				end
			end)
		end
	end)
end

GreeceNavalProduction = function(building)
	
	local team = { Utils.Random(GreeceNavalTypes) }

	Trigger.AfterDelay(DateTime.Seconds(5), function()
		if building.IsDead then
			return
		elseif not building.IsDead and GreeceNavalPatrol1 and not SecondBaseDestroyed then
			Reinforcements.Reinforce(Greece, team, { building.Location, Actor1110.Location }, 5, function(unit)
				GreeceNavalAttack[#GreeceNavalAttack + 1] = unit
				if #GreeceNavalAttack >= Utils.RandomInteger(GreeceNavalMinAttackForce, GreeceNavalMaxAttackForce) then
					GreeceSendUnitsNaval(GreeceNavalAttack)
					Trigger.AfterDelay(DateTime.Minutes(2), function()
						GreeceNavalProduction(building)
						GreeceNavalAttack = { }
					end)
				else
					Trigger.AfterDelay(GreeceNavalDelay, function()
						GreeceNavalProduction(building)
					end)
				end
			end)
		elseif not building.IsDead and not GreeceNavalPatrol1 then
			local team = { "dd", "dd" }
			Reinforcements.Reinforce(Greece, team, { building.Location, Actor1110.Location }, 5, GreeceSendNavalPatrol1)
			Trigger.AfterDelay(DateTime.Minutes(2), function()
				GreeceNavalProduction(building)
			end)
		end
	end)

end

GreeceSendNavalPatrol1 = function(unit)

	GreeceNavalPatrol1 = true

	if not unit.IsDead then
		Trigger.OnIdle(unit, function()
			unit.Patrol(GreeceNavalRoute1, true)
		end)
	end

	Trigger.OnKilled(unit, function()
		GreeceNavalPatrol1 = false
	end)
end

GreeceRepairBase = function()
	Utils.Do(Map.NamedActors, function(actor)
		if actor.Owner == Greece and actor.HasProperty("StartBuildingRepairs") then
			Trigger.OnDamaged(actor, function(building)
				if building.Owner == Greece and building.Health < 0.9 * building.MaxHealth then
					building.StartBuildingRepairs()
				end
			end)
		end
	end)
end

GreeceSendUnits = function(units)

	local waypoint = Utils.Random(GreeceAttackPos)

	Utils.Do(units, function(unit)
		if not unit.IsDead then
			unit.AttackMove(waypoint.Location)
			Trigger.OnIdle(unit, function()
				unit.Hunt()
			end)
		end
	end)
end

GreeceSendUnitsNaval = function(unit)

	local waypoint = Actor1114

	if not unit.IsDead then
		unit.AttackMove(waypoint.Location)
		Trigger.OnIdle(unit, function()
			unit.AttackMove(waypoint.Location)
		end)
	end
end


GreeceIdlingUnitsRedAlert = function()
	local lazyUnits = Greece.GetGroundAttackers()

	Utils.Do(lazyUnits, function(unit)
		GreeceIdleHuntRedAlert(unit)
	end)
end

GreeceIdleHuntRedAlert = function(unit)
	if not unit.IsDead then 
		Trigger.OnIdle(unit, unit.Hunt)		
	end 
end