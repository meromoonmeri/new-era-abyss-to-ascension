require 'origin.common'
require 'halcyon.PartnerEssentials'
require 'halcyon.GeneralFunctions'
require 'halcyon.CharacterEssentials'

metano_normal_home_ch_2 = {}

function metano_normal_home_ch_2.SetupGround()
	if not SV.Chapter2.FinishedFirstDay then 
		local linoone, sentret  = 
			CharacterEssentials.MakeCharactersFromList({
				{'Linoone', 202, 166, Direction.Left},
				{'Sentret', 256, 116, Direction.Down}
			})
		
		GROUND:CharSetAnim(sentret, "Sleep", true)
	
	else 
		local furret = 
			CharacterEssentials.MakeCharactersFromList({
				{'Furret', 136, 166, Direction.Right}
			})
		
	end
	
	GAME:FadeIn(20)
end

function metano_normal_home_ch_2.Linoone_Action(chara, activator)
	GeneralFunctions.StartConversation(chara, "It's always a nice break when " .. CH('Sentret'):GetDisplayName() .. " goes down for his nap.")
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MNH2_001']))
	GeneralFunctions.EndConversation(chara)
end 


function metano_normal_home_ch_2.Sentret_Action(chara, activator)
	local linoone = CH('Linoone')
	local hero = CH('PLAYER')
	local partner = CH('Teammate1')
	local olddir = linoone.Direction
	partner.IsInteracting = true
	
	GROUND:CharSetAnim(partner, "None", true)
	GROUND:CharSetAnim(hero, "None", true)
	GROUND:CharSetAnim(linoone, "None", true)
	UI:SetSpeaker(linoone)
	UI:SetSpeakerEmotion("Normal")
	GeneralFunctions.EmoteAndPause(linoone, "Exclaim", true)
	GROUND:CharTurnToCharAnimated(linoone, hero, 4)
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MNH2_002']))
	
	GeneralFunctions.DuoTurnTowardsChar(linoone)
	
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MNH2_003'], CharacterEssentials.GetCharacterName('Sentret')))
	
	GAME:WaitFrames(20)
	UI:SetSpeaker(partner)
	GROUND:CharSetEmote(partner, "sweating", 1)
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MNH2_004']))
	GROUND:CharAnimateTurnTo(linoone, olddir, 4)
	
	GROUND:CharEndAnim(partner)
	GROUND:CharEndAnim(hero)
	GROUND:CharEndAnim(linoone)
	partner.IsInteracting = false
end



function metano_normal_home_ch_2.Furret_Action(chara, activator)
	if SV.Chapter2.EnteredRiver then 
		GeneralFunctions.StartConversation(chara, "Still no sign of " .. CharacterEssentials.GetCharacterName("Numel") .. "...[pause=0] I sure hope he's found soon...","Worried")
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MNH2_005']))
	else
		GeneralFunctions.StartConversation(chara, CharacterEssentials.GetCharacterName("Camerupt") .. " came here earlier asking if I had seen " .. CharacterEssentials.GetCharacterName("Numel") .. " this morning.", "Worried")
		UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MNH2_006']))
	end 
	GeneralFunctions.EndConversation(chara)
end 