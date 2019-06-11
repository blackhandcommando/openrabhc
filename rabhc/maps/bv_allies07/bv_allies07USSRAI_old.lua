--[[
	Keep this file in case Build method gets fixed
--]]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

if Map.LobbyOption("difficulty") == "easy" then

	USSR1Attackers1 = { "ttnk", "ttnk", "v2rl", "e1", "e1", "e3", "e3", "e3", "e4", "e4" }
	USSR1Attackers2 = { "4tnk", "ttnk", "v2rl", "e1", "e1", "e3", "e3", "e3", "e4", "e4" }
	USSRLargeAttackv = { "4tnk", "4tnk", "4tnk", "4tnk", "ttnk", "3tnk", "3tnk", "v2rl", "v2rl", "v2rl", "shok", "shok", "shok", "shok", "shok" }

	USSR1NavalMinAttackForce = 2
	USSR1NavalMaxAttackForce = 5
	USSR1InfantryMinAttackForce = 6
	USSR1InfantryMaxAttackForce = 10
	USSR1VehicleMinAttackForce = 8
	USSR1VehicleMaxAttackForce = 10

	DemoTruckAttackDelay = DateTime.Minutes(17)
	LargeAttackDelay = DateTime.Minutes(25)

	USSR1InfantryDelay = DateTime.Seconds(30)
	USSR1VehicleDelay = DateTime.Seconds(50)
	USSR1YakDelay = DateTime.Seconds(150)

elseif Map.LobbyOption("difficulty") == "normal" then

	USSR1Attackers1 = { "3tnk", "ttnk", "ttnk", "v2rl", "e1", "e1", "e3", "e3", "e3", "e4", "e4" }
	USSR1Attackers2 = { "4tnk", "ttnk", "v2rl", "e1", "e1", "e3", "e3", "e3", "e4", "e4" }
	USSRLargeAttackv = { "4tnk", "4tnk", "4tnk", "4tnk", "4tnk", "4tnk", "ttnk", "3tnk", "3tnk", "v2rl", "v2rl", "v2rl", "shok", "shok", "shok", "shok", "shok" }

	USSR1NavalMinAttackForce = 2
	USSR1NavalMaxAttackForce = 5
	USSR1InfantryMinAttackForce = 10
	USSR1InfantryMaxAttackForce = 20
	USSR1VehicleMinAttackForce = 10
	USSR1VehicleMaxAttackForce = 12

	DemoTruckAttackDelay = DateTime.Minutes(15)
	LargeAttackDelay = DateTime.Minutes(20)

	USSR1InfantryDelay = DateTime.Seconds(20)
	USSR1VehicleDelay = DateTime.Seconds(40)
	USSR1YakDelay = DateTime.Seconds(100)

elseif Map.LobbyOption("difficulty") == "hard" then

	USSR1Attackers1 = { "3tnk", "3tnk", "ttnk", "ttnk", "v2rl", "e1", "e1", "e3", "e3", "e3", "e4", "e4" }
	USSR1Attackers2 = { "4tnk", "3tnk", "ttnk", "ttnk", "v2rl", "e1", "e1", "e3", "e3", "e3", "e4", "e4" }
	USSRLargeAttackv = { "4tnk", "4tnk", "4tnk", "4tnk", "4tnk", "4tnk", "ttnk", "ttnk", "ttnk", "3tnk", "3tnk", "v2rl", "v2rl", "v2rl", "shok", "shok", "shok", "shok", "shok", "shok", "shok", "shok" }

	USSR1NavalMinAttackForce = 2
	USSR1NavalMaxAttackForce = 5
	USSR1InfantryMinAttackForce = 15
	USSR1InfantryMaxAttackForce = 25
	USSR1VehicleMinAttackForce = 10
	USSR1VehicleMaxAttackForce = 17

	DemoTruckAttackDelay = DateTime.Minutes(12)
	LargeAttackDelay = DateTime.Minutes(20)

	USSR1InfantryDelay = DateTime.Seconds(10)
	USSR1VehicleDelay = DateTime.Seconds(30)
	USSR1YakDelay = DateTime.Seconds(75)

