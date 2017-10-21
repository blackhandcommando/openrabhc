--[[

--]]

USSRLastAttack = { }
FinalSovietAttack = function()

	local team = { Utils.Random(USSRExtraTypes4) }
	local waypointstart = Utils.Random(USSRStartWaypoint)
	local attack = Utils.Random(USSRAttackpoints2)

	Trigger.AfterDelay(DateTime.Seconds(1), function()
		Reinforcements.Reinforce(ussr, team, { waypointstart.Location, waypointstart.Location }, 1, function(unit)
			if not unit.IsDead then
				unit.AttackMove(attack.Location)
				Trigger.OnIdle(unit, function()
					unit.Hunt()
				end)
			end
		end)
	end)

end

SendSovietAttackersInfantry = function()

	local team = { Utils.Random(USSRAttackerInfantryTypes) }
	local waypointstart = Utils.Random(USSRStartWaypoint)
	local attack = Utils.Random(USSRAttackpoints2)

	Trigger.AfterDelay(DateTime.Seconds(1), function()
		Reinforcements.Reinforce(ussr, team, { waypointstart.Location, waypointstart.Location }, 1, function(actor)
			if not actor.IsDead then
				actor.AttackMove(attack.Location)
				Trigger.OnIdle(actor, function()
					actor.Hunt()
				end)
			end
		end)
	end)

end

SendSovietAttackersVehicles = function()

	local team = { Utils.Random(USSRAttackerVehicleTypes) }
	local waypointstart = Utils.Random(USSRStartWaypoint)
	local attack = Utils.Random(USSRAttackpoints2)

	Trigger.AfterDelay(DateTime.Seconds(1), function()
		Reinforcements.Reinforce(ussr, team, { waypointstart.Location, waypointstart.Location }, 1, function(actor)
			if not actor.IsDead then
				actor.AttackMove(attack.Location)
				Trigger.OnIdle(actor, function()
					actor.Hunt()
				end)
			end
		end)
	end)

end

SendSovietExtraWaves = function()

	if Wave < 5  then 
		extrateam = { Utils.Random(USSRExtraTypes1) }
	elseif Wave < 9 then
		extrateam = { Utils.Random(USSRExtraTypes2) }
	elseif Wave >= 9 then
		extrateam = { Utils.Random(USSRExtraTypes3) }
	end

	local waypointstart = Utils.Random(USSRStartWaypoint)
	local attack = Utils.Random(USSRAttackpoints)

	Trigger.AfterDelay(DateTime.Seconds(8), function()
		Reinforcements.Reinforce(ussr, extrateam, { waypointstart.Location, waypointstart.Location }, 1, function(actor)
			if not actor.IsDead then
				actor.AttackMove(attack.Location)
				Trigger.OnIdle(actor, function()
					actor.Hunt()
				end)
			end
		end)
	end)

end

SendSovietWaves = function()

	local waypointstart = Utils.Random(USSRStartWaypoint)
	local attack = Utils.Random(USSRAttackpoints)

	Trigger.AfterDelay(DateTime.Seconds(11), function()
		Reinforcements.Reinforce(ussr, ussrteam, { waypointstart.Location, waypointstart.Location }, 1, function(actor)
			if not actor.IsDead then
				actor.AttackMove(attack.Location)
				Trigger.OnIdle(actor, function()
					actor.Hunt()
				end)
			end
		end)
	end)

end

SendGreeceInfantry = function()

	local team = { Utils.Random(GreeceFleeingInfantryTypes) }
	local waypointstart = Utils.Random(StartWaypoint)
	local waypointmid = Utils.Random(MidWaypoint)
	local waypointend = Utils.Random(EndWaypoint)

	Reinforcements.Reinforce(greece, team, { waypointstart.Location, waypointmid.Location }, 1, function(actor)
		if not actor.IsDead then
			Trigger.OnIdle(actor, function()
				actor.Move(waypointend.Location)
			end)
		end
	end)
end

SendGreeceTanks = function()

	local team = { Utils.Random(GreeceFleeingTanksTypes) }
	local waypointstart = Utils.Random(StartWaypoint)
	local waypointmid = Utils.Random(MidWaypoint)
	local waypointend = Utils.Random(EndWaypoint)

	Reinforcements.Reinforce(greece, team, { waypointstart.Location, waypointmid.Location }, 1, function(actor)
		if not actor.IsDead then
			Trigger.OnIdle(actor, function()
				actor.Move(waypointend.Location)
			end)
		end
	end)
end

SendGreeceVehicles = function()

	local team = { Utils.Random(GreeceFleeingVehiclesTypes) }
	local waypointstart = Utils.Random(StartWaypoint)
	local waypointmid = Utils.Random(MidWaypoint)
	local waypointend = Utils.Random(EndWaypoint)

	Reinforcements.Reinforce(greece, team, { waypointstart.Location, waypointmid.Location }, 1, function(actor)
		if not actor.IsDead then
			Trigger.OnIdle(actor, function()
				actor.Move(waypointend.Location)
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
