--[[

--]]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

USSRInfantryTypes = { "e1", "e3", "e4", "shok", "dog" }
USSRNavalTypes = { "ss", "ss", "msub" }
USSRVehicleTypes = { "v2rl", "3tnk", "ftrk", "4tnk", "ttnk", "apc" }
USSRAirType = { "yak.ai" }

HarvesterDead = true
cyardIsBuilding = false

BuildingsBuilt = 0

PatrolDog = { USSRPatrolDog }
Patrol1 = { Actor387, Actor388, Actor389 }
Patrol2 = { Actor390, Actor391, Actor392, Actor393, Actor394, Actor395 }
Patrol3 = { Actor396, Actor397, Actor398, Actor399 }

USSRInfantryAttack = { }
USSRNavalAttack = { }
USSRVehicleAttack = { }
Yaks = { }

DogRoute = { 
	USSRPatrolDogWP1.Location,
	USSRPatrolDogWP2.Location,
	USSRPatrolDogWP3.Location,
}
PatrolRoute1 = {
	USSRPatrol1WP1.Location, 
	USSRPatrol1WP2.Location, 
	USSRPatrol1WP3.Location, 
}
PatrolRoute2 = { 
	USSRPatrol2WP1.Location, 
	USSRPatrol2WP2.Location, 
	USSRPatrol2WP3.Location, 
}
PatrolRoute3 = { 
	USSRPatrol3WP1.Location, 
	USSRPatrol3WP2.Location, 
	USSRPatrol3WP3.Location, 
}
PatrolRoute4 = { 
	USSRPatrol4WP1.Location, 
	USSRPatrol4WP2.Location, 
	USSRPatrol4WP3.Location, 
}

RallyPoints =
{
	USSRRallyPoint1,
	USSRRallyPoint2,
	USSRRallyPoint3,
	USSRRallyPoint4,
	USSRRallyPoint5,
	USSRRallyPoint6,
}

-------------------------------------------------------------------------------------------------------------------------------------------------------------

VehicleProduction = function()
	
	local team = { Utils.Random(USSRVehicleTypes) }

	if Actor113.IsDead then
		return
	elseif HarvesterDead and not Actor113.IsDead then
		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if not Actor113.IsDead then
				ussr.Build({ "harv" }, function(harv)
					harv[1].FindResources()
					Trigger.OnKilled(harv[1], function() HarvesterDead = true end)

					HarvesterDead = false
					VehicleProduction()
				end)
			end
		end)
	else
		local rallypoint = Utils.Random(RallyPoints)
		Actor113.RallyPoint = rallypoint.Location

		if not Actor113.IsDead then
			Trigger.AfterDelay(DateTime.Seconds(1), function()
				if not Actor113.IsDead then
					ussr.Build(team, function(unit)
						USSRVehicleAttack[#USSRVehicleAttack + 1] = unit[1]

						if #USSRVehicleAttack >= Utils.RandomInteger(VehicleMinAttackForce, VehicleMaxAttackForce) then
							SendUnits(USSRVehicleAttack, AttackPosNaval)
							Trigger.AfterDelay(DateTime.Minutes(2), function()
								VehicleProduction()
								USSRVehicleAttack = { }
							end)
						else
							Trigger.AfterDelay(VehicleDelay, VehicleProduction)
						end
					end)
				end
			end)
		else
			Trigger.AfterDelay(DateTime.Minutes(1), VehicleProduction)
		end
	end

end

InfantryProduction = function()

	local team = { Utils.Random(USSRInfantryTypes) }

	if Actor112.IsDead then
		return
	elseif not Actor112.IsDead then
		local rallypoint = Utils.Random(RallyPoints)
		Actor112.RallyPoint = rallypoint.Location
		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if not Actor112.IsDead then
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
	else
		Trigger.AfterDelay(DateTime.Minutes(1), InfantryProduction)
	end

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

SendPatrols = function()
	Trigger.AfterDelay(DateTime.Seconds(3), function()
		GroupPatrol(PatrolDog, DogRoute, DateTime.Seconds(4))
		GroupPatrol(Patrol1, PatrolRoute1, DateTime.Seconds(8))
		GroupPatrol(Patrol2, PatrolRoute2, DateTime.Seconds(8))
		GroupPatrol(Patrol3, PatrolRoute4, DateTime.Seconds(8))
	end)
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