end

USSR1InfantryTypes = { "e3", "e4", "shok", "shok" }
USSR1VehicleTypes = { "v2rl", "3tnk", "ttnk", "4tnk" }
USSR1AirType = { "yak.ai", "mig.ai" }
IronCurtainTypes = { "3tnk", "ttnk", "v2rl" }

USSR1HarvesterDead = true
USSR1cyardIsBuilding = false

USSR1InfantryAttack = { }
USSR1NavalAttack = { }
USSR1VehicleAttack = { }
USSR1Yaks = { }

USSR1AttackPos = {
	Actor1194,
	Actor1195,
	Actor1196,
}

USSR1ICAttackPos = {
	Actor1194,
	Actor1195,
}

USSR1AttackPosAir = {
	Actor1221,
	Actor1222,
	Actor1223,
	Actor1224,
	Actor1225,
	Actor1226,
}

USSR1SpawnPosAir = {
	Actor1189,
	Actor1254,
	Actor1255,
	Actor1256,
	Actor1257,
	Actor1258,
	Actor1259,
	Actor1260,
	Actor1261,
}

USSR1BaseProc1 = { type = "proc", pos = CPos.New(10, 92), cost = 1500, exists = true }
USSR1BaseProc2 = { type = "proc", pos = CPos.New(14, 90), cost = 1500, exists = true }
USSR1BaseNuke1 = { type = "powr", pos = CPos.New(6, 114), cost = 600, exists = true }
USSR1BaseNuke2 = { type = "powr", pos = CPos.New(8, 110), cost = 600, exists = true }
USSR1BaseNuke3 = { type = "powr", pos = CPos.New(16, 106), cost = 600, exists = true }
USSR1BaseNuke4 = { type = "apwr", pos = CPos.New(3, 108), cost = 750, exists = true }
USSR1BaseNuke5 = { type = "apwr", pos = CPos.New(3, 113), cost = 750, exists = true }
USSR1BaseNuke6 = { type = "apwr", pos = CPos.New(23, 103), cost = 750, exists = true }
USSR1BaseNuke7 = { type = "apwr", pos = CPos.New(26, 103), cost = 750, exists = true }
USSR1BaseNuke8 = { type = "apwr", pos = CPos.New(23, 107), cost = 750, exists = true }
USSR1BaseNuke9 = { type = "apwr", pos = CPos.New(26, 107), cost = 750, exists = true }
USSR1BaseNuke10 = { type = "apwr", pos = CPos.New(23, 111), cost = 750, exists = true }
USSR1Tesla1 = { type = "tsla", pos = CPos.New(19, 85), cost = 750, exists = true }
USSR1Tesla2 = { type = "tsla", pos = CPos.New(20, 91), cost = 750, exists = true }
USSR1Tesla3 = { type = "tsla", pos = CPos.New(28, 99), cost = 750, exists = true }
USSR1Tesla4 = { type = "tsla", pos = CPos.New(19, 102), cost = 750, exists = true }
USSR1InfantryProductionBuilding1 = { type = "barr", pos = CPos.New(14, 98), cost = 250, exists = true }
USSR1InfantryProductionBuilding2 = { type = "barr", pos = CPos.New(17, 98), cost = 250, exists = true }
USSR2VehicleProductionBuilding = { type = "weap", pos = CPos.New(3, 98), cost = 1500, exists = true }
USSR1DogProductionBuilding = { type = "kenn", pos = CPos.New(16, 98), cost = 200, exists = true }
USSR1Dome = { type = "dome", pos = CPos.New(18, 106), cost = 800, exists = true }
USSR1TechCenter = { type = "stek", pos = CPos.New(13, 112), cost = 2000, exists = true }
USSR1SAM1 = { type = "sam", pos = CPos.New(2, 96), cost = 500, exists = true }
USSR1SAM2 = { type = "sam", pos = CPos.New(2, 118), cost = 500, exists = true }
USSR1SAM3 = { type = "sam", pos = CPos.New(16, 121), cost = 500, exists = true }
USSR1SAM4 = { type = "sam", pos = CPos.New(20, 121), cost = 500, exists = true }
USSR1SAM5 = { type = "sam", pos = CPos.New(28, 116), cost = 500, exists = true }
USSR1SAM6 = { type = "sam", pos = CPos.New(28, 111), cost = 500, exists = true }
USSR1SAM7 = { type = "sam", pos = CPos.New(27, 101), cost = 500, exists = true }
USSR1SAM8 = { type = "sam", pos = CPos.New(19, 88), cost = 500, exists = true }
USSR1Flame1 = { type = "ftur", pos = CPos.New(12, 98), cost = 500, exists = true }
USSR1Flame2 = { type = "ftur", pos = CPos.New(7, 98), cost = 500, exists = true }
USSR1Flame3 = { type = "ftur", pos = CPos.New(8, 116), cost = 500, exists = true }
USSR1Flame4 = { type = "ftur", pos = CPos.New(11, 116), cost = 500, exists = true }
USSR1Flame5 = { type = "ftur", pos = CPos.New(17, 115), cost = 500, exists = true }
USSR1Flame6 = { type = "ftur", pos = CPos.New(20, 115), cost = 500, exists = true }

