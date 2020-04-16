--[[

--]]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

if Map.LobbyOption("difficulty") == "easy" then

	IronCurtainAttackNumber = 3
	NavalMinAttackForce = 1
	NavalMaxAttackForce = 3
	InfantryMinAttackForce = 8
	InfantryMaxAttackForce = 11
	VehicleMinAttackForce = 5
	VehicleMaxAttackForce = 10

	USSRWave1 = { "3tnk", "3tnk", "v2rl", "ftrk", "e1", "e1", "e3", "e4" }
	USSRWave2 = { "3tnk", "3tnk" }
	USSRWave3 = { "ttnk", "ttnk", "ttnk" }
	USSRWave4 = { "ttnk",  "e1", "e1", "e3", "e4" }
	USSRWave5 = { "4tnk", "ftrk", "ftrk", "e1", "e3", "e3", "e4", "shok" }
	USSRWave6 = { "ttnk", "3tnk", "e3", "e4", "shok", "e3", "e3", "e4", "shok" }
	USSRWave7 = { "ttnk", "v2rl", "e1", "e4", "shok", "e3", "e3", "e4", "shok", "ttnk", "v2rl", "e1", "e4", "shok", "e3", "e3", "e4", "shok" }
	USSRWave8 = { "ttnk", "ttnk", "ttnk", "ttnk", "4tnk" }

	InfantryDelay = DateTime.Seconds(35)
	VehicleDelay = DateTime.Seconds(35)
	DefendTimer = DateTime.Minutes(15)
	GlobalDelay = DateTime.Minutes(3) --Time the AI will wait after successfully creating a team

elseif Map.LobbyOption("difficulty") == "normal" then

	IronCurtainAttackNumber = 4
	NavalMinAttackForce = 2
	NavalMaxAttackForce = 4
	InfantryMinAttackForce = 10
	InfantryMaxAttackForce = 13
	VehicleMinAttackForce = 8
	VehicleMaxAttackForce = 12

	USSRWave1 = { "3tnk", "3tnk", "v2rl", "ftrk", "ftrk", "e1", "e1", "e3", "e4" }
	USSRWave2 = { "3tnk", "3tnk" }
	USSRWave3 = { "ttnk", "ttnk", "3tnk", "ttnk", "3tnk" }
	USSRWave4 = { "ttnk",  "e1", "e1", "e1",  "e3", "e3", "e4" }
	USSRWave5 = { "4tnk",  "3tnk", "ftrk", "ftrk", "e1", "e3", "e3", "e4", "shok" }
	USSRWave6 = { "ttnk", "3tnk", "v2rl", "e1", "e3", "e3", "e4", "shok", "e3", "e3", "e4", "shok" }
	USSRWave7 = { "ttnk", "3tnk", "v2rl", "e1", "e4", "shok", "e3", "e3", "e4", "shok", "ttnk", "3tnk", "v2rl", "e1", "e4", "shok", "e3", "e3", "e4", "shok" }
	USSRWave8 = { "ttnk", "ttnk", "ttnk", "ttnk", "ttnk", "4tnk" }

	InfantryDelay = DateTime.Seconds(20)
	VehicleDelay = DateTime.Seconds(32)
	DefendTimer = DateTime.Minutes(15)
	GlobalDelay = DateTime.Minutes(2) --Time the AI will wait after successfully creating a team

