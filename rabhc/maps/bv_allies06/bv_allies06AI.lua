--[[

--]]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

if Map.LobbyOption("difficulty") == "easy" then

	USSRMadTankGuards = { "3tnk", "e1", "e1", "e1", "ftrk" }--Guards USSRMadTank until USSRMadTank is set to hunt
	USSRSecondWavev = { "3tnk" }
	USSRLargeAttackv = { "4tnk", "4tnk", "ttnk", "ttnk", "ttnk", "3tnk", "3tnk", "shok", "shok", "shok", "shok" }

	NavalMinAttackForce = 2
	NavalMaxAttackForce = 5
	InfantryMinAttackForce = 6
	InfantryMaxAttackForce = 10
	VehicleMinAttackForce = 5
	VehicleMaxAttackForce = 10

	LargeAttackDelay = DateTime.Minutes(18)
	MadTankAttackDelay = DateTime.Minutes(15)
	NavyDelay = DateTime.Seconds(120)
	InfantryDelay = DateTime.Seconds(30)
	VehicleDelay = DateTime.Seconds(50)
	YakDelay = DateTime.Seconds(300)

elseif Map.LobbyOption("difficulty") == "normal" then

	USSRMadTankGuards = { "3tnk", "3tnk", "e1", "e1", "e1", "ftrk" }--Guards USSRMadTank until USSRMadTank is set to hunt
	USSRSecondWavev = { "3tnk", "3tnk" }
	USSRLargeAttackv = { "4tnk", "4tnk", "4tnk", "4tnk", "ttnk", "ttnk", "ttnk", "3tnk", "3tnk", "shok", "shok", "shok", "shok" }

	NavalMinAttackForce = 2
	NavalMaxAttackForce = 5
	InfantryMinAttackForce = 10
	InfantryMaxAttackForce = 20
	VehicleMinAttackForce = 7
	VehicleMaxAttackForce = 10

	LargeAttackDelay = DateTime.Minutes(16)
	MadTankAttackDelay = DateTime.Minutes(13)
	NavyDelay = DateTime.Seconds(90)
	InfantryDelay = DateTime.Seconds(20)
	VehicleDelay = DateTime.Seconds(40)
	YakDelay = DateTime.Seconds(200)

elseif Map.LobbyOption("difficulty") == "hard" then

	USSRMadTankGuards = { "3tnk", "3tnk", "ttnk", "e1", "e1", "e1", "ftrk" }--Guards USSRMadTank until USSRMadTank is set to hunt
	USSRSecondWavev = { "3tnk", "3tnk", "v2rl" }
	USSRLargeAttackv = { "4tnk", "4tnk", "4tnk", "4tnk", "4tnk", "ttnk", "ttnk", "ttnk", "3tnk", "3tnk", "shok", "shok", "shok", "shok" }

	NavalMinAttackForce = 2
	NavalMaxAttackForce = 5
	InfantryMinAttackForce = 15
	InfantryMaxAttackForce = 25
	VehicleMinAttackForce = 7
	VehicleMaxAttackForce = 15

	LargeAttackDelay = DateTime.Minutes(14)
	MadTankAttackDelay = DateTime.Minutes(11)
	NavyDelay = DateTime.Seconds(60)
	InfantryDelay = DateTime.Seconds(10)
	VehicleDelay = DateTime.Seconds(30)
	YakDelay = DateTime.Seconds(150)

end

USSRInfantryTypes1 = { "e1", "e3", "e4", "shok", "shok" }
USSRInfantryTypes2 = { "e3", "e4", "shok", "shok", "dog" }
USSRNavalTypes = { "ss" }
USSRVehicleTypes1 = { "v2rl", "3tnk", "ftrk", "ttnk" }
USSRVehicleTypes2 = { "v2rl", "3tnk", "ttnk", "4tnk" }
USSRAirType = { "yak.ai", "mig.ai" }
USSRMadTankTank = { "dtrk" }

HarvesterDead = true
cyardIsBuilding = false