USSR1BaseBuildings = { USSR1BaseProc1, USSR1BaseProc2, USSR1BaseNuke1, USSR1BaseNuke2, USSR1BaseNuke3, USSR1BaseNuke4, USSR1BaseNuke5, USSR1BaseNuke6, USSR1BaseNuke7, USSR1BaseNuke8, USSR1BaseNuke9, USSR1BaseNuke10, USSR1InfantryProductionBuilding1, USSR1InfantryProductionBuilding2, USSR1DogProductionBuilding, USSR2VehicleProductionBuilding, USSR1Dome, USSR1TechCenter, USSR1SAM1, USSR1SAM2, USSR1SAM3, USSR1SAM4, USSR1SAM5, USSR1SAM6, USSR1SAM7, USSR1SAM8, USSR1Flame1, USSR1Flame2, USSR1Flame3, USSR1Flame4, USSR1Flame5, USSR1Flame6, USSR1Tesla1, USSR1Tesla2, USSR1Tesla3, USSR1Tesla4 }
USSR1InfiltrateableBuildings = { Actor77, Actor97, Actor98 }

USSR1RallyPos = {
	Actor1247,
	Actor1248,
	Actor1249,
	Actor1250,
	Actor1251,
	Actor1252,
	Actor1253,
}

USSR1InfRallyPos = {
	Actor1247,
	Actor1248,
	Actor1249,
}

USSR1Team1 = { Actor1230, Actor1231 }
USSR1Team1Route1 = {
	Actor1249.Location, 
	Actor1188.Location, 
	Actor1252.Location, 
	Actor1248.Location, 
}

USSR1Team2 = { Actor1232, Actor1233 }
USSR1Team2Route1 = {
	Actor1252.Location, 
	Actor1248.Location,
	Actor1249.Location, 
	Actor1188.Location,  
}

USSR1Team3 = { Actor1235, Actor1236, Actor1237, Actor1238, Actor1239 }
USSR1Team3Route1 = {
	Actor1240.Location, 
	Actor1241.Location,
	Actor1242.Location, 
	Actor1243.Location, 
}

USSR1Team4 = { Actor1264, Actor1265, Actor1266, Actor1267, Actor1268 }
USSR1Team4Route1 = {
	Actor1244.Location, 
	Actor1245.Location, 
	Actor1246.Location, 
}

USSR1Team5 = { Actor1270, Actor1271 }
USSR1Team5Route1 = {
	Actor1272.Location, 
	Actor1273.Location, 
	Actor1274.Location, 
	Actor1275.Location, 
}