elseif Map.LobbyOption("difficulty") == "hard" then

	IronCurtainAttackNumber = 5
	NavalMinAttackForce = 2
	NavalMaxAttackForce = 5
	InfantryMinAttackForce = 15
	InfantryMaxAttackForce = 20
	VehicleMinAttackForce = 13
	VehicleMaxAttackForce = 16

	USSRWave1 = { "3tnk", "3tnk", "3tnk", "v2rl", "ftrk", "ftrk", "e1", "e1", "e1", "e1", "e3", "e3", "e4" }
	USSRWave2 = { "3tnk", "3tnk", "v2rl" }
	USSRWave3 = { "ttnk", "ttnk", "ttnk", "3tnk", "ttnk", "ttnk", "3tnk" }
	USSRWave4 = { "ttnk", "e1", "e1", "e1", "e1", "e3", "e3", "e4",  "e3", "e3", "e4" }
	USSRWave5 = { "4tnk", "3tnk", "3tnk", "ftrk", "ftrk", "e1", "e3", "e3", "e4", "shok" }
	USSRWave6 = { "ttnk", "3tnk", "3tnk", "3tnk", "v2rl", "e1", "e3", "e3", "e4", "shok", "e3", "e3", "e4", "shok" }
	USSRWave7 = { "ttnk", "3tnk", "v2rl", "e1", "e3", "e3", "e4", "shok", "e3", "e3", "e4", "shok", "ttnk", "3tnk", "v2rl", "e1", "e3", "e3", "e4", "shok", "e3", "e3", "e4", "shok" }
	USSRWave8 = { "ttnk", "ttnk", "ttnk", "ttnk", "ttnk", "ttnk", "4tnk" }
	USSRWave9 = { "ttnk", "ttnk", "3tnk", "4tnk", "4tnk", "4tnk",  "e3", "e3", "e4", "shok", "e3", "e3", "e4", "shok" }
	USSRWave10 = { "ttnk", "ttnk", "ttnk", "3tnk", "3tnk", "4tnk", "v2rl", "ftrk", "e3", "e3", "e4", "shok", "e3", "e3", "e4", "shok" }

	InfantryDelay = DateTime.Seconds(15)
	VehicleDelay = DateTime.Seconds(29)
	DefendTimer = DateTime.Minutes(20)
	GlobalDelay = DateTime.Minutes(1) --Time the AI will wait after successfully creating a team

end

	AlliedReinforcements = { "ctnk", "ctnk", "2tnk", "2tnk", "arty" }

	IronCurtainTypes = { "3tnk", "ttnk", "v2rl" }

	IronCurtainAttackUnits = 0
	Wave = 0

	ticked = DefendTimer

	ReinforcementsSent = false
	SiegeOver = false

	OilDerricks = { Actor272, Actor273 }
	PlayerRocketGuys = { Actor341, Actor342 }
	USSRAPCGuys = { Actor382, Actor383, Actor384, Actor385, Actor386 }
	USSRDefenses = { Actor116, Actor115, Actor114 }

ActorRemovals =
{
	easy = { Actor316, Actor340 },
	normal = { Actor316 },
	hard = { },
}

ParatroopersRallies1 = {
	ParatroopersRally1,
	ParatroopersRally2,
}

ParatroopersRallies2 = {
	ParatroopersRally3,
	ParatroopersRally4,
}

ParatroopersRallies3 = {
	ParatroopersRally5,
}

InsertionPath1 = { USSRReinforcementsEntry2.Location, USSRReinforcementsRally2.Location }
InsertionPath2 = { USSRReinforcementsEntry3.Location, USSRReinforcementsRally3.Location }
InsertionPath3 = { USSRReinforcementsEntry4.Location, USSRReinforcementsRally4.Location }

USSRInsertionPaths = {
	{ USSRReinforcementsEntry2.Location, USSRReinforcementsRally2.Location },
	{ USSRReinforcementsEntry3.Location, USSRReinforcementsRally3.Location },
	{ USSRReinforcementsEntry4.Location, USSRReinforcementsRally4.Location },
}

USSRAttackWaypoints = {
	USSRAttackPoint1,
	USSRAttackPoint2,
	USSRAttackPoint3,
}

USSRBottomRallies = {
	USSRReinforcementsEntry2,
	USSRReinforcementsEntry3,
	USSRReinforcementsEntry4,
}

-------------------------------------------------------------------------------------------------------------------------------------------------------------

