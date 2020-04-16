--[[

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

	InfantryProduction(Actor140)
	Trigger.AfterDelay(DateTime.Seconds(75), function()
		NavalProduction(Actor110)
		VehicleProduction(Actor139)
	end)
	Trigger.AfterDelay(DateTime.Seconds(180), function() AirProduction(Actor102) end)

end

SendUSSRParadrops = function()

	local powerproxy = Actor.Create("powerproxy.paras1", false, { Owner = ussrpara })
	local unitsA = powerproxy.ActivateParatroopers(ParadropsRally1.CenterPosition,Facing.South)
	if Map.LobbyOption("difficulty") ~= "easy" then
		local unitsB = powerproxy.ActivateParatroopers(ParadropsRally2.CenterPosition,Facing.South)
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
				ussr.Build(team, function(unit)
					local yak = unit[1]
					Yaks[#Yaks + 1] = yak

					Trigger.AfterDelay(YakDelay, function() AirProduction(building) end)

					TargetAndAttack(yak)
				end)
			end
		end)
	end

end

TargetAndAttack = function(yak, target)
	local waypoint = Utils.Random(AttackPosAir)

	if not yak.IsDead then
		yak.AttackMove(waypoint.Location)
	end

	if not target or target.IsDead or (not target.IsInWorld) then
		local enemies = Utils.Where(Map.ActorsInWorld, function(self) return self.Owner == player and self.HasProperty("Health") and yak.CanTarget(self) end)

		if #enemies > 0 then
			target = Utils.Random(enemies)
		end
	end

	if target and yak.AmmoCount() > 0 and yak.CanTarget(target) then
		yak.Attack(target)
	else
		yak.ReturnToBase()
	end

	yak.CallFunc(function()
		TargetAndAttack(yak, target)
	end)
end

VehicleProduction = function(building)

	if not IUseStrongUnits then
		VehicleTeam = { Utils.Random(USSRVehicleTypes1) }
	else
		VehicleTeam = { Utils.Random(USSRVehicleTypes2) }
	end
	USSRHarvesters = ussr.GetActorsByType("harv")

	Trigger.AfterDelay(DateTime.Seconds(5), function()
		if building.IsDead then
			return
		elseif #USSRHarvesters < 2 and not building.IsDead then
			building.IsPrimaryBuilding = true
			building.Produce("harv")

			Trigger.AfterDelay(GlobalDelay, function() VehicleProduction(building) end)
		elseif not building.IsDead then
			building.IsPrimaryBuilding = true
			Reinforcements.Reinforce(ussr, VehicleTeam, { building.Location, Actor540.Location }, 5, function(unit)
				USSRVehicleAttack[#USSRVehicleAttack + 1] = unit

				if #USSRVehicleAttack >= Utils.RandomInteger(VehicleMinAttackForce, VehicleMaxAttackForce) then
					SendUnits(USSRVehicleAttack, AttackPos)
					USSRVehicleAttack = { }
					Trigger.AfterDelay(GlobalDelay, function() VehicleProduction(building) end)
				else
					Trigger.AfterDelay(VehicleDelay, function() VehicleProduction(building) end)
				end
			end)
		end
	end)

end

InfantryProduction = function(building)

	local team = { Utils.Random(USSRInfantryTypes) }

	Trigger.AfterDelay(DateTime.Seconds(5), function()
		if building.IsDead then
			return
		elseif not building.IsDead then
			building.IsPrimaryBuilding = true
			Reinforcements.Reinforce(ussr, team, { building.Location, Actor541.Location }, 5, function(unit)
				USSRInfantryAttack[#USSRInfantryAttack + 1] = unit

				if #USSRInfantryAttack >= Utils.RandomInteger(InfantryMinAttackForce, InfantryMaxAttackForce) then
					SendUnits(USSRInfantryAttack, AttackPos)
					USSRInfantryAttack = { }
					Trigger.AfterDelay(GlobalDelay, function() InfantryProduction(building) end)
				else
					Trigger.AfterDelay(InfantryDelay, function() InfantryProduction(building) end)
				end
			end)
		end
	end)

end

NavalProduction = function(building)
	
	local team = { Utils.Random(USSRNavalTypes) }

	if building.IsDead then
		return
	else
		if not building.IsDead and NavalPatrol1 and NavalPatrol2 then
			Trigger.AfterDelay(DateTime.Seconds(1), function()
				if not building.IsDead then
					Reinforcements.Reinforce(ussr, team, { building.Location, Actor542.Location }, 5, function(unit)
						USSRNavalAttack[#USSRNavalAttack + 1] = unit

						if #USSRNavalAttack >= Utils.RandomInteger(NavalMinAttackForce, NavalMaxAttackForce) then
							SendUnits(USSRNavalAttack, AttackPosNaval)
							Trigger.AfterDelay(DateTime.Minutes(3), function()
								NavalProduction(building)
								USSRNavalAttack = { }
							end)
						else
							Trigger.AfterDelay(NavyDelay, function() NavalProduction(building) end)
						end
					end)
				end
			end)
		elseif not building.IsDead and not NavalPatrol1 then
			local team = { "ss" }
			Reinforcements.Reinforce(ussr, team, { building.Location, Actor542.Location }, 5, SendNavalPatrol1)
			Trigger.AfterDelay(DateTime.Minutes(1), function() NavalProduction(building) end)
		elseif not building.IsDead and not NavalPatrol2 then
			local team = { "ss" }
			Reinforcements.Reinforce(ussr, team, { building.Location, Actor542.Location }, 5, SendNavalPatrol2)
			Trigger.AfterDelay(DateTime.Minutes(2), function() NavalProduction(building) end)
		elseif not building.IsDead and not NavalPatrol3 and not TryMeOnce then
			local team = { "ss", "ss" }
			TryMeOnce = true
			Reinforcements.Reinforce(ussr, team, { building.Location, Actor542.Location }, 5, SendNavalPatrol3)
			Trigger.AfterDelay(DateTime.Minutes(3), function() NavalProduction(building) end)
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

		Trigger.OnRemovedFromWorld(actor, function() building.exists = false end)

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

SendUnits = function(units, waypoints)

	local waypoint = Utils.Random(waypoints)

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

SendNavalPatrol1 = function(unit)

	NavalPatrol1 = true

	if not unit.IsDead then
		Trigger.OnIdle(unit, function()
			unit.Patrol(SSNavalRoute1, true)
		end)
	end

	Trigger.OnKilled(unit, function()
		NavalPatrol1 = false
	end)
end

SendNavalPatrol2 = function(unit)

	NavalPatrol2 = true

	if not unit.IsDead then
		Trigger.OnIdle(unit, function()
			unit.Patrol(SSNavalRoute2, true)
		end)
	end

	Trigger.OnKilled(unit, function()
		NavalPatrol2 = false
	end)
end

SendNavalPatrol3 = function(unit)

	NavalPatrol3 = true

	if not unit.IsDead then
		Trigger.OnIdle(unit, function()
			unit.Patrol(SSNavalRoute3, true)
		end)
	end

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




Trigger.OnRemovedFromWorld(Actor109, function(building)
	BaseProc.exists = false
end)

Trigger.OnRemovedFromWorld(Actor111, function(building)
	BaseNuke1.exists = false
end)

Trigger.OnRemovedFromWorld(Actor112, function(building)
	BaseNuke2.exists = false
end)

Trigger.OnRemovedFromWorld(Actor166, function(building)
	BaseNuke3.exists = false
end)

Trigger.OnRemovedFromWorld(Actor142, function(building)
	BaseNuke4.exists = false
end)

Trigger.OnRemovedFromWorld(Actor141, function(building)
	BaseNuke5.exists = false
end)

Trigger.OnRemovedFromWorld(Actor140, function(building)
	InfantryProductionBuilding.exists = false
end)

Trigger.OnRemovedFromWorld(Actor139, function(building)
	VehicleProductionBuilding.exists = false
end)

Trigger.OnRemovedFromWorld(Actor110, function(building)
	NavalProductionBuilding.exists = false
end)

Trigger.OnRemovedFromWorld(Actor147, function(building)
	BaseHQ.exists = false
end)

Trigger.OnRemovedFromWorld(Actor144, function(building)
	Fix.exists = false
end)

Trigger.OnRemovedFromWorld(Actor143, function(building)
	DogBuilding.exists = false
end)

Trigger.OnRemovedFromWorld(Actor113, function(building)
	TechCenter.exists = false
end)

Trigger.OnRemovedFromWorld(Actor168, function(building)
	SAM1.exists = false
end)

Trigger.OnRemovedFromWorld(Actor167, function(building)
	SAM2.exists = false
end)

Trigger.OnRemovedFromWorld(Actor424, function(building)
	SAM4.exists = false
end)

Trigger.OnRemovedFromWorld(Actor423, function(building)
	SAM5.exists = false
end)

Trigger.OnRemovedFromWorld(Actor169, function(building)
	Flame1.exists = false
end)

Trigger.OnRemovedFromWorld(Actor458, function(building)
	Tesla.exists = false
end)