-------------------------------------------------------------------------------------------------------------------------------------------------------------

USSR1SendPatrols = function()
	GroupPatrol(USSR1Team1, USSR1Team1Route1, DateTime.Seconds(4))
	GroupPatrol(USSR1Team2, USSR1Team2Route1, DateTime.Seconds(4))
	GroupPatrol(USSR1Team3, USSR1Team3Route1, DateTime.Seconds(4))
	GroupPatrol(USSR1Team4, USSR1Team4Route1, DateTime.Seconds(4))
	GroupPatrol(USSR1Team5, USSR1Team5Route1, DateTime.Seconds(4))
end

SendAttackers1USSR1 = function()

	local team = USSR1Attackers1
	local waypoint = Utils.Random(USSR1AttackPos)

	Trigger.AfterDelay(DateTime.Seconds(1), function()
		Reinforcements.Reinforce(ussr, team, { Actor1187.Location, Actor1188.Location }, 5, function(actor)
			if not actor.IsDead then
				actor.AttackMove(waypoint.Location)
				Trigger.OnIdle(actor, function()
					actor.Hunt()
				end)
			end
		end)
	end)

end

SendAttackers2USSR1 = function()

	local team = USSR1Attackers2
	local waypoint = Utils.Random(USSR1AttackPos)

	Trigger.AfterDelay(DateTime.Seconds(1), function()
		Reinforcements.Reinforce(ussr, team, { Actor1198.Location, Actor1199.Location }, 5, function(actor)
			if not actor.IsDead then
				actor.AttackMove(waypoint.Location)
				Trigger.OnIdle(actor, function()
					actor.Hunt()
				end)
			end
		end)
	end)

end

USSR1StartAI = function()
	if not USSR1InfantryProductionActivated then USSR1InfantryProduction(Actor592) end
	if not USSR1VehicleProductionActivated then USSR1VehicleProduction(Actor323) end
end

USSR1InfantryProduction = function(building)

	USSR1InfantryProductionActivated = true

	USSR1InfantryTeam = { Utils.Random(USSR1InfantryTypes) }

	if not USSR1BaseBuildings[12] then
		return
	elseif VolkovDead and USSR1BaseBuildings[12] then
		if not building.IsDead then
			local rallypoint = Utils.Random(USSR1InfRallyPos)
			building.RallyPoint = rallypoint.Location
			building.IsPrimaryBuilding = true
		end

		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if USSR1BaseBuildings[12] then
				ussr.Build({ "e8" }, function(unit)
					USSR1InfantryAttack[#USSR1InfantryAttack + 1] = unit[1]

					if #USSR1InfantryAttack >= Utils.RandomInteger(USSR1InfantryMinAttackForce, USSR1InfantryMaxAttackForce) then
						USSR1SendUnits(USSR1InfantryAttack)
						USSR1InfantryAttack = { }
						Trigger.AfterDelay(DateTime.Minutes(1), function() USSR1InfantryProduction(building) end)
					else
						Trigger.AfterDelay(USSR1InfantryDelay, function() USSR1InfantryProduction(building) end)
					end

					Trigger.OnKilled(unit[1], function() VolkovDead = true end)

					VolkovDead = false
				end)
			end
		end)
	elseif USSR1BaseBuildings[12] then
		if not building.IsDead then
			local rallypoint = Utils.Random(USSR1InfRallyPos)
			building.RallyPoint = rallypoint.Location
			building.IsPrimaryBuilding = true
		end

		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if USSR1BaseBuildings[12] then
				ussr.Build(USSR1InfantryTeam, function(unit)
					USSR1InfantryAttack[#USSR1InfantryAttack + 1] = unit[1]

					if #USSR1InfantryAttack >= Utils.RandomInteger(USSR1InfantryMinAttackForce, USSR1InfantryMaxAttackForce) then
						USSR1SendUnits(USSR1InfantryAttack)
						USSR1InfantryAttack = { }
						Trigger.AfterDelay(DateTime.Minutes(1), function() USSR1InfantryProduction(building) end)
					else
						Trigger.AfterDelay(USSR1InfantryDelay, function() USSR1InfantryProduction(building) end)
					end
				end)
			end
		end)
	end