Tick = function()
	if player.HasNoRequiredUnits() and not GameLost then
		GameLost = true
		ussr.MarkCompletedObjective(DestroyEnemies)
	end
	
	if ussr.HasNoRequiredUnits() and ussrpara.HasNoRequiredUnits() and SiegeOver and not GameWon then
		GameWon = true
		player.MarkCompletedObjective(DestroyAllEnemies)
		if not player.IsObjectiveCompleted(DefendBase) then
			player.MarkCompletedObjective(DefendBase)
		end
	end

	Trigger.AfterDelay(DateTime.Seconds(3), function()
		if ticked > 0 then
			UserInterface.SetMissionText("Reinforcements arrive in " .. Utils.FormatTime(ticked), player.Color)
			ticked = ticked - 1
		elseif ticked == 0 then
			ticked = ticked - 1
			DestroyAllEnemies = player.AddPrimaryObjective("Destroy all enemy forces in this area.")
			player.MarkCompletedObjective(DefendBase)
			SiegeOver = true

			FinishTimer()
		end
	end)

	if SiegeOver and not ReinforcementsSent then
		ReinforcementsSent = true
		Media.PlaySpeechNotification(player, "ReinforcementsArrived")
		
		Reinforcements.ReinforceWithTransport(player, "lst", AlliedReinforcements, InsertionPath1, { USSRReinforcementsEntry2.Location })
		Reinforcements.ReinforceWithTransport(player, "lst", AlliedReinforcements, InsertionPath2, { USSRReinforcementsEntry3.Location })
		Reinforcements.ReinforceWithTransport(player, "lst", AlliedReinforcements, InsertionPath3, { USSRReinforcementsEntry4.Location })
	end

	if ussr.Resources >= ussr.ResourceCapacity * 0.75 then
		ussr.Cash = ussr.Cash + ussr.Resources - ussr.ResourceCapacity * 0.25
		ussr.Resources = ussr.ResourceCapacity * 0.25
	end
end

FinishTimer = function()
	for i = 0, 5, 1 do
		local c = player.Color
		if i % 2 == 0 then
			c = HSLColor.White
		end

		Trigger.AfterDelay(DateTime.Seconds(i), function() UserInterface.SetMissionText("Reinforcements have arrived!", c) end)
		Trigger.AfterDelay(DateTime.Seconds(5), function() UserInterface.SetMissionText("") end)
	end
end

WorldLoaded = function()

	Actor348.Destroy()
	Actor349.Destroy()

	GameWon = false
	GameLost = false

	player = Player.GetPlayer("England")
	greece = Player.GetPlayer("Greece")
	ussr = Player.GetPlayer("USSR")
	ussrpara = Player.GetPlayer("USSRParas")

	Camera.Position = StartPosition.CenterPosition

	IdleUnitsLogic()
	IdleHuntPara()
	InitObjectives()
	Triggers()
	RemoveActors()
	RepairBase()
	EnterWaves()
	SendPatrols()

	Utils.Do(USSRAPCGuys, function(units)
		units.EnterTransport(Actor363)
	end)

	Utils.Do(PlayerRocketGuys, function(unit)
		unit.AttackMove(Actor323.Location, 10)
	end)

	Trigger.AfterDelay(DateTime.Seconds(3), function()
		Media.PlaySpeechNotification(player, "TimerStarted")
	end)

end

