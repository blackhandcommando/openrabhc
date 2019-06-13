--[[
	Keep this file in case Build method gets fixed
--]]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

USSRNavalTypes = { "ss", "ss", "msub" }
USSRInfantryTypes = { "e1", "e3", "e4", "shok", "dog" }
USSRVehicleTypes1 = { "v2rl", "3tnk", "ftrk", "apc" }
USSRVehicleTypes2 = { "v2rl", "3tnk", "ttnk", "ttnk", "4tnk" }
USSRAirType = { "yak.ai" }

cyardIsBuilding = false
HarvesterDead = true
NavalPatrol1 = false
NavalPatrol2 = false
NavalPatrol3 = false
TryMeOnce = false
IUseStrongUnits = false
FirstAttack = true
ISentEverything = false

BuildingsBuilt = 0
VehicleTeam = 0

USSRInfantryAttack = { }
USSRNavalAttack = { }
USSRVehicleAttack = { }
Yaks = { }

Doggies = { Actor535, Actor536 }

DogRoute = { 
	DogPatrol1.Location,
	DogPatrol2.Location,
	DogPatrol3.Location,
}

SSNavalRoute1 = { 
	NavalRoute1Point1.Location,
	NavalRoute1Point2.Location,
	NavalRoute1Point3.Location,
}

SSNavalRoute2 = {
	NavalRoute2Point1.Location,
	NavalRoute2Point2.Location,
	NavalRoute2Point3.Location,
}

SSNavalRoute3 = {
	NavalRoute3Point1.Location,
	NavalRoute3Point2.Location,
	NavalRoute3Point3.Location,
	NavalRoute3Point4.Location,
}

AttackPos = {
	USSRAttackPoint1,
	USSRAttackPoint2,
	USSRAttackPoint3,
}

AttackPosAir = {
	USSRAttackPoint1,
	USSRAttackPoint2,
	USSRAttackPoint3,
	USSRAttackPointAir1,
	USSRAttackPointAir2,
	USSRAttackPointAir3,
}

AttackPosNaval = {
	NavalAttackPoint1,
	NavalAttackPoint2,
}

BaseProc = { type = "proc", pos = CPos.New(120, 60), cost = 1500, exists = true }
BaseNuke1 = { type = "powr", pos = CPos.New(91, 55), cost = 600, exists = true }
BaseNuke2 = { type = "powr", pos = CPos.New(92, 59), cost = 600, exists = true }
BaseNuke3 = { type = "powr", pos = CPos.New(111, 59), cost = 600, exists = true }
BaseNuke4 = { type = "powr", pos = CPos.New(120, 66), cost = 400, exists = true }
BaseNuke5 = { type = "powr", pos = CPos.New(117, 68), cost = 400, exists = true }
BaseNuke6 = { type = "powr", pos = CPos.New(106, 78), cost = 400, exists = true }
BaseNuke7 = { type = "powr", pos = CPos.New(109, 79), cost = 400, exists = true }
Tesla = { type = "tsla", pos = CPos.New(115, 71), cost = 750, exists = true }
InfantryProductionBuilding = { type = "barr", pos = CPos.New(120, 73), cost = 250, exists = true }
DogBuilding = { type = "kenn", pos = CPos.New(122, 75), cost = 150, exists = true }
VehicleProductionBuilding = { type = "weap", pos = CPos.New(103, 55), cost = 1500, exists = true }
BaseHQ = { type = "dome", pos = CPos.New(105, 60), cost = 750, exists = true }
Fix = { type = "fix", pos = CPos.New(113, 65), cost = 600, exists = true }
TechCenter = { type = "stek", pos = CPos.New(98, 58), cost = 2000, exists = true }
SAM1 = { type = "sam", pos = CPos.New(89, 54), cost = 500, exists = true }
SAM2 = { type = "sam", pos = CPos.New(91, 66), cost = 500, exists = true }
SAM3 = { type = "sam", pos = CPos.New(106, 82), cost = 500, exists = true }
SAM4 = { type = "sam", pos = CPos.New(122, 74), cost = 500, exists = true }
SAM5 = { type = "sam", pos = CPos.New(121, 57), cost = 500, exists = true }
Flame1 = { type = "ftur", pos = CPos.New(116, 74), cost = 500, exists = true }
NavalProductionBuilding = { type = "spen", pos = CPos.New(116, 85), cost = 1000, exists = true }

BaseBuildings = { BaseProc, BaseNuke1, BaseNuke2, BaseNuke3, BaseNuke4, BaseNuke5, BaseNuke6, BaseNuke7, InfantryProductionBuilding, DogBuilding, VehicleProductionBuilding, BaseHQ, Fix, TechCenter, SAM1, SAM2, SAM3, SAM4, SAM5, Flame1, NavalProductionBuilding, Tesla }
USSRHarvesters = { Actor170, Actor538, Actor539, Actor540 }
-------------------------------------------------------------------------------------------------------------------------------------------------------------