end

USSR1VehicleProduction = function(building)

	USSR1VehicleProductionActivated = true

	USSR1VehicleTeam = { Utils.Random(USSR1VehicleTypes) }

	if not USSR1BaseBuildings[15] then
		return
	elseif USSR1HarvesterDead and USSR1BaseBuildings[15] then
		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if USSR1BaseBuildings[15] then
				ussr.Build({ "harv" }, function(harv)
					harv[1].FindResources()
					Trigger.OnKilled(harv[1], function() USSR1HarvesterDead = true end)

					USSR1HarvesterDead = false
					USSR1VehicleProduction(building)
				end)
			end
		end)
	elseif USSR1BaseBuildings[15] then
		if not building.IsDead then
			local rallypoint = Utils.Random(USSR1RallyPos)
			building.RallyPoint = rallypoint.Location
			building.IsPrimaryBuilding = true
		end

		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if USSR1BaseBuildings[15] then
				ussr.Build(USSR1VehicleTeam, function(unit)
					USSR1VehicleAttack[#USSR1VehicleAttack + 1] = unit[1]

					if #USSR1VehicleAttack >= Utils.RandomInteger(USSR1VehicleMinAttackForce, USSR1VehicleMaxAttackForce) then
						USSR1SendUnits(USSR1VehicleAttack)
						USSR1VehicleAttack = { }
						Trigger.AfterDelay(DateTime.Minutes(0.5), function() USSR1VehicleProduction(building) end)
					else
						Trigger.AfterDelay(USSR1VehicleDelay, function() USSR1VehicleProduction(building) end)
					end
				end)
			end
		end)
	end

end