EnterWaves = function()

	Trigger.AfterDelay(DateTime.Seconds(50), function()--Wave1
		Media.PlaySpeechNotification(player, "SovietForcesApproaching")
		AttackTeam = USSRWave1
		SendUSSRAttackersTop()
	end)

	Trigger.AfterDelay(DateTime.Seconds(125), function()--Wave2
		AttackTeam = USSRWave2
		SendUSSRAttackersBottom()
		SendUSSRAttackersMid()
	end)

	Trigger.AfterDelay(DateTime.Seconds(180), function()--Wave3
		AttackTeam = USSRWave3
		SendUSSRAttackersMid()
	end)

	Trigger.AfterDelay(DateTime.Seconds(195), function()--Paratroopers1
		SendUSSRParatroopers()
	end)

	Trigger.AfterDelay(DateTime.Seconds(325), function()--Wave4
		Media.PlaySpeechNotification(player, "SovietForcesApproaching")
		AttackTeam = USSRWave4
		SendUSSRAttackersTop()
		SendUSSRAttackersMid()
		SendUSSRAttackersBottom()
	end)

	Trigger.AfterDelay(DateTime.Seconds(350), function()--Wave5 + Iron Curtain
		ironcurtainattack = Utils.Random(USSRAttackWaypoints)
		AttackTeam = USSRWave5
		SendSovietIronCurtain()
		SendUSSRAttackersTop()
	end)

	Trigger.AfterDelay(DateTime.Seconds(375), function()--Paratroopers2
		SendUSSRParatroopers()
	end)

	Trigger.AfterDelay(DateTime.Seconds(525),function()--Wave6 + Paratroopers3
		Media.PlaySpeechNotification(player, "SovietForcesApproaching")
		AttackTeam = USSRWave6
		SendUSSRAttackersMid()
		Trigger.AfterDelay(DateTime.Seconds(25), SendUSSRParatroopers)
	end)

	Trigger.AfterDelay(DateTime.Seconds(575),function()--Wave7
		AttackTeam = USSRWave7
		SendUSSRAttackersTop()
		SendUSSRAttackersBottom()
	end)

	Trigger.AfterDelay(DateTime.Seconds(675),function()
		InfantryProduction(Actor112)
		VehicleProduction(Actor113)
	end)

	Trigger.AfterDelay(DateTime.Seconds(775),function()--Wave8 + Iron Curtain /Last Wave on Easy/Normal
		ironcurtainattack = Utils.Random(USSRAttackWaypoints)
		Media.PlaySpeechNotification(player, "SovietForcesApproaching")
		AttackTeam = USSRWave8
		SendSovietIronCurtain()
		SendUSSRAttackersMid()
		SendUSSRAttackersTop()
		IronCurtainLoop()
	end)

	Trigger.AfterDelay(DateTime.Seconds(800), function()--Paratroopers4
		SendUSSRParatroopers()
	end)

	if Map.LobbyOption("difficulty") == "hard" then

		Trigger.AfterDelay(DateTime.Seconds(975), function()--Wave9
			Media.PlaySpeechNotification(player, "SovietForcesApproaching")
			AttackTeam = USSRWave9
			SendUSSRAttackersMid()
			SendUSSRAttackersBottom()
		end)

		Trigger.AfterDelay(DateTime.Seconds(1000), function()--Paratroopers5 + 6
			SendUSSRParatroopers()
			Trigger.AfterDelay(DateTime.Seconds(10), SendUSSRParatroopers)
		end)

		Trigger.AfterDelay(DateTime.Seconds(1110), function()--Wave10
			Media.PlaySpeechNotification(player, "SovietForcesApproaching")
			AttackTeam = USSRWave10
			SendUSSRAttackersBottom()
			SendUSSRAttackersMid()
			SendUSSRAttackersTop()
			Trigger.AfterDelay(DateTime.Seconds(25), SendUSSRParatroopers)
		end)

	end

end

IronCurtainLoop = function()
	ironcurtainattack = Utils.Random(USSRAttackWaypoints)
	SendSovietIronCurtain()
	Trigger.AfterDelay(DateTime.Seconds(225), IronCurtainLoop)
end

SendSovietIronCurtain = function()--A bit messy this one

	if Actor71.IsDead or ussr.PowerState ~= "Normal" then
		return
	else
		local team1 = { Utils.Random(IronCurtainTypes) }
		local team2 = { Utils.Random(IronCurtainTypes) }
		local team3 = { Utils.Random(IronCurtainTypes) }
		local team4 = { Utils.Random(IronCurtainTypes) }
		local team5 = { Utils.Random(IronCurtainTypes) }

		Trigger.AfterDelay(DateTime.Seconds(68), function()
			Media.PlaySpeechNotification(player, "IronCurtainCharging")
		end)

		Trigger.AfterDelay(DateTime.Seconds(1), function()
			Reinforcements.Reinforce(ussr, team1, { IronCurtainEntry1.Location, IronCurtainRally1.Location }, 1, function(unit1)
				IronCurtainLogic(unit1)
			end)
		end)

		Trigger.AfterDelay(DateTime.Seconds(1), function()
			Reinforcements.Reinforce(ussr, team2, { IronCurtainEntry2.Location, IronCurtainRally2.Location }, 1, function(unit2)
				IronCurtainLogic(unit2)
			end)
		end)

		Trigger.AfterDelay(DateTime.Seconds(1), function()
			Reinforcements.Reinforce(ussr, team3, { IronCurtainEntry3.Location, IronCurtainRally3.Location }, 1, function(unit3)
				IronCurtainLogic(unit3)
			end)
		end)

		if Map.LobbyOption("difficulty") == "normal" or Map.LobbyOption("difficulty") == "hard" then
			Trigger.AfterDelay(DateTime.Seconds(1), function()
				Reinforcements.Reinforce(ussr, team4, { IronCurtainEntry4.Location, IronCurtainRally4.Location }, 1, function(unit4)
					IronCurtainLogic(unit4)
				end)
			end)
		end
		if Map.LobbyOption("difficulty") == "hard" then
			Trigger.AfterDelay(DateTime.Seconds(1), function()
				Reinforcements.Reinforce(ussr, team5, { IronCurtainEntry5.Location, IronCurtainRally5.Location }, 1, function(unit5)
					IronCurtainLogic(unit5)
				end)
			end)
		end
	end