USSRInfantryAttack = { }
USSRNavalAttack = { }
USSRVehicleAttack = { }
Yaks = { }

USSRTeam1 = { Actor157, Actor158 }
USSRTeam2 = { Actor154, Actor155, Actor156 }
USSRTeam3 = { Actor117, Actor118 }
USSRTeam4 = { Actor404, Actor406, Actor413 }
USSRTeam5 = { Actor394, Actor400 }
USSRTeam6 = { Actor121, Actor122 }
USSRTeam7 = { Actor482, Actor483, Actor484, Actor485 }
USSRTeam8 = { Actor492, Actor493, Actor494 }
USSRTeam9 = { Actor495, Actor496, Actor497 }
USSRTeam10 = { Actor498, Actor499, Actor500, Actor501, Actor502, Actor503 }
USSRTeam11 = { Actor528, Actor529 }
USSRTeam12 = { Actor256, Actor257, Actor538, Actor539, Actor540, Actor541 }
USSRTeam13 = { Actor534, Actor535 }
USSRTeam14 = { Actor536, Actor537 }
USSRTeam15 = { Actor521, Actor556, Actor557 }
USSRTeam16 = { Actor887, Actor888 }
USSRTeam17 = { Actor885, Actor886 }

DefendableBuildings = { Actor519, Actor551, Actor520, Actor718, Actor775, Actor310, Actor770 }
MissileSilos = { Actor519, Actor551, Actor520 }

PatrolRoute1 = {
	Actor407.Location, 
	Actor408.Location, 
	Actor409.Location, 
}

PatrolRoute2 = {
	Actor411.Location, 
	Actor412.Location, 
}

PatrolRoute3 = {
	Actor486.Location, 
	Actor487.Location, 
}

PatrolRoute4 = {
	Actor488.Location, 
	Actor489.Location, 
}

PatrolRoute5 = {
	Actor490.Location, 
	Actor491.Location, 
}

PatrolRoute6 = {
	Actor530.Location, 
	Actor531.Location, 
	Actor532.Location, 
	Actor533.Location, 
}

PatrolRoute7 = {
	Actor816.Location, 
	Actor814.Location, 
	Actor811.Location, 
	Actor810.Location, 
}

PatrolRoute8 = {
	Actor889.Location, 
	Actor927.Location, 
	Actor928.Location,  
}



SSNavalRoute1 = { 
	Actor822.Location,
	Actor823.Location,
}

SSNavalRoute2 = {
	Actor822.Location,
	Actor823.Location,
	Actor824.Location,
	Actor825.Location,
}

BaseProc = { type = "proc", pos = CPos.New(35, 25), cost = 1500, exists = true }
BaseNuke1 = { type = "powr", pos = CPos.New(34, 30), cost = 600, exists = true }
BaseNuke2 = { type = "powr", pos = CPos.New(31, 31), cost = 600, exists = true }
BaseNuke3 = { type = "powr", pos = CPos.New(20, 41), cost = 600, exists = true }
BaseNuke4 = { type = "powr", pos = CPos.New(6, 38), cost = 400, exists = true }
BaseNuke5 = { type = "powr", pos = CPos.New(35, 38), cost = 400, exists = true }
BaseNuke6 = { type = "apwr", pos = CPos.New(38, 28), cost = 750, exists = true }
BaseNuke7 = { type = "apwr", pos = CPos.New(25, 25), cost = 750, exists = true }
BaseNuke8 = { type = "apwr", pos = CPos.New(21, 24), cost = 750, exists = true }
BaseNuke9 = { type = "apwr", pos = CPos.New(16, 28), cost = 750, exists = true }
Tesla1 = { type = "tsla", pos = CPos.New(11, 45), cost = 750, exists = true }
Tesla2 = { type = "tsla", pos = CPos.New(28, 44), cost = 750, exists = true }
Tesla3 = { type = "tsla", pos = CPos.New(36, 36), cost = 750, exists = true }
AirProductionBuilding = { type = "afld", pos = CPos.New(26, 33), cost = 750, exists = true }
InfantryProductionBuilding = { type = "barr", pos = CPos.New(17, 39), cost = 250, exists = true }
DogBuilding = { type = "kenn", pos = CPos.New(14, 32), cost = 150, exists = true }
VehicleProductionBuilding = { type = "weap", pos = CPos.New(29, 23), cost = 1500, exists = true }
Fix = { type = "fix", pos = CPos.New(12, 40), cost = 600, exists = true }
TechCenter = { type = "stek", pos = CPos.New(28, 39), cost = 2000, exists = true }
SAM1 = { type = "sam", pos = CPos.New(30, 43), cost = 500, exists = true }
SAM2 = { type = "sam", pos = CPos.New(14, 38), cost = 500, exists = true }
SAM3 = { type = "sam", pos = CPos.New(10, 31), cost = 500, exists = true }
SAM4 = { type = "sam", pos = CPos.New(26, 21), cost = 500, exists = true }
SAM5 = { type = "sam", pos = CPos.New(39, 32), cost = 500, exists = true }
Flame1 = { type = "ftur", pos = CPos.New(17, 35), cost = 500, exists = true }
Flame2 = { type = "ftur", pos = CPos.New(29, 29), cost = 500, exists = true }
Flame3 = { type = "ftur", pos = CPos.New(41, 32), cost = 500, exists = true }
NavalProductionBuilding = { type = "spen", pos = CPos.New(42, 39), cost = 1000, exists = true }

