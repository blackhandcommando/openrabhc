--[[

--]]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

Utils.Do(PatrolDudes, function(Patroler)
	Trigger.OnIdle(Patroler, function()
		Patroler.Patrol(PatrolPath, true)
	end)
end)

Trigger.OnKilled(Actor136, function(building)
	BaseProc.exists = false
end)

Trigger.OnKilled(Actor137, function(building)
	BaseNuke1.exists = false
end)

Trigger.OnKilled(Actor138, function(building)
	BaseNuke2.exists = false
end)

Trigger.OnKilled(Actor169, function(building)
	BaseNuke3.exists = false
end)

Trigger.OnKilled(Actor168, function(building)
	BaseNuke4.exists = false
end)

Trigger.OnKilled(Actor170, function(building)
	BaseNuke5.exists = false
end)

Trigger.OnKilled(USSRBarracks2, function(building)
	InfantryProductionBuilding.exists = false
end)

Trigger.OnKilled(USSRWeaponFactory1, function(building)
	VehicleProductionBuilding.exists = false
end)

Trigger.OnKilled(Actor149, function(building)
	BaseHQ.exists = false
end)

Trigger.OnKilled(Actor225, function(building)
	Fix.exists = false
end)

Trigger.OnKilled(Actor144, function(building)
	Tesla.exists = false
end)

Trigger.OnKilled(Actor166, function(building)
	Airfield.exists = false
end)

CYardDamageTriggered = false

Trigger.OnDamaged(cyard, function()
	if not CYardDamageTriggered and cyard.Health < 0.75 * cyard.MaxHealth then
		CYardDamageTriggered = true
		RedAlert(ussr)
	else
		Trigger.AfterDelay(DateTime.Seconds(60), function()
			CYardDamageTriggered = false
		end)
	end
end)

BaseProc = { type = "proc", pos = CPos.New(67, 83), cost = 1500, exists = true }
BaseNuke1 = { type = "powr", pos = CPos.New(62, 85), cost = 400, exists = true }
BaseNuke2 = { type = "powr", pos = CPos.New(59, 87), cost = 400, exists = true }
BaseNuke3 = { type = "powr", pos = CPos.New(77, 81), cost = 400, exists = true }
BaseNuke4 = { type = "powr", pos = CPos.New(79, 80), cost = 400, exists = true }
BaseNuke5 = { type = "powr", pos = CPos.New(77, 78), cost = 400, exists = true }
InfantryProductionBuilding = { type = "barr", pos = CPos.New(70, 76), cost = 250, exists = true }
VehicleProductionBuilding = { type = "weap", pos = CPos.New(77, 74), cost = 1500, exists = true }
BaseHQ = { type = "dome", pos = CPos.New(84, 73), cost = 750, exists = true }
Fix = { type = "fix", pos = CPos.New(76, 70), cost = 600, exists = true }
Tesla = { type = "tsla", pos = CPos.New(76,68), cost = 1000, exists = true }
Airfield = { type = "afld", pos = CPos.New(52,88), cost = 750, exists = true }

BaseBuildings = { BaseProc, BaseNuke1, BaseNuke2, BaseNuke3, BaseNuke4, BaseNuke5, InfantryProductionBuilding, VehicleProductionBuilding, BaseHQ, Fix, Tesla, Airfield }

-------------------------------------------------------------------------------------------------------------------------------------------------------------

AirProduction = function(building)

	local team = { Utils.Random(USSRAirType) }

	if not BaseBuildings[11] then
		return
	else
		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if BaseBuildings[11] then
				ussr.Build(USSRAirType, function(units)
					local yak = units[1]
					Yaks[#Yaks + 1] = yak

					Trigger.OnKilled(yak, function()
						Trigger.AfterDelay(DateTime.Minutes(1), AirProduction)
					end)

					TargetAndAttack(yak)
				end)
			end
		end)
	end

end

TargetAndAttack = function(yak, target)

	local waypoint = Utils.Random(AttackPosAir)

	if not yak.IsDead then
		Trigger.OnIdle(yak, function()
			yak.AttackMove(waypoint.Location)
			yak.Hunt()
		end)
	end

end

USSRSendV2 = function()
	Trigger.AfterDelay(DateTime.Seconds(75), function()
		Reinforcements.Reinforce(ussr, USSRV2, { USSRV2Entry1.Location, USSRV2Rally1.Location }, 15, function(actor)
			if not actor.IsDead then
				Trigger.OnIdle(actor, function()
					actor.Guard(USSRV2Waypoint1)
				end)
			end
		end)
	end)
end

USSRReinforcements1 = function()
	Trigger.AfterDelay(DateTime.Seconds(10), function()
		Reinforcements.Reinforce(ussr, USSRReinforcementTroop1, { USSReinforceEntry1.Location, USSReinforceRally1.Location }, 15, function(actor)
			if not actor.IsDead then
				Trigger.OnIdle(actor, function()
					actor.Hunt()
				end)
			end
		end)
	end)
end

USSRReinforcements2 = function()
	Trigger.AfterDelay(DateTime.Seconds(10), function()
		Reinforcements.Reinforce(ussr, USSRReinforcementTroop2, { USSReinforceEntry2.Location, USSReinforceRally2.Location }, 15, function(actor)
			if not actor.IsDead then
				Trigger.OnIdle(actor, function()
					actor.Hunt()
				end)
			end
		end)
	end)
end

USSRReinforcements3 = function()
	Trigger.AfterDelay(DateTime.Seconds(10), function()
		Reinforcements.Reinforce(ussr, USSRReinforcementTroop3, { USSReinforceEntry3.Location, USSReinforceRally3.Location }, 15, function(actor)
			if not actor.IsDead then
				Trigger.OnIdle(actor, function()
					actor.Hunt()
				end)
			end
		end)
	end)