end

IronCurtainLogic = function(unit)
	if not unit.IsDead then
		unit.AttackMove(ironcurtainattack.Location)
		Trigger.AfterDelay(DateTime.Seconds(65), function()
			if not unit.IsDead and unit.IsInWorld then
				Trigger.OnIdle(unit, function()
					unit.Hunt()
				end)
			end
		end)
	end
	Trigger.AfterDelay(DateTime.Seconds(65), function()
		if not unit.IsDead and unit.IsInWorld then
			unit.GrantCondition("invulnerability", DateTime.Seconds(35))
		end
	end)

end

SendUSSRParatroopers = function()

	if SiegeOver then
		return
	else
		parasrally1 = Utils.Random(ParatroopersRallies1)
		parasrally2 = Utils.Random(ParatroopersRallies2)
		parasrally3 = Utils.Random(ParatroopersRallies3)

		local powerproxy1 = Actor.Create("powerproxy.paras1", false, { Owner = ussrpara })
		local powerproxy2 = Actor.Create("powerproxy.paras2", false, { Owner = ussrpara })
		local powerproxy3 = Actor.Create("powerproxy.paras3", false, { Owner = ussrpara })
		local unitsA = powerproxy1.ActivateParatroopers(parasrally1.CenterPosition,Facing.South)
		local unitsB = powerproxy2.ActivateParatroopers(parasrally2.CenterPosition,Facing.South)
		if Map.LobbyOption("difficulty") == "hard" then
			local unitsC = powerproxy3.ActivateParatroopers(parasrally3.CenterPosition,Facing.South)
		end

		powerproxy1.Destroy()
		powerproxy2.Destroy()
		powerproxy3.Destroy()
	end

end

SendUSSRAttackersTop = function()

	if SiegeOver then
		return
	else
		local team = AttackTeam

		Trigger.AfterDelay(DateTime.Seconds(1), function()
			Reinforcements.Reinforce(ussr, AttackTeam, { USSRReinforcementsEntry1.Location, USSRReinforcementsRally1.Location }, 5, function(actor)
				if not actor.IsDead then
					actor.AttackMove(USSRAttackPoint1.Location)
					Trigger.OnIdle(actor, function()
						actor.Hunt()
					end)
				end
			end)
		end)
	end

end

SendUSSRAttackersMid = function()

	if SiegeOver then
		return
	else
		local team = AttackTeam

		Trigger.AfterDelay(DateTime.Seconds(1), function()
			Reinforcements.Reinforce(ussr, AttackTeam, { USSRReinforcementsEntry1.Location, USSRReinforcementsRally1.Location }, 5, function(actor)
				if not actor.IsDead then
					actor.AttackMove(USSRAttackPoint2.Location)
					Trigger.OnIdle(actor, function()
						actor.Hunt()
					end)
				end
			end)
		end)
	end

end

SendUSSRAttackersBottom = function()

	if SiegeOver then
		return
	else
		local team = AttackTeam
		local insertionpath = Utils.Random(USSRInsertionPaths)
		local waypointend = Utils.Random(USSRBottomRallies)

		Trigger.AfterDelay(DateTime.Seconds(1), function()
			Reinforcements.Reinforce(ussr, AttackTeam, { USSRReinforcementsEntry5.Location, USSRReinforcementsRally5.Location }, 5, function(actor)
				if not actor.IsDead then
					actor.AttackMove(USSRAttackPoint3.Location)
					Trigger.OnIdle(actor, function()
						actor.Hunt()
					end)
				end
			end)
		end)
	end

end