BaseBuildings = { BaseProc, BaseNuke1, BaseNuke2, BaseNuke3, BaseNuke4, BaseNuke5, BaseNuke6, BaseNuke7, BaseNuke8, BaseNuke9, InfantryProductionBuilding, DogBuilding, VehicleProductionBuilding, AirProductionBuilding, Fix, TechCenter, SAM1, SAM2, SAM3, SAM4, SAM5, Flame1, Flame2, Flame3, NavalProductionBuilding, Tesla1, Tesla2, Tesla3 }
SellBuildings = { Actor253, Actor251, Actor255, Actor401, Actor254, Actor405, Actor527, Actor76, Actor77, Actor78 }
InfiltrateableBuildings = { Actor324, Actor325, Actor722 }

AttackPos = {
	Actor819,
	Actor820,
	Actor821,
}

AttackPosInfantry = {
	Actor819,
	Actor820,
	Actor821,
	Actor937,
}

AttackPosAir = {
	Actor806,
	Actor807,
	Actor808,
	Actor809,
}

USSRAttackWaypoints = {
	USSRMADTankWP2,
	USSRMADTankWP3,
}

RallyPoints =
{
	Actor810,
	Actor811,
	Actor812,
	Actor813,
	Actor814,
	Actor815,
	Actor816,
	Actor817,
	Actor818,
}

-------------------------------------------------------------------------------------------------------------------------------------------------------------

StartAI = function()

	InfantryProduction1()
	if Map.LobbyOption("difficulty") == "easy" then
		Trigger.AfterDelay(DateTime.Seconds(350), function()
			NavalProduction()
			VehicleProduction(Actor752)
		end)
		Trigger.AfterDelay(DateTime.Seconds(450), AirProduction)
	elseif Map.LobbyOption("difficulty") == "normal" then
		Trigger.AfterDelay(DateTime.Seconds(300), function()
			NavalProduction()
			VehicleProduction(Actor752)
		end)
		Trigger.AfterDelay(DateTime.Seconds(350), AirProduction)
	elseif Map.LobbyOption("difficulty") == "hard" then
		Trigger.AfterDelay(DateTime.Seconds(200), function()
			NavalProduction()
			VehicleProduction(Actor752)
		end)
		Trigger.AfterDelay(DateTime.Seconds(250), AirProduction)
	end
end