StartAI = function()

	InfantryProduction()
	Trigger.AfterDelay(DateTime.Seconds(75), function()
		NavalProduction()
		VehicleProduction()
	end)
	Trigger.AfterDelay(DateTime.Seconds(180), AirProduction)

end

SendUSSRParadrops = function()

	local powerproxy = Actor.Create("powerproxy.paras1", false, { Owner = ussrpara })
	local unitsA = powerproxy.SendParatroopersFrom(ParadropsEntry2.Location, ParadropsRally1.Location)

	if Map.LobbyOption("difficulty") ~= "easy" then
		local unitsB = powerproxy.SendParatroopersFrom(ParadropsEntry2.Location, ParadropsRally2.Location)
	end

	powerproxy.Destroy()

end

AirProduction = function(building)

	local team = { Utils.Random(USSRAirType) }

	if Actor101.IsDead and Actor102.IsDead and Actor103.IsDead then
		return
	else
		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if not Actor101.IsDead and not Actor102.IsDead and not Actor103.IsDead then
				ussr.Build(USSRAirType, function(units)
					local yak = units[1]
					Yaks[#Yaks + 1] = yak

					Trigger.AfterDelay(YakDelay, AirProduction)

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

VehicleProduction = function()

	if not IUseStrongUnits then
		VehicleTeam = { Utils.Random(USSRVehicleTypes1) }
	else
		VehicleTeam = { Utils.Random(USSRVehicleTypes2) }
	end

	if not BaseBuildings[10] then
		return
	elseif HarvesterDead and BaseBuildings[10] then
		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if BaseBuildings[10] then
				ussr.Build({ "harv" }, function(harv)
					harv[1].FindResources()
					Trigger.OnKilled(harv[1], function() HarvesterDead = true end)

					HarvesterDead = false
					VehicleProduction()
				end)
			end
		end)
	elseif BaseBuildings[10] then
		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if BaseBuildings[10] then
				BaseBuildings[10].IsPrimaryBuilding = true
				ussr.Build(VehicleTeam, function(unit)
					USSRVehicleAttack[#USSRVehicleAttack + 1] = unit[1]

					if #USSRVehicleAttack >= Utils.RandomInteger(VehicleMinAttackForce, VehicleMaxAttackForce) then
						SendUnits(USSRVehicleAttack)
						USSRVehicleAttack = { }
						Trigger.AfterDelay(DateTime.Minutes(1), VehicleProduction)
					else
						Trigger.AfterDelay(VehicleDelay, VehicleProduction)
					end
				end)
			end
		end)
	end

end

InfantryProduction = function()

	local team = { Utils.Random(USSRInfantryTypes) }

	if not BaseBuildings[8] then
		return
	elseif BaseBuildings[8] then
		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if BaseBuildings[8] then
				BaseBuildings[8].IsPrimaryBuilding = true
				ussr.Build(team, function(unit)
					USSRInfantryAttack[#USSRInfantryAttack + 1] = unit[1]

					if #USSRInfantryAttack >= Utils.RandomInteger(InfantryMinAttackForce, InfantryMaxAttackForce) then
						SendUnits(USSRInfantryAttack)
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

NavalProduction = function()
	
	local team = { Utils.Random(USSRNavalTypes) }

	if not BaseBuildings[20] then
		return
	else
		if BaseBuildings[20] and NavalPatrol1 and NavalPatrol2 then
			Trigger.AfterDelay(DateTime.Seconds(1), function()
				if BaseBuildings[20] then
					ussr.Build(team, function(unit)
						USSRNavalAttack[#USSRNavalAttack + 1] = unit[1]

						if #USSRNavalAttack >= Utils.RandomInteger(NavalMinAttackForce, NavalMaxAttackForce) then
							SendUnits(USSRNavalAttack, AttackPosNaval)
							Trigger.AfterDelay(DateTime.Minutes(3), function()
								NavalProduction()
								USSRNavalAttack = { }
							end)
						else
							Trigger.AfterDelay(NavyDelay, NavalProduction)
						end
					end)
				end
			end)
		elseif BaseBuildings[20] and not NavalPatrol1 then
			local team = { "ss" }
			ussr.Build(team, SendNavalPatrol1)
			Trigger.AfterDelay(DateTime.Minutes(1), NavalProduction)
		elseif BaseBuildings[20] and not NavalPatrol2 then
			local team = { "ss" }
			ussr.Build(team, SendNavalPatrol2)
			Trigger.AfterDelay(DateTime.Minutes(1), NavalProduction)
		elseif BaseBuildings[20] and not NavalPatrol3 and not TryMeOnce then
			local team = { "ss", "ss" }
			TryMeOnce = true
			ussr.Build(team, SendNavalPatrol3)
			Trigger.AfterDelay(DateTime.Minutes(3), NavalProduction)
		end
	end

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

		if cyard.IsDead or cyard.Owner ~= ussr then
			--Media.Debug("Cyard doesn't exists...")
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

		local actor = Actor.Create(building.type, true, { Owner = ussr, Location = building.pos })
		ussr.Cash = ussr.Cash - building.cost

		building.exists = true
		
		if actor.Type == 'barr' then
			Trigger.AfterDelay(DateTime.Seconds(5), function() InfantryProduction(building) end)
		elseif actor.Type == 'weap' then
			Trigger.AfterDelay(DateTime.Seconds(5), function() VehicleProduction(building) end)
		elseif actor.Type == 'spen' then
			Trigger.AfterDelay(DateTime.Seconds(5), function() NavalProduction(building) end)
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

SendUnits = function(units)

	local waypoint = Utils.Random(AttackPos)

	Utils.Do(units, function(unit)
		if not unit.IsDead then
			unit.AttackMove(waypoint.Location)
			Trigger.OnIdle(unit, function()
				unit.Hunt()
			end)
		end
	end)
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

SendDogPatrol = function()
	Trigger.AfterDelay(DateTime.Seconds(3), function()
		GroupPatrol(Doggies, DogRoute, DateTime.Seconds(6))
	end)
end

SendNavalPatrol1 = function(units)

	NavalPatrol1 = true

	Utils.Do(units, function(unit)
		if not unit.IsDead then
			Trigger.OnIdle(unit, function()
				unit.Patrol(SSNavalRoute1, true)
			end)
		end

		Trigger.OnKilled(unit, function()
			NavalPatrol1 = false
		end)
	end)
end

SendNavalPatrol2 = function(units)

	NavalPatrol2 = true

	Utils.Do(units, function(unit)
		if not unit.IsDead then
			Trigger.OnIdle(unit, function()
				unit.Patrol(SSNavalRoute2, true)
			end)
		end

		Trigger.OnKilled(unit, function()
			NavalPatrol2 = false
		end)
	end)
end

SendNavalPatrol3 = function(units)

	NavalPatrol3 = true

	Utils.Do(units, function(unit)
		if not unit.IsDead then
			Trigger.OnIdle(unit, function()
				unit.Patrol(SSNavalRoute3, true)
			end)
		end

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

IdleHuntPara = function(unit)

	local lazyUnits = ussrpara.GetGroundAttackers()

	Utils.Do(lazyUnits, function(unit)
		if not unit.IsDead then 
			Trigger.OnIdle(unit, unit.Hunt)		
		end 
	end)

end




Trigger.OnKilled(Actor109, function(building)
	BaseProc.exists = false
end)

Trigger.OnKilled(Actor111, function(building)
	BaseNuke1.exists = false
end)

Trigger.OnKilled(Actor112, function(building)
	BaseNuke2.exists = false
end)

Trigger.OnKilled(Actor166, function(building)
	BaseNuke3.exists = false
end)

Trigger.OnKilled(Actor142, function(building)
	BaseNuke4.exists = false
end)

Trigger.OnKilled(Actor141, function(building)
	BaseNuke5.exists = false
end)

Trigger.OnKilled(Actor140, function(building)
	InfantryProductionBuilding.exists = false
end)

Trigger.OnKilled(Actor139, function(building)
	VehicleProductionBuilding.exists = false
end)

Trigger.OnKilled(Actor110, function(building)
	NavalProductionBuilding.exists = false
end)

Trigger.OnKilled(Actor147, function(building)
	BaseHQ.exists = false
end)

Trigger.OnKilled(Actor144, function(building)
	Fix.exists = false
end)

Trigger.OnKilled(Actor143, function(building)
	DogBuilding.exists = false
end)

Trigger.OnKilled(Actor113, function(building)
	TechCenter.exists = false
end)

Trigger.OnKilled(Actor168, function(building)
	SAM1.exists = false
end)

Trigger.OnKilled(Actor167, function(building)
	SAM2.exists = false
end)

Trigger.OnKilled(Actor424, function(building)
	SAM4.exists = false
end)

Trigger.OnKilled(Actor423, function(building)
	SAM5.exists = false
end)

Trigger.OnKilled(Actor169, function(building)
	Flame1.exists = false
end)

Trigger.OnKilled(Actor458, function(building)
	Tesla.exists = false
end)