InitObjectives = function()
	Trigger.OnObjectiveAdded(player, function(p, id)
		Media.DisplayMessage(p.GetObjectiveDescription(id), "New " .. string.lower(p.GetObjectiveType(id)) .. " objective")
	end)

	DestroyEnemies = ussr.AddPrimaryObjective("Destroy all enemy forces.")
	DefendBase = player.AddPrimaryObjective("Defend the base until reinforcements arrive.")
	DestroyIronCurtain = player.AddSecondaryObjective("Destroy the iron curtain in this area.")
	CaptureOilDerricks = player.AddSecondaryObjective("Capture all oil derricks in this area.")
	CaptureAndDefendHosp = player.AddSecondaryObjective("Capture and defend the Hospital.")

	Trigger.OnObjectiveCompleted(player, function(p, id)
		Media.DisplayMessage(p.GetObjectiveDescription(id), "Objective completed")
	end)
	Trigger.OnObjectiveFailed(player, function(p, id)
		Media.DisplayMessage(p.GetObjectiveDescription(id), "Objective failed")
	end)

	Trigger.OnPlayerLost(player, function()
		Trigger.AfterDelay(DateTime.Seconds(1), function()
			Media.PlaySpeechNotification(player, "MissionFailed")
		end)
	end)
	Trigger.OnPlayerWon(player, function()
		Trigger.AfterDelay(DateTime.Seconds(1), function()
			Media.PlaySpeechNotification(player, "MissionAccomplished")
		end)
	end)
end

RemoveActors = function()
	Utils.Do(ActorRemovals[Map.LobbyOption("difficulty")], function(unit)
		unit.Destroy()
	end)
end

Triggers = function ()

	Trigger.OnAllKilledOrCaptured(OilDerricks, function()
		if not Actor272.IsDead and not Actor273.IsDead then
			player.MarkCompletedObjective(CaptureOilDerricks)
		end
	end)

	Trigger.OnAnyKilled(OilDerricks, function()
		if not player.IsObjectiveCompleted(CaptureOilDerricks) then
			player.MarkFailedObjective(CaptureOilDerricks)
		end
	end)

	Trigger.OnKilled(Actor71, function()
		player.MarkCompletedObjective(DestroyIronCurtain)
	end)

	Trigger.OnCapture(Actor214, function()
		player.MarkCompletedObjective(CaptureAndDefendHosp)
	end)

	Trigger.OnKilled(Actor214, function()
		player.MarkFailedObjective(CaptureAndDefendHosp)
	end)

	Trigger.OnDamaged(Actor363, function()
		if Actor363.HasPassengers then
			Actor363.Stop()
			Actor363.UnloadPassengers()
		end
	end)

	Trigger.OnAllKilled(USSRDefenses, IdlingUnitsRedAlert)

	Trigger.AfterDelay(DateTime.Seconds(3), function()
		if Map.LobbyOption("difficulty") == "hard" then
			Trigger.AfterDelay(DateTime.Minutes(10), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "TenMinutesRemaining") end
			end)
			Trigger.AfterDelay(DateTime.Minutes(15), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "WarningFiveMinutesRemaining") end
			end)
			Trigger.AfterDelay(DateTime.Minutes(16), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "WarningFourMinutesRemaining") end
			end)
			Trigger.AfterDelay(DateTime.Minutes(17), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "WarningThreeMinutesRemaining") end
			end)
			Trigger.AfterDelay(DateTime.Minutes(18), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "WarningTwoMinutesRemaining") end
			end)
			Trigger.AfterDelay(DateTime.Minutes(19), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "WarningOneMinuteRemaining") end
			end)
		elseif Map.LobbyOption("difficulty") ~= "hard" then
			Trigger.AfterDelay(DateTime.Minutes(5), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "TenMinutesRemaining") end
			end)
			Trigger.AfterDelay(DateTime.Minutes(10), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "WarningFiveMinutesRemaining") end
			end)
			Trigger.AfterDelay(DateTime.Minutes(11), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "WarningFourMinutesRemaining") end
			end)
			Trigger.AfterDelay(DateTime.Minutes(12), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "WarningThreeMinutesRemaining") end
			end)
			Trigger.AfterDelay(DateTime.Minutes(13), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "WarningTwoMinutesRemaining") end
			end)
			Trigger.AfterDelay(DateTime.Minutes(14), function()
				if not TimerAborted then Media.PlaySpeechNotification(player, "WarningOneMinuteRemaining") end
			end)
		end
	end)

end