AirProduction = function(building)

	local team = { Utils.Random(USSRAirType) }

	if not BaseBuildings[13] then
		return
	else
		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if BaseBuildings[13] then
				ussr.Build(team, function(units)
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

VehicleProduction = function(building)

	if not IUseStrongUnits then
		VehicleTeam = { Utils.Random(USSRVehicleTypes1) }
	else
		VehicleTeam = { Utils.Random(USSRVehicleTypes2) }
	end

	if not BaseBuildings[12] then
		return
	elseif HarvesterDead and BaseBuildings[12] then
		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if BaseBuildings[12] then
				ussr.Build({ "harv" }, function(harv)
					harv[1].FindResources()
					Trigger.OnKilled(harv[1], function() HarvesterDead = true end)

					HarvesterDead = false
					VehicleProduction(building)
				end)
			end
		end)
	elseif BaseBuildings[12] then
		local rallypoint = Utils.Random(RallyPoints)
		building.RallyPoint = rallypoint.Location

		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if BaseBuildings[12] then
				building.IsPrimaryBuilding = true
				ussr.Build(VehicleTeam, function(unit)
					USSRVehicleAttack[#USSRVehicleAttack + 1] = unit[1]

					if #USSRVehicleAttack >= Utils.RandomInteger(VehicleMinAttackForce, VehicleMaxAttackForce) then
						SendUnits(USSRVehicleAttack)
						USSRVehicleAttack = { }
						Trigger.AfterDelay(DateTime.Minutes(1), function() VehicleProduction(building) end)
					else
						Trigger.AfterDelay(VehicleDelay, function() VehicleProduction(building) end)
					end
				end)
			end
		end)
	end

end

InfantryProduction1 = function()

	if not IUseStrongUnits then
		InfantryTeam = { Utils.Random(USSRInfantryTypes1) }
	else
		InfantryTeam = { Utils.Random(USSRInfantryTypes2) }
	end

	if Actor324.IsDead then
		InfantryProduction2()
		return
	elseif not Actor324.IsDead then

		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if not Actor324.IsDead then
				Actor324.IsPrimaryBuilding = true
				ussr.Build(InfantryTeam, function(unit)
					USSRInfantryAttack[#USSRInfantryAttack + 1] = unit[1]

					if #USSRInfantryAttack >= Utils.RandomInteger(InfantryMinAttackForce, InfantryMaxAttackForce) then
						SendUnitsInfantry1(USSRInfantryAttack)
						USSRInfantryAttack = { }
						Trigger.AfterDelay(DateTime.Minutes(1), InfantryProduction1)
					else
						Trigger.AfterDelay(InfantryDelay, InfantryProduction1)
					end
				end)
			else
				InfantryProduction2()
			end
		end)
	end

end

InfantryProduction2 = function()

	if not IUseStrongUnits then
		InfantryTeam = { Utils.Random(USSRInfantryTypes1) }
	else
		InfantryTeam = { Utils.Random(USSRInfantryTypes2) }
	end

	if not BaseBuildings[10] then
		return
	elseif BaseBuildings[10] then

		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if BaseBuildings[10] then
				ussr.Build(InfantryTeam, function(unit)
					USSRInfantryAttack[#USSRInfantryAttack + 1] = unit[1]

					if #USSRInfantryAttack >= Utils.RandomInteger(InfantryMinAttackForce, InfantryMaxAttackForce) then
						SendUnitsInfantry(USSRInfantryAttack)
						USSRInfantryAttack = { }
						Trigger.AfterDelay(DateTime.Minutes(1), function() InfantryProduction2(building) end)
					else
						Trigger.AfterDelay(InfantryDelay, function() InfantryProduction2(building) end)
					end
				end)
			end
		end)
	end

end

NavalProduction = function()
	
	local team = { Utils.Random(USSRNavalTypes) }

	if not BaseBuildings[24] then
		return
	else
		if BaseBuildings[24] and not NavalPatrol1 then
			local team = { "ss", "ss" }
			ussr.Build(team, SendNavalPatrol1)
			Trigger.AfterDelay(DateTime.Minutes(1), NavalProduction)
		elseif BaseBuildings[24] and not NavalPatrol2 and not TryMeOnce then
			local team = { "ss", "ss", "ss" }
			TryMeOnce = true
			ussr.Build(team, SendNavalPatrol2)
			Trigger.AfterDelay(DateTime.Minutes(3), NavalProduction)
		end
	end

