require 'origin.common'
require 'halcyon.PartnerEssentials'
require 'halcyon.GeneralFunctions'
require 'halcyon.CharacterEssentials'

metano_inn_ch_5 = {}

function metano_inn_ch_5.SetupGround()
	local corvisquire, nidoqueen, nidoran_m, nidoking = 
		CharacterEssentials.MakeCharactersFromList({
			{'Corvisquire', 152, 200, Direction.UpLeft},
			{'Nidoqueen', 'Innkeeper_Right'},--Nidoqueen's spot 
			{'Nidoran_M', 240, 128, Direction.DownRight},
			{'Nidoking', 'Innkeeper_Left'}--Nidoking's spot
		})
	
	AI:SetCharacterAI(corvisquire, "halcyon.ai.ground_default", RogueElements.Loc(136, 184), RogueElements.Loc(32, 32), 1, 16, 64, 40, 180)
	AI:SetCharacterAI(nidoran_m, "halcyon.ai.ground_default", RogueElements.Loc(224, 112), RogueElements.Loc(32, 32), 1, 16, 64, 40, 180)

	GAME:FadeIn(20)
end

--Cory cracking lame jokes
function metano_inn_ch_5.Passerby_1_Action(chara, activator)
	GeneralFunctions.StartConversation(chara, "Seems like everyone in town is CROW-ing about some sort of guild expedition.", "Happy")
	UI:SetSpeakerEmotion("Inspired")
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI5_001']))
	UI:SetSpeakerEmotion("Joyous")
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI5_002']))
	--GAME:WaitFrames(20)
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI5_003']))
	GeneralFunctions.EndConversation(chara)
	--The whole town seems extra busy today! What's everyone CROWING about?
	--Hmm, looks like nobody's INN
	--proceed with caw tion on the expedition
	--Hope they find something pretty FLY!
	--Birds of a feather?
	--They seem talon-ted
end



function metano_inn_ch_5.Nidoran_M_Action(chara, activator)
	GeneralFunctions.StartConversation(chara, "Inneeways!")
	GeneralFunctions.EndConversation(chara)
end


function metano_inn_ch_5.Innkeeper_Desk_Right_Action(chara, activator) 
	local nidoqueen = CH('Nidoqueen')
	GeneralFunctions.StartConversation(nidoqueen, "I'm startin' to worry about my littlest one.", "Worried")
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI5_004']))
	GeneralFunctions.EndConversation(nidoqueen)
end

function metano_inn_ch_5.Innkeeper_Desk_Left_Action(chara, activator) 
	local nidoking = CH('Nidoking')
	GeneralFunctions.StartConversation(nidoking, "Business been a bit slow as of late...[pause=0] Seems like we only get one 'er so guests a day!", "Worried")
	UI:WaitShowDialogue(STRINGS:Format(STRINGS.MapStrings['MI5_005']))
	GeneralFunctions.EndConversation(nidoking)	
end