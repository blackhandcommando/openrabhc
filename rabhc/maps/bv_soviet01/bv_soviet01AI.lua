--[[

--]]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

if Map.LobbyOption("difficulty") == "easy" then

	EnglandCruiserReinforcements = { "2tnk", "2tnk", "e3", "e1", "e1", "e1" }

	EnglandInfantryMinAttackForce = 2
	EnglandInfantryMaxAttackForce = 3

	EnglandInfantryDelay = DateTime.Seconds(30) --Time the AI will wait after each built Infantry unit
	GlobalDelay = DateTime.Minutes(5) --Time the AI will wait after successfully creating a team

elseif Map.LobbyOption("difficulty") == "normal" then

	EnglandCruiserReinforcements = { "2tnk", "2tnk", "arty", "e3", "e1", "e1", "e1" }

	EnglandInfantryMinAttackForce = 4
	EnglandInfantryMaxAttackForce = 5

	EnglandInfantryDelay = DateTime.Seconds(30) --Time the AI will wait after each built Infantry unit
	GlobalDelay = DateTime.Minutes(3.5) --Time the AI will wait after successfully creating a team

elseif Map.LobbyOption("difficulty") == "hard" then

	EnglandCruiserReinforcements = { "2tnk", "2tnk", "arty", "e3", "e3", "e3", "e3", "e1", "e1", "e1" }

	EnglandInfantryMinAttackForce = 6
	EnglandInfantryMaxAttackForce = 7

	EnglandInfantryDelay = DateTime.Seconds(20) --Time the AI will wait after each built Infantry unit
	GlobalDelay = DateTime.Minutes(2) --Time the AI will wait after successfully creating a team

end

EnglandInfantryTypes = { "e1", "e3" } --Infantry types the AI will build

EnglandInfantryAttack = { }

EnglandAttackPos = {
	Actor371,
	Actor372,
	Actor373,
}

EnglandRallyPos = {
	Actor374,
	Actor375,
	Actor376,
	Actor377,
	Actor378,
}

-------------------------------------------------------------------------------------------------------------------------------------------------------------

EnglandInfantryProduction = function(building)

	EnglandInfantryTeam = { Utils.Random(EnglandInfantryTypes) }

	Trigger.AfterDelay(DateTime.Seconds(5), function()
		if building.IsDead then
			return
		elseif not building.IsDead then
			local rallypoint = Utils.Random(EnglandRallyPos)
			building.RallyPoint = rallypoint.Location
			building.IsPrimaryBuilding = true

			Reinforcements.Reinforce(england, EnglandInfantryTeam, { building.Location, rallypoint.Location }, 5, function(unit)
				EnglandInfantryAttack[#EnglandInfantryAttack + 1] = unit

				if #EnglandInfantryAttack >= Utils.RandomInteger(EnglandInfantryMinAttackForce, EnglandInfantryMaxAttackForce) then
					EnglandSendUnits(EnglandInfantryAttack)
					EnglandInfantryAttack = { }
					Trigger.AfterDelay(GlobalDelay, function() EnglandInfantryProduction(building) end)
				else
					Trigger.AfterDelay(EnglandInfantryDelay, function() EnglandInfantryProduction(building) end)
				end
			end)
		end
	end)

end


EnglandSendReinforcements = function()
	Reinforcements.Reinforce(england, EnglandCruiserReinforcements, { Actor389.Location, Actor390.Location }, 5, function(units) 
		Trigger.OnIdle(units, function()
			units.Hunt()
		end)
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