end

USSRMadTank = function()
	MadTankAttack = Utils.Random(USSRAttackWaypoints)

	Trigger.AfterDelay(DateTime.Seconds(0), function()
		Reinforcements.Reinforce(ussr, USSRMadTankGuards, { USSRReinforcementsWP1.Location, USSRReinforcementsWP2.Location }, 5, function(actor2)
			if not actor2.IsDead then
				actor2.AttackMove(MadTankAttack.Location)
				Trigger.OnIdle(actor2, function()
					actor2.Hunt()
				end)
			end
		end)
	end)

	Trigger.AfterDelay(DateTime.Seconds(20), function()
		Reinforcements.Reinforce(ussr, USSRMadTankTank, { USSRReinforcementsWP1.Location, USSRReinforcementsWP2.Location }, 5, function(actor1)
			if not actor1.IsDead then
				actor1.Move(MadTankAttack.Location)
				Trigger.OnIdle(actor1, function()
					actor1.Move(Actor533.Location)
				end)
			end
		end)
	end)

	Trigger.AfterDelay(MadTankAttackDelay, USSRMadTank)

end


USSRFirstWave = function()

	local team = { "3tnk", "3tnk" }

	Trigger.AfterDelay(DateTime.Seconds(1), function()
		Reinforcements.Reinforce(ussr, team, { USSRReinforcementsWP1.Location, USSRReinforcementsWP2.Location }, 5, function(actor)
			if not actor.IsDead then
				actor.AttackMove(Actor819.Location)
				Trigger.OnIdle(actor, function()
					actor.Hunt()
				end)
			end
		end)
	end)

end

USSRSecondWave = function()

	local team = USSRSecondWavev

	Trigger.AfterDelay(DateTime.Seconds(1), function()
		Reinforcements.Reinforce(ussr, team, { USSRReinforcementsWP1.Location, USSRReinforcementsWP2.Location }, 5, function(actor)
			if not actor.IsDead then
				actor.AttackMove(Actor819.Location)
				Trigger.OnIdle(actor, function()
					actor.Hunt()
				end)
			end
		end)
	end)

end

USSRLargeAttack = function()

	local team = USSRLargeAttackv

	Trigger.AfterDelay(DateTime.Seconds(1), function()
		Reinforcements.Reinforce(ussr, team, { USSRReinforcementsWP1.Location, USSRReinforcementsWP2.Location }, 5, function(actor)
			if not actor.IsDead then
				actor.AttackMove(Actor819.Location)
				Trigger.OnIdle(actor, function()
					actor.Hunt()
				end)
			end
		end)
	end)

	Trigger.AfterDelay(LargeAttackDelay, USSRLargeAttack)

end