USSR1AirProduction = function(building)

	local team = { Utils.Random(USSR1AirType) }

	if Actor863.IsDead and Actor864.IsDead and Actor865.IsDead and Actor926.IsDead and Actor927.IsDead and Actor968.IsDead then
		return
	else
		Trigger.AfterDelay(DateTime.Seconds(1), function()
			if not Actor863.IsDead or not Actor864.IsDead or not Actor865.IsDead or not Actor926.IsDead or not Actor927.IsDead or not Actor968.IsDead then
				ussr.Build(team, function(units)
					local yak = units[1]
					USSR1Yaks[#USSR1Yaks + 1] = yak

					Trigger.AfterDelay(USSR1YakDelay, USSR1AirProduction)

					USSR1TargetAndAttack(yak)
				end)
			end
		end)
	end

end

USSR1TargetAndAttack = function(yak)

	local waypoint = Utils.Random(USSR1AttackPosAir)

	if not yak.IsDead then
		Trigger.OnIdle(yak, function()
			yak.AttackMove(waypoint.Location)
			yak.Hunt()
		end)
	end

end

USSR1SendAirforceLoop = function()
	if Actor863.IsDead and Actor864.IsDead and Actor865.IsDead and Actor926.IsDead and Actor927.IsDead and Actor968.IsDead then
		return
	else
		SendAirforceUSSR1()
		SendAirforceUSSR1()
		SendAirforceUSSR1()
		if Map.LobbyOption("difficulty") == "normal" or Map.LobbyOption("difficulty") == "hard" then
			SendAirforceUSSR1()
		end
		if Map.LobbyOption("difficulty") == "hard" then
			SendAirforceUSSR1()
			SendAirforceUSSR1()
		end
		Trigger.AfterDelay(DateTime.Seconds(550), USSR1SendAirforceLoop)
	end
end

SendAirforceUSSR1 = function()

	local team = { Utils.Random(USSR1AirType) }
	local waypoint = Utils.Random(USSR1SpawnPosAir)

	Trigger.AfterDelay(DateTime.Seconds(1), function()
		Reinforcements.Reinforce(nuker, team, { waypoint.Location, waypoint.Location }, 5, function() end)
	end)

end

USSRDemolitonTruck = function()
	DemoTruckPos = Utils.Random(USSR1AttackPos)

	Reinforcements.Reinforce(ussr, { "dtrk" }, { Actor1218.Location, Actor1188.Location }, 5, function(actor)
		if not actor.IsDead then
			actor.Move(DemoTruckPos.Location)
			Trigger.OnIdle(actor, function()
				actor.Move(Actor1227.Location)
			end)
		end
	end)

	Trigger.AfterDelay(DemoTruckAttackDelay, USSRDemolitonTruck)

end

USSRLargeAttack = function()

	local team = USSRLargeAttackv
	local waypoint = Utils.Random(USSR1AttackPos)

	Trigger.AfterDelay(DateTime.Seconds(1), function()
		Reinforcements.Reinforce(ussr, team, { Actor1219.Location, Actor1199.Location }, 5, function(actor)
			if not actor.IsDead then
				actor.AttackMove(waypoint.Location)
				Trigger.OnIdle(actor, function()
					actor.Hunt()
				end)
			end
		end)
	end)

	Trigger.AfterDelay(LargeAttackDelay, USSRLargeAttack)

end

USSR1BuildBase = function(cyard)
	Utils.Do(USSR1BaseBuildings, function(building)
		if not building.exists and not USSR1cyardIsBuilding then
			USSR1BuildBuilding(building, cyard)
			return
		end
	end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() USSR1BuildBase(cyard) end)
end

USSR1BuildBuilding = function(building, cyard)
	USSR1cyardIsBuilding = true

	--Media.Debug("Building...")

	Trigger.AfterDelay(5/4 * Actor.BuildTime(building.type), function()
		USSR1cyardIsBuilding = false

		if cyard.IsDead or cyard.Owner ~= ussr then
			--Media.Debug("Cyard doesn't exist...")
			if not USSR1ISentEverything then
				USSR1ISentEverything = true
				USSRIdlingUnitsRedAlert()
			end
			return
		end

		USSR1BuildingsBuilt = USSR1BuildingsBuilt + 1

		if USSR1BuildingsBuilt == 10 then
			USSRIdlingUnitsRedAlert()
		end

		--Media.Debug("Building Complete")

		local actor = Actor.Create(building.type, true, { Owner = ussr, Location = building.pos })
		ussr.Cash = ussr.Cash - building.cost

		building.exists = true
		
		if actor.Type == 'barr' then
			Trigger.AfterDelay(DateTime.Seconds(5), function() USSR1InfantryProduction(actor) end)
		elseif actor.Type == 'weap' then
			Trigger.AfterDelay(DateTime.Seconds(5), function() USSR1VehicleProduction(actor) end)
		end

		Trigger.OnKilled(actor, function() building.exists = false end)

		Trigger.OnDamaged(actor, function(building)
			if building.Owner == ussr and building.Health < building.MaxHealth * 9/10 then
				building.StartBuildingRepairs()
			end
		end)

		Trigger.AfterDelay(DateTime.Seconds(10), function() USSR1BuildBase(cyard) end)
	end)
end

USSRTriggersAI = function()

	Utils.Do(USSR1InfiltrateableBuildings, function(building)
		Trigger.OnInfiltrated(building, function()
			building.Sell()
		end)
	end)

	Trigger.OnKilled(Actor513, function(building)
		USSR1BaseProc1.exists = false
	end)

	Trigger.OnKilled(Actor514, function(building)
		USSR1BaseProc2.exists = false
	end)
	
	Trigger.OnKilled(Actor418, function(building)
		USSR1BaseNuke1.exists = false
	end)
	
	Trigger.OnKilled(Actor613, function(building)
		USSR1BaseNuke2.exists = false
	end)
	
	Trigger.OnKilled(Actor614, function(building)
		USSR1BaseNuke3.exists = false
	end)
	
	Trigger.OnKilled(Actor381, function(building)
		USSR1BaseNuke4.exists = false
	end)
	
	Trigger.OnKilled(Actor417, function(building)
		USSR1BaseNuke5.exists = false
	end)

	Trigger.OnKilled(Actor520, function(building)
		USSR1BaseNuke6.exists = false
	end)
	
	Trigger.OnKilled(Actor519, function(building)
		USSR1BaseNuke7.exists = false
	end)

	Trigger.OnKilled(Actor518, function(building)
		USSR1BaseNuke8.exists = false
	end)

	Trigger.OnKilled(Actor517, function(building)
		USSR1BaseNuke9.exists = false
	end)
	
	Trigger.OnKilled(Actor607, function(building)
		USSR1BaseNuke10.exists = false
	end)
	
	Trigger.OnKilled(Actor592, function(building)
		USSR1InfantryProductionBuilding1.exists = false
	end)

	Trigger.OnKilled(Actor590, function(building)
		USSR1InfantryProductionBuilding2.exists = false
	end)
	
	Trigger.OnKilled(Actor323, function(building)
		USSR2VehicleProductionBuilding.exists = false
	end)
	
	Trigger.OnKilled(Actor588, function(building)
		USSR1Dome.exists = false
	end)
	
	Trigger.OnKilled(Actor586, function(building)
		USSR1TechCenter.exists = false
	end)
	
	Trigger.OnKilled(Actor604, function(building)
		USSR1SAM1.exists = false
	end)
	
	Trigger.OnKilled(Actor603, function(building)
		USSR1SAM2.exists = false
	end)
	
	Trigger.OnKilled(Actor600, function(building)
		USSR1SAM3.exists = false
	end)

	Trigger.OnKilled(Actor599, function(building)
		USSR1SAM4.exists = false
	end)
	
	Trigger.OnKilled(Actor598, function(building)
		USSR1SAM5.exists = false
	end)
	
	Trigger.OnKilled(Actor589, function(building)
		USSR1SAM6.exists = false
	end)

	Trigger.OnKilled(Actor597, function(building)
		USSR1SAM7.exists = false
	end)
	
	Trigger.OnKilled(Actor596, function(building)
		USSR1SAM8.exists = false
	end)
	
	Trigger.OnKilled(Actor611, function(building)
		USSR1Flame1.exists = false
	end)

	Trigger.OnKilled(Actor612, function(building)
		USSR1Flame2.exists = false
	end)

	Trigger.OnKilled(Actor608, function(building)
		USSR1Flame3.exists = false
	end)
	
	Trigger.OnKilled(Actor609, function(building)
		USSR1Flame4.exists = false
	end)

	Trigger.OnKilled(Actor602, function(building)
		USSR1Flame5.exists = false
	end)

	Trigger.OnKilled(Actor601, function(building)
		USSR1Flame6.exists = false
	end)
	
	Trigger.OnKilled(Actor595, function(building)
		USSR1Tesla1.exists = false
	end)

	Trigger.OnKilled(Actor594, function(building)
		USSR1Tesla2.exists = false
	end)

	Trigger.OnKilled(Actor593, function(building)
		USSR1Tesla3.exists = false
	end)

	Trigger.OnKilled(Actor610, function(building)
		USSR1Tesla4.exists = false
	end)

end

USSRRepairBase = function()
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

USSREnemyCash = function()
	Trigger.AfterDelay(DateTime.Seconds(30), function()
		if ussr.Cash < 500 then
			ussr.Cash = ussr.Cash + 725
		end
		USSREnemyCash()
	end)
end

USSR1SendUnits = function(units)

	local waypoint = Utils.Random(USSR1AttackPos)

	Utils.Do(units, function(unit)
		if not unit.IsDead then
			unit.AttackMove(waypoint.Location)
			Trigger.OnIdle(unit, function()
				unit.Hunt()
			end)
		end
	end)
end

USSRIdleUnitsLogic = function()

	Trigger.AfterDelay(DateTime.Seconds(0.5), function()
		USSRIdleUnitsLogic()
		USSRIdlingUnits(ussr)
	end)

end

USSRIdlingUnits = function(ussr)
	local lazyUnits = ussr.GetGroundAttackers()

	Utils.Do(lazyUnits, function(unit)
		USSRIdleHunt(unit)
	end)
end

USSRIdleHunt = function(unit)
	if not unit.IsDead then 
		if unit.Health < unit.MaxHealth * 9/10 then
			Trigger.OnIdle(unit, unit.Hunt)		
		end
	end 
end

USSRIdlingUnitsRedAlert = function()
	local lazyUnits = ussr.GetGroundAttackers()

	Utils.Do(lazyUnits, function(unit)
		USSRIdleHuntRedAlert(unit)
	end)
end

USSRIdleHuntRedAlert = function(unit)
	if not unit.IsDead then 
		Trigger.OnIdle(unit, unit.Hunt)		
	end 
end

IronCurtainLoop = function()
	ironcurtainattack = Utils.Random(USSR1ICAttackPos)
	SendSovietIronCurtain()
	Trigger.AfterDelay(DateTime.Seconds(400), IronCurtainLoop)
end

SendSovietIronCurtain = function()

	if Actor65.IsDead or ussr.PowerState ~= "Normal" then
		return
	else
		local team1 = { Utils.Random(IronCurtainTypes) }
		local team2 = { Utils.Random(IronCurtainTypes) }
		local team3 = { Utils.Random(IronCurtainTypes) }
		local team4 = { Utils.Random(IronCurtainTypes) }
		local team5 = { Utils.Random(IronCurtainTypes) }

		Trigger.AfterDelay(DateTime.Seconds(39.5), function()
			Media.PlaySpeechNotification(player, "IronCurtainCharging")
		end)

		Trigger.AfterDelay(DateTime.Seconds(1), function()
			Reinforcements.Reinforce(ussr, team1, { Actor1187.Location, Actor1187.Location }, 1, function(unit1)
				IronCurtainLogic(unit1)
			end)
		end)

		Trigger.AfterDelay(DateTime.Seconds(1), function()
			Reinforcements.Reinforce(ussr, team2, { Actor1198.Location, Actor1198.Location }, 1, function(unit2)
				IronCurtainLogic(unit2)
			end)
		end)

		Trigger.AfterDelay(DateTime.Seconds(1), function()
			Reinforcements.Reinforce(ussr, team3, { Actor1218.Location, Actor1218.Location }, 1, function(unit3)
				IronCurtainLogic(unit3)
			end)
		end)

		if Map.LobbyOption("difficulty") == "normal" or Map.LobbyOption("difficulty") == "hard" then
			Trigger.AfterDelay(DateTime.Seconds(1), function()
				Reinforcements.Reinforce(ussr, team4, { Actor1220.Location, Actor1220.Location }, 1, function(unit4)
					IronCurtainLogic(unit4)
				end)
			end)
		end
		if Map.LobbyOption("difficulty") == "hard" then
			Trigger.AfterDelay(DateTime.Seconds(1), function()
				Reinforcements.Reinforce(ussr, team5, { Actor1219.Location, Actor1219.Location }, 1, function(unit5)
					IronCurtainLogic(unit5)
				end)
			end)
		end
	end

end

IronCurtainLogic = function(unit)
	if not unit.IsDead then
		unit.AttackMove(ironcurtainattack.Location)
		Trigger.AfterDelay(DateTime.Seconds(38), function()
			if not unit.IsDead and unit.IsInWorld then
				Trigger.OnIdle(unit, function()
					unit.Hunt()
				end)
			end
		end)
	end
	Trigger.AfterDelay(DateTime.Seconds(38), function()
		if not unit.IsDead and unit.IsInWorld then
			unit.GrantCondition("invulnerability", DateTime.Seconds(30))
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