end

RedAlert = function(ussr)
	local lazyUnits = ussr.GetGroundAttackers()

	Utils.Do(lazyUnits, function(unit)
		SendEverythingIHave(unit)
	end)
end

SendEverythingIHave = function(unit)
	if not unit.IsDead then 
		Trigger.OnIdle(unit, unit.Hunt)		
	end 
end

USSRFirstTroop = function()
	Utils.Do(USSRFirstTroopUnits, function(actor)
		Trigger.AfterDelay(DateTime.Seconds(20), function()
			if not actor.IsDead then
				Trigger.OnIdle(actor, function()
					actor.Hunt()
				end)
			end
		end)
	end)
end

RepairBase = function()
	Utils.Do(Map.NamedActors, function(actor)
		if actor.Owner == ussr and actor.HasProperty("StartBuildingRepairs") then
			Trigger.OnDamaged(actor, function(building)
				if building.Owner == ussr and building.Health < 0.9 * building.MaxHealth then
					building.StartBuildingRepairs()
				end
			end)
		end
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

	Trigger.AfterDelay(3/4 * Actor.BuildTime(building.type), function()
		cyardIsBuilding = false

		if cyard.IsDead or cyard.Owner ~= ussr then
			return
		end

		local actor = Actor.Create(building.type, true, { Owner = ussr, Location = building.pos })
		ussr.Cash = ussr.Cash - building.cost

		building.exists = true
		
		if actor.Type == 'barr' then
			Trigger.AfterDelay(DateTime.Seconds(5), function() InfantryProduction(building) end)
		elseif actor.Type == 'weap' then
			Trigger.AfterDelay(DateTime.Seconds(5), function() VehicleProduction(building) end)
		end

		Trigger.OnKilled(actor, function() building.exists = false end)

		Trigger.OnDamaged(actor, function(building)
			if building.Owner == ussr and building.Health < building.MaxHealth * 9/10 then
				building.StartBuildingRepairs()
			end
		end)

		Trigger.AfterDelay(DateTime.Seconds(10), function() BuildBase(cyard) end)
	end)
end

InfantryProduction = function(building)

	local team = { Utils.Random(USSRInfantryTypes) }

	if not BaseBuildings[6] and USSRBarracks1.IsDead then
		return
	elseif not USSRBarracks1.IsDead then
		USSRBarracks1.IsPrimaryBuilding = true
		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if not USSRBarracks1.IsDead then
				ussr.Build(team, function(unit)
					USSRInfantryAttack[#USSRInfantryAttack + 1] = unit[1]

					if #USSRInfantryAttack >= Utils.RandomInteger(InfantryMinAttackForce, InfantryMaxAttackForce) then
						SendUnits(USSRInfantryAttack, AttackPos)
						USSRInfantryAttack = { }
						Trigger.AfterDelay(DateTime.Minutes(1), InfantryProduction)
					else
						Trigger.AfterDelay(InfantryDelay, InfantryProduction)
					end
				end)
			end
		end)
	elseif BaseBuildings[6] and USSRBarracks1.IsDead then
		BaseBuildings[6].IsPrimaryBuilding = true
		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if not BaseBuildings[6].IsDead then
				ussr.Build(team, function(unit)
					USSRInfantryAttack[#USSRInfantryAttack + 1] = unit[1]

					if #USSRInfantryAttack >= Utils.RandomInteger(InfantryMinAttackForce, InfantryMaxAttackForce) then
						SendUnits(USSRInfantryAttack, AttackPos)
						USSRInfantryAttack = { }
						Trigger.AfterDelay(DateTime.Minutes(1), InfantryProduction)
					else
						Trigger.AfterDelay(InfantryDelay, InfantryProduction)
					end
				end)
			end
		end)
	end

end

VehicleProduction = function(building)

	local team = { Utils.Random(USSRVehicleTypes) }

	if not BaseBuildings[7] then
		return
	--elseif HarvesterLessThan2() then
	--	ussr.Build(Harvester, function() end)
	--	Trigger.AfterDelay(DateTime.Seconds(30), function() VehicleProduction() end)
	else
		if not USSRWeaponFactory1.IsDead then
			Trigger.AfterDelay(DateTime.Seconds(1), function()
				ussr.Build(team, function(unit)
					USSRVehicleAttack[#USSRVehicleAttack + 1] = unit[1]

					if #USSRVehicleAttack >= Utils.RandomInteger(VehicleMinAttackForce, VehicleMaxAttackForce) then
						SendUnits(USSRVehicleAttack, AttackPos)
						USSRVehicleAttack = { }
						Trigger.AfterDelay(DateTime.Minutes(0.5), VehicleProduction)
					else
						Trigger.AfterDelay(VehicleDelay, VehicleProduction)
					end
				end)
			end)
		end
	end

end

SendUnits = function(units, waypoints)
	Utils.Do(units, function(unit)
		if not unit.IsDead then
			Utils.Do(waypoints, function(waypoint)
				unit.AttackMove(waypoint.Location)
			end)
			unit.Hunt()
		end
	end)
end

HarvesterLessThan2 = function()
	local harv = ussr.GetActorsByType("harv")
	return #harv < 2
end

EnemyMoney = function()
	Trigger.AfterDelay(DateTime.Seconds(30), function()
		if ussr.Cash < 500 then
			ussr.Cash = ussr.Cash + 725
		end
		EnemyMoney()
	end)
end

IdleUnitsLogic = function()

	Trigger.AfterDelay(DateTime.Seconds(0.5), function()
		IdleUnitsLogic()
		IdlingUnits(ussr)
	end)

end

IdlingUnits = function(ussr)
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