USSRSellBuildings = function()
	Trigger.OnKilled(Actor214, function()
		Trigger.AfterDelay(DateTime.Seconds(90), function()
			Utils.Do(SellBuildings, function(building)
				if not building.IsDead then
					building.Sell()
				end
			end)
		end)
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

SendPatrols = function()
	Trigger.AfterDelay(DateTime.Seconds(3), function()
		GroupPatrol(USSRTeam4, PatrolRoute1, DateTime.Seconds(4))
		GroupPatrol(USSRTeam5, PatrolRoute2, DateTime.Seconds(4))
		GroupPatrol(USSRTeam7, PatrolRoute3, DateTime.Seconds(6))
		GroupPatrol(USSRTeam8, PatrolRoute4, DateTime.Seconds(6))
		GroupPatrol(USSRTeam9, PatrolRoute5, DateTime.Seconds(6))
		GroupPatrol(USSRTeam13, PatrolRoute6, DateTime.Seconds(4))
		GroupPatrol(USSRTeam14, PatrolRoute6, DateTime.Seconds(4))
		GroupPatrol(USSRTeam16, PatrolRoute7, DateTime.Seconds(7))
		GroupPatrol(USSRTeam17, PatrolRoute8, DateTime.Seconds(7))
	end)
end

TeamAttack = function()
	Trigger.OnAnyKilled(USSRTeam1, function()
		Utils.Do(USSRTeam1, function(actor)
			Trigger.OnIdle(actor, function()
				actor.Hunt()
			end)
		end)
	end)
	Trigger.OnAnyKilled(USSRTeam2, function()
		Utils.Do(USSRTeam2, function(actor)
			Trigger.OnIdle(actor, function()
				actor.Hunt()
			end)
		end)
	end)
	Trigger.OnAnyKilled(USSRTeam3, function()
		Utils.Do(USSRTeam3, function(actor)
			Trigger.OnIdle(actor, function()
				actor.Hunt()
			end)
		end)
	end)
	Trigger.OnAnyKilled(USSRTeam5, function()
		Utils.Do(USSRTeam5, function(actor)
			Trigger.OnIdle(actor, function()
				actor.Hunt()
			end)
		end)
	end)
	Trigger.OnAnyKilled(USSRTeam6, function()
		Utils.Do(USSRTeam6, function(actor)
			Trigger.OnIdle(actor, function()
				actor.Hunt()
			end)
		end)
	end)
	Trigger.OnAnyKilled(USSRTeam10, function()
		Utils.Do(USSRTeam10, function(actor)
			Trigger.OnIdle(actor, function()
				actor.Hunt()
			end)
		end)
	end)
	Trigger.OnAnyKilled(USSRTeam11, function()
		Utils.Do(USSRTeam11, function(actor)
			Trigger.OnIdle(actor, function()
				actor.Hunt()
			end)
		end)
	end)
	Trigger.OnAnyKilled(USSRTeam12, function()
		Utils.Do(USSRTeam12, function(actor)
			Trigger.OnIdle(actor, function()
				actor.Hunt()
			end)
		end)
	end)
	Trigger.OnKilled(Actor213, function()
		Utils.Do(USSRTeam15, function(actor)
			Trigger.OnIdle(actor, function()
				actor.Hunt()
			end)
		end)
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

		if cyard.IsDead or cyard.Owner ~= ussr then
			--Media.Debug("Cyard doesn't exist...")
			if not ISentEverything then
				ISentEverything = true
				IdlingUnitsRedAlert()
			end
			return
		end

		BuildingsBuilt = BuildingsBuilt + 1

		if BuildingsBuilt == 20 then
			IdlingUnitsRedAlert()
		end

		--Media.Debug("Building Complete")

		local actor = Actor.Create(building.type, true, { Owner = ussr, Location = building.pos })
		ussr.Cash = ussr.Cash - building.cost

		building.exists = true
		
		if actor.Type == 'barr' and Actor324.IsDead then
			Trigger.AfterDelay(DateTime.Seconds(5), function() InfantryProduction2(building) end)
		elseif actor.Type == 'weap' then
			Trigger.AfterDelay(DateTime.Seconds(5), function() VehicleProduction(building) end)
		elseif actor.Type == 'spen' then
			Trigger.AfterDelay(DateTime.Seconds(5), function() NavalProduction(building) end)
		elseif actor.Type == 'afld' then
			Trigger.AfterDelay(DateTime.Seconds(5), function() AirProduction(building) end)
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

TriggersAI = function()

	Utils.Do(InfiltrateableBuildings, function(building)
		Trigger.OnInfiltrated(building, function()
			building.Sell()
		end)
	end)

	Trigger.OnKilled(Actor768, function(building)
		AirProductionBuilding.exists = false
	end)

	Trigger.OnKilled(Actor719, function(building)
		BaseProc.exists = false
	end)
	
	Trigger.OnKilled(Actor787, function(building)
		BaseNuke1.exists = false
	end)
	
	Trigger.OnKilled(Actor786, function(building)
		BaseNuke2.exists = false
	end)
	
	Trigger.OnKilled(Actor765, function(building)
		BaseNuke3.exists = false
	end)
	
	Trigger.OnKilled(Actor766, function(building)
		BaseNuke4.exists = false
	end)
	
	Trigger.OnKilled(Actor767, function(building)
		BaseNuke5.exists = false
	end)

	Trigger.OnKilled(Actor769, function(building)
		BaseNuke6.exists = false
	end)
	
	Trigger.OnKilled(Actor763, function(building)
		BaseNuke7.exists = false
	end)
	
	Trigger.OnKilled(Actor764, function(building)
		BaseNuke8.exists = false
	end)
	
	Trigger.OnKilled(Actor785, function(building)
		BaseNuke9.exists = false
	end)
	
	Trigger.OnKilled(Actor754, function(building)
		InfantryProductionBuilding.exists = false
	end)
	
	Trigger.OnKilled(Actor752, function(building)
		VehicleProductionBuilding.exists = false
	end)
	
	Trigger.OnKilled(Actor775, function(building)
		NavalProductionBuilding.exists = false
	end)
	
	Trigger.OnKilled(Actor774, function(building)
		Fix.exists = false
	end)
	
	Trigger.OnKilled(Actor755, function(building)
		DogBuilding.exists = false
	end)
	
	Trigger.OnKilled(Actor756, function(building)
		TechCenter.exists = false
	end)
	
	Trigger.OnKilled(Actor789, function(building)
		SAM1.exists = false
	end)
	
	Trigger.OnKilled(Actor788, function(building)
		SAM2.exists = false
	end)
	
	Trigger.OnKilled(Actor773, function(building)
		SAM3.exists = false
	end)
	
	Trigger.OnKilled(Actor772, function(building)
		SAM4.exists = false
	end)

	Trigger.OnKilled(Actor771, function(building)
		SAM5.exists = false
	end)
	
	Trigger.OnKilled(Actor759, function(building)
		Flame1.exists = false
	end)

	Trigger.OnKilled(Actor760, function(building)
		Flame2.exists = false
	end)

	Trigger.OnKilled(Actor770, function(building)
		Flame3.exists = false
	end)
	
	Trigger.OnKilled(Actor310, function(building)
		Tesla1.exists = false
	end)

	Trigger.OnKilled(Actor757, function(building)
		Tesla2.exists = false
	end)

	Trigger.OnKilled(Actor758, function(building)
		Tesla3.exists = false
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

EnemyCash = function()
	if Phase2 then
		Trigger.AfterDelay(DateTime.Seconds(30), function()
			if ussr.Cash < 500 then
				ussr.Cash = ussr.Cash + 725
			end
			EnemyCash()
		end)
	else
		Trigger.AfterDelay(DateTime.Seconds(5), function() --Give harvesters something to do
			if ussr.Cash > 2000 then
				ussr.Cash = ussr.Cash - 2000
			end
			EnemyCash()
		end)	
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

SendUnitsInfantry = function(units)

	local waypoint = Utils.Random(AttackPosInfantry)

	Utils.Do(units, function(unit)
		if not unit.IsDead then
			unit.AttackMove(waypoint.Location)
			Trigger.OnIdle(unit, function()
				unit.Hunt()
			end)
		end
	end)
end

SendUnitsInfantry1 = function(units)

	Utils.Do(units, function(unit)
		if not unit.IsDead then
			Trigger.OnIdle(unit, function()
				unit.Hunt()
			end)
		end
	end)
end

SubmarineGuards = function()

	Actor792.Guard(Actor826)
	Actor794.Guard(Actor829)
	Actor793.Guard(Actor830)
	if Map.LobbyOption("difficulty") == "hard" then
		Actor790.Guard(Actor827)
	end

	Actor795.Stance = "AttackAnything"
	Actor797.Stance = "AttackAnything"
	Actor792.Stance = "AttackAnything"
	Actor794.Stance = "AttackAnything"
	Actor793.Stance = "AttackAnything"
	if Map.LobbyOption("difficulty") == "hard" then
		Actor790.Stance = "AttackAnything"
	end

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
